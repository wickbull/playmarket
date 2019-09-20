<?php

namespace App\Http\Controllers\User;

use App\Events\NewEventCount;
use App\Http\Controllers\PaymentController;
use App\Models\Invoice;
use App\Models\Lot;
use App\Models\PriceCommission;
use App\Models\Trade;
use App\Traits\ChatTrait;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Jenssegers\Date\Date;


class PurchaseController extends PaymentController
{
    use ChatTrait;

    /**
     * @var float Min Euro and Dollar value
     */
    protected $minEDValue = 0.1;

    /**
     * @var int Min Rub Value
     */
    protected $minRUBValue = 3;

    /**
     * @param null|integer $id Trade ID
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function index($id = null)
    {
        // Set date locale
        Date::setLocale('ru');

        $user = auth()->user();

        if (isset($id)) {
            // If auth user buyer of trade, redirect to sales
            if (Trade::where('buyer_id', $user->id)->where('id', $id)->exists())
                $purchases = Trade::where('id', $id)
                    ->with('paymentCurrency','lot.currency','lot.game','lot.server','lot.tag')
                    ->orderBy('created_at', 'ASC')
                    ->get();
            else redirect()->route('sales', ['id' => $id]);
        } else
            $purchases = Trade::where('buyer_id', $user->id)
            ->where(function ($query) {
                $query->where('is_payed', '1')
                    ->orWhere('status', '3');
            })
            ->with('paymentCurrency','lot.currency','lot.game','lot.server','lot.tag')
            ->orderBy('created_at', 'DESC')
            ->get();


        // $langId = 2;



        return view('trade.purchases', compact('purchases'));
    }

    /**
     * Buy method
     *
     * @param PriceCommission $priceCommission
     * @param Request $request Form request
     * @param integer $order_id Lot ID
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector|\Illuminate\View\View|void
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function buy(PriceCommission $priceCommission, Request $request, $order_id)
    {

        // dd($request->all());
        // Get LOT
        $lot = Lot::find($order_id);
        // If lot non exists redirect
        if (!$lot) return back()->withInput()->with('flash_message_error', 'Выберите лот для покупки!');


        //Get lot min price
        $min = 0;
        if (!empty($lot->min_order) && $lot->min_order > 0) $min = floatval($lot->min_order);

        //Get Commission for pay method
        $commission = $priceCommission->getById($request->pay_method);

        //Validate
        $this->validate($request, [
            'availability'      => 'nullable|numeric|max:' . $lot->availability,
            'value'             => 'numeric|numeric',
            'character_name'    => 'required|string|min:2|max:100',
            'pay_method'        => 'required|numeric',
        ]);

        // dd($this);

        // If lot availability non exists
        if ($lot['availability'] < $request['availability']) return back()->withInput()->with('flash_message_error', lang(session("langId"), 'chat', 'error_buyed_products', 43200));


        // Check min price for item
        if ($commission->keyword == 'wmz' || $commission->keyword == 'wme') {
            if ($request->has('value') && floatval($request->value) < $this->minEDValue) return back()->withInput()->with('flash_message_error', lang(session("langId"), 'chat', 'min_wme_wmz', 43200)." {$this->minEDValue}");
        } else if ($request->has('value') && floatval($request->value) < $this->minRUBValue) return back()->withInput()->with('flash_message_error', lang(session("langId"), 'chat', 'min_buy_sum', 43200)." {$this->minRUBValue} рубля.");

        $user = auth()->user();

        $user->update(['ip' => $request->ip()]);

        if ($commission->keyword == 'balance' && $user->is_block_payment == '1') return back()->withInput()->with('flash_message_error', lang(session("langId"), 'chat', 'your_balance_blocked', 43200));


            if ($lot->owner_id == $user->id) return back()->with('flash_message_error', lang(session("langId"), 'chat', 'your_cant_buy_himself', 43200));

        if (auth()->user()->confirmed != '1') {
            session()->flash('flash_message_rules', lang(session("langId"), 'chat', 'confirm_email', 43200));
            return redirect()->route('my-profile') . '#tab-cabinet_personal_data';
        }

        $trade = new Trade();

        //Get Lot availability
        if (!empty($request->availability)) $availability = floatval($request->availability);
        else $availability = 1;
        if(empty($lot->currency_id)) $availability = intval($availability);

        //Set lot availability

        //   Сonvert currency
        $price = floatval($lot->price);
        // Price in Currency
        $amount = $price  * (100 / floatval($commission->coefficient));

        // Total commission
        $totalCommission = (100 - ((floatval($commission->site) + floatval($commission->withdrawal) + floatval($commission->other)))) / 100;

        $totalCommissionWithPayment = (100 - ((floatval($commission->site) + floatval($commission->withdrawal) + floatval($commission->other) + floatval($commission->payment)))) / 100;

        //Get price with commision
        $totalPrice = $availability * $amount / $totalCommission;

        //Get price with payment commision
        $tradeWithPaymentCommission = $availability * $amount / $totalCommissionWithPayment;

        //Total value
        $inputPrice = floatval($request->value);

        // Check min lot value with convent
        if (round($tradeWithPaymentCommission, 1, PHP_ROUND_HALF_UP) < ($min * 100 / floatval($commission->coefficient))) return back()->with('flash_message_error', lang(session("langId"), 'chat', 'min_sum', 43200) . " {$min} " . lang(session("langId"), 'chat', 'rub', 43200));

        //Create Trade item
        $trade->owner_id = $lot->owner_id;
        $trade->buyer_id = $user->id;
        $trade->send_id = $request->send;
        $trade->lot_id = $lot->id;
        $trade->payment_id = intval($request->pay_method);
        $trade->character_name = $request->character_name;
        $trade->is_payed = 0;

        // Get clear price for payment
        if (!empty($inputPrice)) $totalPrice = $this->checkInfelicity($totalPrice, $inputPrice);

        if (floatval($commission->payment) != 0) $totalPrice = (1 - ((floatval($commission->payment)) / 100)) * $totalPrice;
        $trade->price = $totalPrice;
        $trade->get_availability = $availability;


        // Clear price (without commission) That value seller got in totally
        $trade->amount_clear = $price * $availability;


        $buyer = User::find($trade['buyer_id']);


        if ($commission->keyword == 'balance' && $buyer->balance < $totalPrice) {
            session()->flash('flash_message_error', lang(session("langId"), 'chat', 'low_money_status', 43200) . " - {$buyer->balance}");
            return redirect()->back();
        }

        if ($trade->save()) {
            $lot->save();
            if ($commission->keyword == 'balance') return $this->balance($trade);
            else return $this->createInvoice($trade, $request, $commission->keyword);
        }

        return back();
    }


    /**
     * Check calculated and input value infelicity. If infelicity < 1%, get input value; Else get calculated value
     *
     * @param float $c Calculated value
     * @param float $i Input value
     * @return float result
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function checkInfelicity($c, $i)
    {
        if ($c != $i) {
            if ($c < $i) if (floatval($c / $i) > 0.99) $t = $i;
            elseif ($c > $i) if (floatval($i / $c) > 0.99) $t = $i;
        }
        return isset($t) ? $t : $c;
    }


    /**
     * Update trade status
     *
     * @param Trade $trade Trade by ID
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     * @throws \Exception
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function updatePurchases(Trade $trade)
    {
        if ($trade->buyer_id == auth()->id() && $trade->status == '1' && $trade->is_payed == '1') $this->closeTrade($trade);
        $url = route('user-profile', ['id' => $trade->owner_id]) . '#tab-profile_feedbacks';
        return redirect($url);
    }


    /**
     * Update trade status
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function updatePurchasesAxios(Request $request)
    {
        // Get trade
        $purchase = Trade::where('lot_id', $request->lot_id)
            ->where('buyer_id', auth()->id())
            ->where('status', '1')
            ->where('is_payed', '1')
            ->latest()
            ->first();
        if (!empty($purchase)) {
            // Close trade
            $msg = $this->closeTrade($purchase);
            return response()->json(['msg' => $msg]);
        } else {
            return response()->json(['error' => true], 422);
        }
    }


    /**
     * Close trade
     *
     * @param Trade $trade Trade model
     * @return string Message
     * @throws \Exception
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    protected function closeTrade(Trade $trade)
    {

            /*
             * Balance Calculate in RUB (transfer from other currency)
             */

            $rub_total_price = $trade->amount_clear;

            /*
             * User Balance add
             */
        $owner = User::find($trade->owner_id);
        if (!empty($owner)) {
            $balance = $owner->balance;
            if ($balance != '') $balance = floatval($balance) + $rub_total_price;
            else $balance = $rub_total_price;
            if ($balance > 0) {
                $owner->balance = $balance;
                $owner->save();
            }
        }


        $text = '';
        $text .= lang(session("langId"), 'chat', 'seller', 43200). ' <a href="' . route('user-profile', ['id' => $trade->buyer_id]) . '">' . $trade->buyer->name . '</a> ' . lang(session("langId"), 'chat', 'confirm_sell', 43200) . ' <a href="' . route('purchases', ['id' => $trade->id]) . '">#' . $trade->id . '</a> ';
        if ($trade->get_availability != '') {
            $text .= lang(session("langId"), 'chat', 'in_count', 43200);
            $text .= !empty($trade->lot->tag) ? intval($trade->get_availability) . lang(session("langId"), 'chat', 'count', 43200) : null;
            $text .= !empty($trade->lot->currency) ? $trade->get_availability . ' ' . $trade->lot->currency->unity : null;
        }
        $text .= lang(session("langId"), 'chat', 'and_send_money', 43200) . ' <a href="' . route('user-profile', ['id' => $trade->owner_id]) . '">' . $trade->owner->name . '</a>.';
        $text .= '</br> '.lang(session("langId"), 'chat', 'click', 43200).' <a href="' . route('user-profile', ['id' => $trade->owner_id]) . '#tab-profile_feedbacks">'.lang(session("langId"), 'chat', 'here', 43200).'</a> '.lang(session("langId"), 'chat', 'send_review', 43200);
        $trade->status = 0;
        $trade->save();
        $trade->closed_at = Carbon::now();

        $msg = $this->tradeNotification($trade, $text);

        $owner = User::find($trade['owner_id']);
        $event = [
            'sale' => true,
            'msg' => false,
            'count' => -1,
            'trade_id' => intval($trade->id),
            'lot_id' => intval($trade->lot_id),
            'user_id' => intval($trade['buyer_id'])

        ];

        broadcast(new NewEventCount($owner, $event));

        $buyer = User::find($trade['buyer_id']);

        $event = [
            'purchases' => true,
            'msg' => false,
            'count' => -1,
            'trade_id' => intval($trade->id),
            'lot_id' => intval($trade->lot_id),
            'user_id' => intval($trade['owner_id'])

        ];

        broadcast(new NewEventCount($buyer, $event));

        return isset($msg) ? $msg : null;
    }


    public function getPaymentInfo(Request $request)
    {
        if ($request->has('id')) $invoice = Invoice::find($request->id);
        if (isset($invoice)) return response()->json(view('profile.modals.invoice-info', compact('invoice'))->render());
        else return response()->json(['fail' => 'Not find invoice']);

    }

    public function getTradeInfo(Request $request)
    {
        if ($request->has('id')) $trade = Trade::find($request->id);
        if (isset($trade)) return response()->json(view('trade._modals.trade-info', compact('trade'))->render());
        else return response()->json(['fail' => 'Not find invoice']);

    }

    /**
     * Get User Balance
     *
     * @return \Illuminate\Http\JsonResponse Balance value
     * @author Pilko Andriy <pilkoandriy94@gmail.com>
     */
    public function getUserBalance()
    {
        return response()->json(['balance' => auth()->user()->balance]);
    }
}
