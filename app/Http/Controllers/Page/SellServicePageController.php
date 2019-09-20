<?php

namespace App\Http\Controllers\Page;

use App\Events\NewEventCount;
use App\User;
use Auth;
use UnitPay;
use App\Models\Lot;
use App\Models\Trade;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;

class SellServicePageController extends Controller
{

    public function createSellProposition($id, Request $request)
    {
        $user = auth()->user();
        $lot = Lot::find($id);
        $trade = new Trade();

        if ($lot['owner_id'] == $user->id) {
            Session::flash('flash_message_error', 'Ошыбка');
            return redirect('/purchases');
        }
        $trade->owner_id = $lot['owner_id'];
        $trade->buyer_id = $user->id;
        $trade->lot_id = $lot['id'];
        $trade->payment_id = intval($request['pay_method']);
        $trade->character_name = $request['character_name'];
        $trade->price = $lot['price'];


        if ($request['availability']) {
            $trade->get_availability = $request['availability'];
            $lot['availability'] = $lot['availability'] - $request['availability'];
            $trade->price = $request['availability'] * $lot['price'];

            if ($lot['availability'] == 0) {
                $lot['active'] = 0;
            }
        } else {
            $trade->get_availability = 1;
        }


        if ($trade->save())
            $lot->save();

        $owner = User::find($lot['owner_id']);
        $event = [
            'sale' => true,
            'msg' => false,
            'count' => 1
        ];


        broadcast(new NewEventCount($owner, $event));


        $payment_fields = [
            'PUB_KEY' => env('UNITPAY_PUBLIC_KEY'),
            'PAYMENT_AMOUNT' => $trade->price,
            'PAYMENT_NO' => '',
            'ITEM_NAME' => '',
            'CURRENCY' => '',
            'LOCALE' => '',
            'SIGN' => '',

        ];


        $payment_amount = 121221;

        $payment_no = 1221;

        $user_email = 'User email';

        $item_name = 'Name of your order item';

        $currency = 'RUB';

        return UnitPay::generatePaymentForm($payment_amount, $payment_no, $user_email, $item_name, $currency);


//        return view('vendor.unitpay.payment_form', compact('payment_fields', 'payment_amount', 'payment_no', 'user_email', 'item_name', 'currency'));

//        dd($trade);
//        if ($trade->save()) {
//            $lot->save();
//            return redirect('/purchases');
//        }
    }
}
