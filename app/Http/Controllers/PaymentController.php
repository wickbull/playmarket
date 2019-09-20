<?php

namespace App\Http\Controllers;

use App\Events\NewEventCount;
use App\Models\Invoice;
use App\Models\Payout;
use App\Models\SiteWallet;
use App\Models\Trade;
use App\Packages\Payment\FreeKassaPayment;
use App\Packages\Payment\QiwiPayment;
use App\Packages\Payment\QiwiPayout;
use App\Traits\ChatTrait;
use App\User;
use baibaratsky\WebMoney\Api\X\X18;
use baibaratsky\WebMoney\Api\X\X2;
use baibaratsky\WebMoney\Request\Requester\CurlRequester;
use baibaratsky\WebMoney\Signer;
use baibaratsky\WebMoney\WebMoney;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Omnipay\Omnipay;
use Session;
use UnitPay;
use YandexMoney\API;
use YandexMoney\ExternalPayment;

class PaymentController extends Controller
{
    use ChatTrait;

    /**
     * @var Invoice Model
     */
    protected $invoice;
    /**
     * @var SiteWallet Model
     */
    protected $siteWallet;
    /**
     * @var string Notification Email
     */
    protected $notification_email = 'pilkoandriy94@gmail.com';


    /**
     *  Ошибка валюты
     */
    const CURRENCY_ERROR = "Ошибка валюты. Валюта сделки не найдена.";
    /**
     *  Ошибка платежа
     */
    const INVOICE_NOT_FOUND_ERROR = "Ошибка платежа. Платеж с таким номером не найдет.";
    const INVOICE_OWNER_ERROR = "Ошибка платежа.  Данный платеж не принадлежит этому аккаунту.";
    /**
     * Ошибка платженых данных
     */
    const PAYMENT_KEY = "Ошибка платежных данных. Не найдены ключи платежной системы: ";


    /**
     * PaymentController constructor.
     */
    public function __construct()
    {
        $this->invoice = new Invoice();
        $this->siteWallet = new siteWallet();
    }

    /**
     * Create invoice
     *
     * @param Trade $trade Model
     * @param Request $request
     * @param string $type Type of payment
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     * @throws \Exception
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function createInvoice(Trade $trade, Request $request, $type)
    {
        $transactionId = $this->generateTransactionId($trade);

        $invoice = Invoice::create([
            'invoice_id' => $transactionId,
            'price' => $trade->price,
            'currency_id' => $trade->payment_id,
            'trade_id' => $trade->id,
            'user_id' => auth()->id(),
            'status' => 0,
            'type' => 'in',
            'payment_type' => $type,
        ]);

        if ($type === 'wmr' || $type === 'wmz' || $type === 'wmu' || $type === 'wme') return $this->paymentWebmoney($transactionId, $request);
        elseif ($type === 'card') return $this->paymentYandexMoney($transactionId, 'AC');
        elseif ($type === 'yandex_money') return $this->paymentYandexMoney($transactionId);
        elseif ($type === 'qiwi') return $this->paymentQiwiPhone($transactionId);
        elseif ($type === 'phone_operator') {
            $invoice->update(['payment_type' => 'phone']);
            return $this->paymentFreekassa($transactionId);
        }
    }




    /*
     * ==============================================================================================
     *  FREEKASSA PAYMENT
     * ==============================================================================================
     */


    /**
     * Freekassa payment requset created
     *
     * API Docs: http://www.free-kassa.ru/docs/api.php
     *
     * @param integer|string $transactionId ID of transaction
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @throws \Exception Payment key non exists
     * @throws \Exception Currency non exists
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function paymentFreekassa($transactionId)
    {
        $invoice = $this->invoice->getByTransactionId($transactionId);
        $key = $this->siteWallet->getByKeyword('freekassa');

        if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'Freekassa.');
        if (empty($invoice->currency)) throw new \Exception(self::CURRENCY_ERROR);

        $gateway = new FreeKassaPayment($key->api_key, Crypt::decrypt($key->secret_key), Crypt::decrypt($key->additional_field));

        if ($invoice->payment_type == 'phone')
            $setting = [
                'amount' => $invoice->price,
                'orderID' => $transactionId,
                'email' => auth()->user()->email,
            ];
        else
            $setting = [
                'amount' => $invoice->price,
                'orderID' => $transactionId,
                'email' => auth()->user()->email,
                'currency' => '94'
            ];

        return $gateway->payment($setting);
    }


    /**
     * Freekassa confirmation
     *
     * API Docs: http://www.free-kassa.ru/docs/api.php
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function paymentFreekassaConfirmation(Request $request)
    {
        if ($request->has('MERCHANT_ORDER_ID')) {
            $invoice = Invoice::where('invoice_id', $request->MERCHANT_ORDER_ID)->first();
            if (!empty($invoice)) {
                $key = $this->siteWallet->getByKeyword('freekassa');
                $gateway = new FreeKassaPayment($key->api_key, Crypt::decrypt($key->secret_key), Crypt::decrypt($key->additional_field));
                $payment = $gateway->checkOrder($request->MERCHANT_ORDER_ID, $request->intid);
                if (!empty($payment) && $payment->status == 'completed') $this->completePaymentFull($invoice);
            }
            return view('trade.transaction-success');
        }
        return view('trade.transaction-success');

    }

    /**
     * Freekassa fail
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function paymentFreekassaFail(Request $request)
    {
        return view('trade.transaction-fail');
    }

    /*
    * ==============================================================================================
    *  WEBMONEY PAYMENT
    * ==============================================================================================
    */


    /**
     * Webmoney request create
     *
     * API: https://github.com/dercoder/omnipay-webmoney
     *
     * @param null $transactionId
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View
     * @throws \Exception Payment key non exists
     * @throws \Exception Currency non exists
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function paymentWebmoney($transactionId = null, Request $request)
    {
        $invoice = $this->invoice->getByTransactionId($transactionId);
        $key = $this->siteWallet->getByKeyword($invoice->currency->keyword);

        if (empty($invoice->currency)) throw new \Exception(self::CURRENCY_ERROR);
        if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'WM.');

        $gateway = Omnipay::create('WebMoney');


        $gateway->setWebMoneyId($key->api_key);
        $merchantPurse = strtoupper(substr($invoice->currency->keyword, -1));// GET Currency (R,Z,E,U)
        $gateway->setMerchantPurse($merchantPurse);
        $gateway->setSecretKey($key->api_key);

        /*
         * Currency
         */
        $currency = 'RUB';
        if ($merchantPurse === 'Z') $currency = 'USD';
        elseif ($merchantPurse === 'E') $currency = 'EUR';
        elseif ($merchantPurse === 'U') $currency = 'UAH';

        $trade = $invoice->trade;

        $settings = [
            'webMoneyId' => $key->api_key,
            'merchantPurse' => $key->wallet_key,
            'returnUrl' => route('webmoney-confirmation'),
            'cancelUrl' => route('payment-fail'),
            'notifyUrl' => "mailto:{$this->notification_email}",
            'returnMethod' => 'POST',
            'cancelMethod' => 'POST',
            'description' => $this->getPaymentDescription($trade),
            'transactionId' => $transactionId,
            'amount' => number_format($trade->price, 2, '.', ''),
            'currency' => $currency,
        ];

        if ($invoice->status == 3) $response = $gateway->completePurchase()->send();
        else $response = $gateway->purchase($settings)->send();

        if ($response->isSuccessful()) {
            \Log::info('Webmoney complete');
            if ($invoice->status != 1) {
                $invoice->status = $request->LMI_SYS_TRANS_NO != null ? 1 : 2;
                $invoice->save();
                if (!empty($invoice)) $this->completePaymentFull($invoice);
                return view('trade.transaction-success');
            }
            // redirect to offsite payment gateway
        } elseif ($response->isRedirect()) {
            $invoice->update([
                'status' => '3',
            ]);
            return redirect($response->redirect());
        } else {
            $invoice->update([
                'status' => '2',
                'payment_detail' => $response->getMessage()
            ]);
            Session::flash('flash_message_error', $response->getMessage());
            return redirect()->route('user-profile');
        }
    }


    /**
     * Webmoney payment complete
     *
     * API: https://github.com/baibaratsky/php-webmoney
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @throws \Exception Payment key non exists
     * @throws \Exception Currency non exists
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function paymentWebmoneyComplete(Request $request)
    {
        if ($request->has('LMI_PAYMENT_NO')) {
            $invoiceId = $request->LMI_PAYMENT_NO;
            \Log::info($request->all());
            $invoice = Invoice::where('invoice_id', $invoiceId)->first();
            $key = $this->siteWallet->getByKeyword('wmr_out');
            $payment_key = $this->siteWallet->getByKeyword($invoice->currency->keyword);


            if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'WM.');
            if (empty($invoice->currency)) throw new \Exception(self::CURRENCY_ERROR);

            $webMoney = new WebMoney(new CurlRequester);
//
            $request = new X18\Request(X18\Request::AUTH_SECRET_KEY, $payment_key->api_key);
            $request->setSignerWmid($key->api_key);
            $request->setPaymentNumber($invoiceId);
            $request->setPayeePurse($payment_key->wallet_key);

            $request->sign();

            if ($request->validate()) {
                /** @var X18\Response $response */
                $response = $webMoney->request($request);
                if ($response->getReturnCode() == 0 && !empty($invoice)) $this->completePaymentFull($invoice);
                else {
                    \Log::info([request()->id(), $response]);
                    $invoice->update([
                        'status' => '2',
                        'payment_detail' => $response->getReturnDescription()
                    ]);
                    return view('trade.transaction-fail');
                }
            }
        }
        return view('trade.transaction-success');
    }

    /**
     * Webmoney confirmation
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function webmoneyConfirmation(Request $request)
    {
        return view('trade.transaction-success');
    }


    /**
     * Webmoney Payout
     *
     * API: https://github.com/baibaratsky/php-webmoney
     *
     * @param Payout $payout
     * @return \Illuminate\Http\RedirectResponse
     * @throws \baibaratsky\WebMoney\Exception\ApiException
     * @throws \baibaratsky\WebMoney\Exception\CoreException
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function payoutWebmoney(Payout $payout)
    {
        $key = $this->siteWallet->getByKeyword('wmr_out');

        if (empty($payout->currency)) throw new \Exception(self::CURRENCY_ERROR);
        if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'WM Out.');

        $webMoney = new WebMoney(new CurlRequester);

        $request = new X2\Request;
        $request->setSignerWmid($key->api_key);
        $request->setTransactionExternalId($payout->id); // Unique ID of the transaction in your system
        $request->setPayerPurse($key->wallet_key);
        $request->setPayeePurse($payout->wallet);
        $request->setAmount(number_format($payout->amount, 2, '.', '')); // Payment amount
        $request->setDescription('Вывод денег email: ' . $payout->user->email . ' id: ' . $payout->user->id . ' Дата:' . Carbon::now()->format('d.m.Y G:i:s') . ' Админ: ' . auth()->user()->name);

        $request->sign(new Signer($key->api_key, storage_path('webmoney/236312820801.kwm'), Crypt::decrypt($key->secret_key)));


        if ($request->validate()) {
            /** @var Response $response */
            $response = $webMoney->request($request);

            if ($response->getReturnCode() === 0) {
                $payout->admin_id = auth()->id();
                $payout->confirm_date = Carbon::now();
                $payout->payment_info = isset($request->transactionId) ? $request->transactionId : null;
                $payout->status = '1';
                $payout->frozen = '0';
                $payout->save();
                $invoice = Invoice::where('invoice_id', 'payout-' . $payout->id)->first();
                if (!empty($invoice)) {
                    $invoice->status = '1';
                    $invoice->payment_date = Carbon::now();
                    $invoice->save();
                }
                return back()->with('flash_message_success', 'Вывод успешно проведено');
            } else {
                echo 'Error: ' . $response->getReturnDescription();
                dd($response);
            }
        }
    }



    /*
   * ==============================================================================================
   *  Yandex PAYMENT
   * ==============================================================================================
   */

    /**
     * Yandex payment create
     *
     * API: https://github.com/yandex-money/yandex-money-cms-omnipay
     *
     * @param integer|string $transactionId ID of transaction
     * @param string $type Type of transaction (PC or AC)
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception Payment key non exists
     * @throws \Exception Currency non exists
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function paymentYandexMoney($transactionId, $type = 'PC')
    {
        $invoice = $this->invoice->getByTransactionId($transactionId);
        $key = $this->siteWallet->getByKeyword('yandex_money');

        if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'Yandex Money.');
        if (empty($invoice->currency)) throw new \Exception(self::CURRENCY_ERROR);

        $gateway = Omnipay::create('\yandexmoney\YandexMoney\GatewayIndividual');
        $gateway->setAccount($key->wallet_key);
        $gateway->setLabel('Оплата услуг на - ' . config('app.name'));
        $gateway->setPassword(Crypt::decrypt($key->additional_field));
        $gateway->setOrderId($transactionId);
        $gateway->setMethod($type);
        $gateway->setReturnUrl(route('yandex-confirmation'));
        $gateway->setCancelUrl(route('payment-fail'));


        $trade = $invoice->trade;

        if ($invoice->status == 0) {
            $settings = [
                'amount' => number_format($trade->price, 2, '.', ''),
                'currency' => 'RUB',
                'FormComment' => $this->getPaymentDescription($trade),
            ];

            $response = $gateway->purchase($settings)->send();
        } else $response = $gateway->completePurchase()->send();

        if ($response->isRedirect()) $response->redirect();
        elseif ($response->isSuccessful()) {
            if ($invoice != 1) {
                $trade->update([
                    'is_payed' => '1'
                ]);
                $invoice->update([
                    'status' => '1'
                ]);
                $this->notification($trade);
            }
        } else {
            if ($invoice != 1) {
                $invoice->update([
                    'status' => '2',
                    'payment_detail' => $response->getMessage()
                ]);
                Session::flash('flash_message_error', $response->getMessage());
                return redirect()->route('user-profile');
            }
        }
    }


    /**
     * Yandex confirmation
     *
     * API: https://github.com/yandex-money/yandex-money-cms-omnipay
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function yandexConfirmation(Request $request)
    {
        if ($request->has('operation_id')) {
            $key = $this->siteWallet->getByKeyword('yandex_money');
            $api = new API(Crypt::decrypt($key->secret_password));
            // Check operation detail
            $detail = $api->operationDetails($request->operation_id);
            if (!empty($detail) && !empty($detail->status) && $detail->status == 'success') {
                $invoice = Invoice::where('invoice_id', $request->label)->first();
                if (!empty($invoice)) {
                    $invoice->payment_detail = 'operation_label: ' . isset($request->operation_label) ? $request->operation_label : null .
                    ' operation_id: ' . isset($request->operation_id) ? $request->operation_id : null;
                    $invoice->save();
                    $this->completePaymentFull($invoice);
                }
            }

        }
        return view('trade.transaction-success');

    }

    /**
     * Yandex complete
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function paymentYandexComplete(Request $request)
    {
        return view('trade.transaction-success');
    }

    /**
     * Yandex OAUTH function (Get access token)
     *
     * API Docs: https://tech.yandex.ru/money/doc/dg/tasks/register-client-docpage/
     * API: https://github.com/yandex-money/yandex-money-sdk-php/
     *
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception Payment key non exists
     * @throws \Exception Currency non exists
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function yandexOauth(Request $request)
    {
        $key = $this->siteWallet->getByKeyword('yandex_money');

        if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'Yandex Money.');

        if ($request->has('code')) {
            $access_token_response = API::getAccessToken($key->api_key, $request->code, route('yandex-oauth'), Crypt::decrypt($key->secret_key));

            if (!empty($access_token_response)) {
                $access_token = $access_token_response->access_token;
                $key->secret_password = Crypt::encrypt($access_token);
                $key->save();
            }
        }
        return redirect()->route('home');
    }


    /**
     * Yandex Payout
     *
     * API Docs: https://tech.yandex.ru/money/doc/dg/tasks/register-client-docpage/
     * API: https://github.com/yandex-money/yandex-money-sdk-php/
     *
     * @param Payout $payout
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception Payment key non exists
     * @throws \Exception Currency non exists
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function payoutYandex(Payout $payout)
    {
        $key = $this->siteWallet->getByKeyword('yandex_money');

        if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'Yandex.');
        if (empty($payout->currency)) throw new \Exception(self::CURRENCY_ERROR);

        $api = new API(Crypt::decrypt($key->secret_password));

        if ($payout->currency->keyword == 'card') {
            if (empty($key->additional_field2)) {
                $response = ExternalPayment::getInstanceId($key->api_key);
                if ($response->status == 'success') $key->update(['additional_field2' => $response->instance_id]);
                else throw new \Exception($response->error);
            }

            // make instance
            $external_payment = new ExternalPayment($key->additional_field2);

            $payment_options = array(
                'pattern_id' => 'p2p',
                'to' => $payout->wallet,
                'instance_id' => $key->additional_field2,
                'amount' => $payout->amount,
                'comment' => 'Вывод денег email: ' . $payout->user->email . ' id: ' . $payout->user->id . ' Дата:' . Carbon::now()->format('d.m.Y G:i:s') . ' Админ: ' . auth()->user()->name,
                'message' => 'Вывод денег - ' . route('home'),
                'label' => 'Вывод денег - ' . route('home'),
            );

            $process_payment = $external_payment->request($payment_options);

            if ($process_payment->status == 'success') $request_id = $process_payment->request_id;
            else throw new \Exception($response->message);

        } else {

            // make request payment
            $request_payment = $api->requestPayment(array(
                'pattern_id' => 'p2p',
                'to' => $payout->wallet,
                'amount_due' => $payout->amount,
                'comment' => 'Вывод денег email: ' . $payout->user->email . ' id: ' . $payout->user->id . ' Дата:' . Carbon::now()->format('d.m.Y G:i:s') . ' Админ: ' . auth()->user()->name,
                'message' => 'Вывод денег - ' . route('home'),
                'label' => 'Вывод денег - ' . route('home'),
            ));

            if ($request_payment->status == 'refused') throw new \Exception($request_payment->error_description);

            $process_payment = $api->processPayment(array(
                'request_id' => $request_payment->request_id,
            ));
        }
        if ($process_payment->status == 'success') {
            $payout->admin_id = auth()->id();
            $payout->confirm_date = Carbon::now();
            $payout->payment_info = isset($process_payment->request_id) ? $process_payment->request_id : null;
            $payout->status = '1';
            $payout->frozen = '0';
            $payout->save();
            $invoice = Invoice::where('invoice_id', 'payout-' . $payout->id)->first();
            if (!empty($invoice)) {
                $invoice->status = '1';
                $invoice->payment_date = Carbon::now();
                $invoice->save();
            }
            return back()->with('flash_message_success', 'Вывод успешно проведено');
        }
        return back()->with('flash_message_error', 'Ошибка вывода');
    }




    /*
     * ==============================================================================================
     *  QIWI PAYMENT
     * ==============================================================================================
     */


    /**
     * View of QIWI Transaction
     *
     * @param integer|string $transactionId ID of transaction
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function paymentQiwiPhone($transactionId)
    {
        $invoice = $this->invoice->getByTransactionId($transactionId);
        $trade = $invoice->trade;
        $invoice->update(['status' => -1]);
        return view('vendor.qiwi.payment_form', compact('trade', 'transactionId'));

    }

    /**
     * Make Qiwi request
     *
     * API Docs: https://static.qiwi.com/ru/doc/ishop/protocols/OnlineStoresProtocols_REST.pdf
     *
     * @param Request $request
     * @param integer|string $transactionId ID of transaction
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception Payment key non exists
     * @throws \Exception Currency non exists
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function paymentQiwi(Request $request, $transactionId)
    {
        $this->validate($request, [
            'phone' => 'required|min:6|max:20',
        ]);

        $invoice = $this->invoice->getByTransactionId($transactionId);
        $key = $this->siteWallet->getByKeyword($invoice->currency->keyword);

        if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'Qiwi.');
        if (empty($invoice->currency)) throw new \Exception(self::CURRENCY_ERROR);

        $gateway = new QiwiPayment($key->api_key, Crypt::decrypt($key->secret_key));
        $trade = $invoice->trade;

        $response = $gateway->create(
            preg_replace('/\D/', '', $request->phone),
            $invoice->price, // сумма
            date('Y-m-d', strtotime(date('Y-m-d') . " + 1 DAY")) . "T00:00:00", // Дата в формате ISO 8601. Здесь генерируется дата на день позже, чем текущая
            $transactionId, // ID платежа
            $this->getPaymentDescription($trade)
        );

        if ($response->result_code !== 0) {
            \Log::error(['QIWI' => $response->result_code]);
            if ($response->result_code == 303) return redirect()->route('payment-fail')->with('flash_message_error', 'Не верный номер телефона в профиле. Необходимо заполнить код страны (+7хх - для России, +30хх - для Украины)');
            return redirect()->route('payment-fail');
        }

        $invoice->update(['status' => 0]);

        $gateway->payout(
            $transactionId, // ID счета
            route('qiwi-confirmation'),// URL, на который пользователь будет переброшен в случае успешного проведения операции (не обязательно)
            route('payment-fail') // URL, на который пользователь будет переброшен в случае неудачного завершения операции (не обязательно)
        );

        $info_result = $gateway->info($transactionId);
        if ($info_result->result_code !== 0) throw new \Exception($info_result->bill->status);
    }


    /**
     * @param Request $request
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function qiwiConfirmation(Request $request)
    {
        if ($request->has('order') || $request->has('command')) {
            $key = $this->siteWallet->getByKeyword('qiwi');
            $gateway = new QiwiPayment($key->api_key, Crypt::decrypt($key->secret_key));
        }
        if ($request->has('order')) $orderID = $request->order;
        if ($request->has('command') && $request->has('bill_id')) $orderID = $request->bill_id;
        if (isset($orderID)) $response = $gateway->info($orderID);
        if (!empty($response) && isset($response->bill) && $response->bill->status == 'paid') {
            $invoice = Invoice::where('invoice_id', $orderID)->first();
            if (!empty($invoice)) {
                $this->completePaymentFull($invoice);
                if ($request->has('command') && $request->has('bill_id')) {
                    $newsXML = new \SimpleXMLElement('<result></result>');
                    $newsXML->addChild('result_code', 0);
                    return response($newsXML->asXML(), 200)->header('Content-type', 'text/xml');
                }
            }
        }
        if ($request->has('order')) return view('trade.transaction-success');
    }

    public function checkQiwiPayment(Request $request)
    {
        $this->validate($request, [
            'orderID' => 'required|numeric|exists:invoices,invoice_id',
        ]);

        $invoice = Invoice::where('invoice_id', $request->orderID)->first();
        if (empty($invoice)) throw  new \Exception(self::INVOICE_NOT_FOUND_ERROR);
//        if ($invoice->user_id != auth()->id() ) throw  new \Exception(self::INVOICE_OWNER_ERROR);
        if ($invoice->status == '1') return back();
//        if (($invoice->created_at !== $invoice->updated_at) && $invoice->updated_at->addMinutes(15) > Carbon::now()) {
//            session()->flash('flash_message_error', 'Подтверждать платёж можна не чаще чем раз в 15 минут.');
//            return back();
//        }
        $key = $this->siteWallet->getByKeyword('qiwi');
        $gateway = new QiwiPayment($key->api_key, Crypt::decrypt($key->secret_key));
        $response = $gateway->info($invoice->invoice_id);
        $invoice->touch();
        if (isset($response->bill) && $response->bill->status == 'paid') {
            $this->completePaymentFull($invoice);
            session()->flash('flash_message_success', 'Платёж успешно подтвержден');
        } else {
            session()->flash('flash_message_error', 'Платёж не подтвержден. Проверте статус платёжа в системе QIWI или обратитесь к службе поддержки.');
        }
        return back();
    }


    /**
     * Qiwi Payout
     *
     * API Docs: https://developer.qiwi.com/ru/qiwi-wallet-personal/
     *
     * @param Payout $payout
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception Payment key non exists
     * @throws \Exception Currency non exists
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function payoutQiwi(Payout $payout)
    {
        $key = $this->siteWallet->getByKeyword($payout->currency->keyword);

        if (empty($key)) throw new \Exception(self::PAYMENT_KEY . 'Qiwi.');
        if (empty($payout->currency)) throw new \Exception(self::CURRENCY_ERROR);

        $qiwi = new QiwiPayout($key->wallet_key, Crypt::decrypt($key->additional_field));
        $sendMoney = $qiwi->sendMoneyToQiwi([
            'id' => $this->generateTransactionId($payout),
            'sum' => [
                'amount' => number_format($payout->amount, 2, '.', ''),
                'currency' => '643'
            ],
            'paymentMethod' => [
                'type' => 'Account',
                'accountId' => '643'
            ],
            'comment' => 'Вывод денег - ' . route('home'),
            'fields' => [
                'account' => $payout->wallet
            ]
        ]);

        if (isset($sendMoney['transaction']) && isset($sendMoney['transaction']['state']) &&
            isset($sendMoney['transaction']['state']['code']) && $sendMoney['transaction']['state']['code'] == 'Accepted') {
            $payout->admin_id = auth()->id();
            $payout->confirm_date = Carbon::now();
            $payout->payment_info = isset($sendMoney['id']) ? $sendMoney['id'] : null;
            $payout->status = '1';
            $payout->frozen = '0';
            $payout->save();
            $invoice = Invoice::where('invoice_id', 'payout-' . $payout->id)->first();
            if(!empty($invoice)){
                $invoice->status = '1';
                $invoice->payment_date = Carbon::now();
                $invoice->save();
            }
            return back()->with('flash_message_success', 'Вывод успешно проведено');
        }
        return back()->with('flash_message_error', 'Ошибка вывода');
    }




    /*
       * ==============================================================================================
       *  BALANCE PAYMENT
       * ==============================================================================================
       */

    /**
     * @param Trade $trade
     * @return \Illuminate\Http\RedirectResponse
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function balance(Trade $trade)
    {
        $buyer = User::find($trade->buyer_id);
        $balance = $buyer->balance;
        if ($balance >= $trade->price) {
            $balance = floatval($balance) - $trade->price;
            $buyer->balance = $balance;
            $trade->is_payed = 1;
            $transactionId = $this->generateTransactionId($trade);

            if ($buyer->save() && $trade->save()) {
                $invoice = Invoice::create([
                    'invoice_id' => $transactionId,
                    'price' => $trade->price,
                    'currency_id' => $trade->payment_id,
                    'trade_id' => $trade->id,
                    'user_id' => auth()->id(),
                    'payment_date' => Carbon::now(),
                    'status' => 0,
                    'type' => 'in',
                    'payment_type' => 'balance',
                ]);
                $this->completePaymentFull($invoice);
            }
        }

        return redirect()->route('chat');
    }


    /*
     * ==============================================================================================
     *  Other method
     * ==============================================================================================
     */


    /**
     * Notification payment as complete
     *
     * @param Trade $trade
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function notification(Trade $trade)
    {
        $owner = User::find($trade['owner_id']);
        $event = [
            'sale' => true,
            'msg' => false,
            'count' => 1,
        ];
        broadcast(new NewEventCount($owner, $event));

        $buyer = User::find($trade['buyer_id']);

        $event = [
            'purchases' => true,
            'msg' => false,
            'count' => 1,
        ];
        broadcast(new NewEventCount($buyer, $event));

        $text = '';
        $text .= 'Покупатель <a target="_blank" href="' . route('user-profile', ['id' => $trade->buyer_id]) . '">' . $trade->buyer->name . '</a> оплатил заказ <a href="' . route('purchases', ['id' => $trade->id]) . '">#' . $trade->id . '</a> ';
        $text .= $this->getDescription($trade);
        $text .= '<br><a target="_blank" href="' . route('user-profile', ['id' => $trade->owner_id]) . '">' . $trade->buyer->name . '</a>, после выполнения заказа продавцом, не забудьте нажать на кнопку «Подтвердить выполнение заказа» или закрыть заказ в <a target="_blank" href="' . route('purchases') . '">"Мои покупки"</a>. ';
        $this->tradeNotification($trade, $text);
    }

    /**
     * Get payment description
     *
     * @param Trade $trade
     * @return string
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function getDescription(Trade $trade)
    {
        if (!empty($trade->get_availability)) $val = !empty($trade->lot->tag) ? intval($trade->get_availability) . ' шт' : $trade->get_availability;
        $text = '';
        !empty($trade->lot->game) ? $text .= "Игра: <span class=\"half-bold\">{$trade->lot->game->name}</span>" : null;
        !empty($trade->lot->currency) ? $text .= "; Валюта: <span class=\"half-bold\">{$trade->lot->currency->name}</span>" : null;
        !empty($trade->lot->server) ? $text .= "; Сервер: <span class=\"half-bold\">{$trade->lot->server->name}</span>" : null;
        if ($trade->get_availability != '') $text .= "; В количестве: <span class=\"half-bold\">{$val}</span>";
        !empty($trade->lot->currency) ? $text .= "<span class=\"half-bold\">{$trade->lot->currency->unity}</span>" : null;
        !empty($trade->character_name) ? $text .= "; Имя персонажа: <span class=\"half-bold\">{$trade->character_name}</span>" : null;
        !empty($trade->lot->tag) ? $text .= "; {$trade->lot->tag->name}:" : null;
        $text .= ' <span class="half-bold">'.str_limit($trade->lot->description, '100').'</span>';
        return $text;
    }

    /**
     * Get Payment description
     *
     * @param Trade $trade
     * @return string
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function getPaymentDescription(Trade $trade)
    {
        return 'Оплата услуг на ' . config('app.url') . '. Номер заказа: #' . $trade->id;
    }


    /**
     * Generate transaction ID
     *
     * @param $collection
     * @return string
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function generateTransactionId($collection)
    {
        return $collection->id . Carbon::now()->format('Gis');
    }

    /**
     * Generate payout transaction ID
     *
     * @return string
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function generatePayoutTransactionId()
    {
        return Carbon::now()->format('dmYGis');
    }


    /**
     * Set payment as complete
     *
     * @param Invoice $invoice
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function completePaymentFull(Invoice $invoice)
    {
        if ($invoice->status != 1) {
            $invoice->status = 1;
            $invoice->save();
            if ($invoice->status == 1) {
                $trade = $invoice->trade;
                $trade->is_payed = 1;
                $trade->save();
                $invoice->update([
                    'status' => '1',
                    'payment_date' => Carbon::now()
                ]);
                $lot = $trade->lot;
                if ($lot['availability'] < $trade->get_availability) $lot->availability = 0;
                else {
                    $lot->availability = $lot->availability - $trade->get_availability;
                    if (floatval($lot->availability) < 1) $lot->active = 0;
                }
                $lot->save();
                $this->notification($trade);
            }
        }
    }

    /**
     * Fail traid view
     *
     * @param Request $request
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function paymentFail(Request $request)
    {
        return view('trade.transaction-fail');
    }
}
