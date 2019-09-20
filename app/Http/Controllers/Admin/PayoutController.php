<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\PaymentController;
use App\Models\Payout;
use App\Models\SiteWallet;
use App\Packages\Payment\FreeKassaPayment;
use App\Packages\Payment\QiwiPayout;
use baibaratsky\WebMoney\Api\X\X3;
use baibaratsky\WebMoney\Api\X\X9;
use baibaratsky\WebMoney\Request\Requester\CurlRequester;
use baibaratsky\WebMoney\Signer;
use baibaratsky\WebMoney\WebMoney;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use YandexMoney\API;


class PayoutController extends PaymentController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $siteWallet = new SiteWallet();

        /*
         * Qiwi
         */
        $key = $siteWallet->getByKeyword('qiwi');
        $qiwi = new QiwiPayout($key->wallet_key, Crypt::decrypt($key->additional_field));
        $balance = $qiwi->getBalance();
        if (isset($balance['accounts']) && isset($balance['accounts']['0']['balance']) && isset($balance['accounts']['0']['balance']['amount']))
            $qiwi_amount = $balance['accounts']['0']['balance']['amount'];
        $qiwiBalance = collect([
            'qiwi_wallet' => $key->wallet_key,
            'balance' => isset($qiwi_amount) ? $qiwi_amount : null
        ]);


        /*
         * Yandex
         */
        $key = $siteWallet->getByKeyword('yandex_money');
        $api = new API(Crypt::decrypt($key->secret_password));
        $balance = $api->accountInfo();
        $yandexBalance = collect([
            'yandex_wallet' => $balance->account,
            'balance' => $balance->balance
        ]);

        /*
         * Free kassa
         */

        $key = $siteWallet->getByKeyword('freekassa');

        $gateway = new FreeKassaPayment($key->api_key, Crypt::decrypt($key->secret_key), Crypt::decrypt($key->additional_field));
        $balance = $gateway->checkBalance();
        $freeKassaBalance = collect([
            'yandex_wallet' => $balance->desc,
            'balance' => $balance->balance
        ]);


        /*
        * Webmoney
        */
        $key = $siteWallet->getByKeyword('wmr_out');

        $webMoney = new WebMoney(new CurlRequester);

        $request = new X9\Request;
        $request->setSignerWmid($key->api_key);
        $request->setRequestedWmid($key->api_key);

        $request->sign(new Signer($key->api_key, storage_path('webmoney/236312820801.kwm'), Crypt::decrypt($key->secret_key)));

// You can access the request XML: $request->getData()

        if ($request->validate()) {
            $response = $webMoney->request($request);
            // The response from WebMoney is here: $response->getRawData()

            if ($response->getReturnCode() === 0) {
                $webmoneyBalance = collect([
                    'webmoney_wallet' => $key->wallet_key,
                    'balance' => $response->getPurseByName($key->wallet_key)->getAmount()
                ]);


            } else {
                echo 'Error: ' . $response->getReturnDescription();
            }
        }

        $payouts = Payout::whereNull('frozen')->orWhere('frozen', '0')->orderBy('status', 'ASC')->latest()->paginate('30');
        return view('vendor.voyager.payout.index', compact('payouts', 'qiwiBalance', 'yandexBalance', 'freeKassaBalance', 'webmoneyBalance'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function frozen()
    {

        $siteWallet = new SiteWallet();

        /*
         * Qiwi
         */
        $key = $siteWallet->getByKeyword('qiwi');
        $qiwi = new QiwiPayout($key->wallet_key, Crypt::decrypt($key->additional_field));
        $balance = $qiwi->getBalance();
        if (isset($balance['accounts']) && isset($balance['accounts']['0']['balance']) && isset($balance['accounts']['0']['balance']['amount']))
            $qiwi_amount = $balance['accounts']['0']['balance']['amount'];
        $qiwiBalance = collect([
            'qiwi_wallet' => $key->wallet_key,
            'balance' => isset($qiwi_amount) ? $qiwi_amount : null
        ]);


        /*
         * Yandex
         */
        $key = $siteWallet->getByKeyword('yandex_money');
        $api = new API(Crypt::decrypt($key->secret_password));
        $balance = $api->accountInfo();
        $yandexBalance = collect([
            'yandex_wallet' => $balance->account,
            'balance' => $balance->balance
        ]);

        /*
        * Free kassa
        */

        $key = $siteWallet->getByKeyword('freekassa');

        $gateway = new FreeKassaPayment($key->api_key, Crypt::decrypt($key->secret_key), Crypt::decrypt($key->additional_field));
        $balance = $gateway->checkBalance();
        $freeKassaBalance = collect([
            'yandex_wallet' => $balance->desc,
            'balance' => $balance->balance
        ]);

        /*
         * Webmoney
         */

        $key = $siteWallet->getByKeyword('wmr_out');

        $webMoney = new WebMoney(new CurlRequester);

        $request = new X9\Request;
        $request->setSignerWmid($key->api_key);
        $request->setRequestedWmid($key->api_key);

        $request->sign(new Signer($key->api_key, storage_path('webmoney/236312820801.kwm'), Crypt::decrypt($key->secret_key)));

// You can access the request XML: $request->getData()

        if ($request->validate()) {
            $response = $webMoney->request($request);
            // The response from WebMoney is here: $response->getRawData()

            if ($response->getReturnCode() === 0) {
                $webmoneyBalance = collect([
                    'webmoney_wallet' => $key->wallet_key,
                    'balance' => $response->getPurseByName($key->wallet_key)->getAmount()
                ]);


            } else {
                echo 'Error: ' . $response->getReturnDescription();
            }
        }


        $payouts = Payout::where('frozen', '1')->orderBy('status', 'ASC')->latest()->paginate('30');
        return view('vendor.voyager.payout.index', compact('payouts', 'qiwiBalance', 'yandexBalance', 'freeKassaBalance', 'webmoneyBalance'));
    }


    public function qiwiHistory()
    {
        $siteWallet = new SiteWallet();
        $key = $siteWallet->getByKeyword('qiwi');
        $qiwi = new QiwiPayout($key->wallet_key, Crypt::decrypt($key->additional_field));
        $history = $qiwi->getPaymentsHistory(['rows' => '50', 'ALL']);
        $balance = $qiwi->getBalance();
        if (isset($balance['accounts']) && isset($balance['accounts']['0']['balance']) && isset($balance['accounts']['0']['balance']['amount']))
            $qiwi_amount = $balance['accounts']['0']['balance']['amount'];
        $qiwiBalance = collect([
            'qiwi_wallet' => $key->wallet_key,
            'balance' => isset($qiwi_amount) ? $qiwi_amount : null
        ]);
        return view('vendor.voyager.payout.qiwi_history', compact('history', 'qiwiBalance'));
    }

    public function yandexHistory()
    {
        $siteWallet = new SiteWallet();
        $key = $siteWallet->getByKeyword('yandex_money');
        $api = new API(Crypt::decrypt($key->secret_password));
        $history = $api->operationHistory(['records' => '50']);
        $balance = $api->accountInfo();
        $yandexBalance = collect([
            'yandex_wallet' => $balance->account,
            'balance' => $balance->balance
        ]);
        return view('vendor.voyager.payout.yandex_history', compact('history', 'yandexBalance'));
    }

    public function freekassaHistory()
    {
        $siteWallet = new SiteWallet();
        $key = $siteWallet->getByKeyword('freekassa');
        $gateway = new FreeKassaPayment($key->api_key, Crypt::decrypt($key->secret_key), Crypt::decrypt($key->additional_field));
        $history = $gateway->operationHistory();
        $history = $history->action_data;
        return view('vendor.voyager.payout.freekassa_history', compact('history'));
    }


    public function webmoneyHistory()
    {
        $siteWallet = new SiteWallet();
        $key = $siteWallet->getByKeyword('wmr_out');
        $webMoney = new WebMoney(new CurlRequester);

        $request = new X3\Request;
        $request->setSignerWmid($key->api_key);
        $request->setPurse($key->wallet_key);
        $request->setStartDateTime(new \DateTime('-1 month'));
        $request->setEndDateTime(new \DateTime);


        $request->sign(new Signer($key->api_key, storage_path('webmoney/236312820801.kwm'), Crypt::decrypt($key->secret_key)));

        $history = [];
        if ($request->validate()) {
            /** @var X3\Response $response */
            $response = $webMoney->request($request);

            if ($response->getReturnCode() === 0) {
                $history = array_reverse($response->getOperations());
            } else {
                echo 'Error: ' . $response->getReturnDescription();
            }
        } else {
            echo 'Request errors: ' . PHP_EOL;
            foreach ($request->getErrors() as $error) {
                echo ' - ' . $error . PHP_EOL;
            }
        }


        return view('vendor.voyager.payout.webmoney_history', compact('history'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Payout $payout)
    {
        if ($payout->currency->keyword == 'qiwi')
            return $this->payoutQiwi($payout);
        if ($payout->currency->keyword == 'wmr')
            return $this->payoutWebmoney($payout);
        if ($payout->currency->keyword == 'yandex_money' || $payout->currency->keyword == 'card')
            return $this->payoutYandex($payout);
    }

    public function updateFrozen(Payout $payout)
    {
        $payout->frozen = '1';
        $payout->save();
        return back()->with('flash_message_success', 'Успешно заморожено');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Payout::destroy($id);
        return redirect()->route('payout.frozen');
    }
}
