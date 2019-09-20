<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdminPassword;
use App\Models\Dialog;
use App\Models\PriceCommission;
use App\Models\Trade;
use App\Traits\ChatTrait;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class TradeController extends Controller
{
    use ChatTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Trade $trade)
    {
        $trades = $trade->getAllTrade();
        return view('vendor.voyager.trade.index', compact('trades'));
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $trade = Trade::find($id);
        return view('vendor.voyager.trade.show', compact('trade'));
    }

    public function close(Request $request, $id)
    {

        $this->validate($request, [
            'password' => 'required|string|min:4|max:30',
        ]);

        $this->checkAdminPassword($request->password);


        $trade = Trade::find($id);
        if ($trade->is_payed == '1') {
            /*
             * User Balance add
             */
            $owner = User::find($trade->owner_id);
            if (!empty($owner)) {
                $balance = $owner->balance;
                if ($balance != '')
                    $balance = floatval($balance) + $trade->amount_clear;
                else
                    $balance = $trade->amount_clear;
                if ($balance > 0) {
                    $owner->balance = $balance;
                    $owner->save();
                }
            }


        }
        $trade->status = 0;
        $trade->is_payed = 1;
        $trade->closed_at = Carbon::now();
        $trade->save();

        $dialog = new Dialog();


        $user_dialog_thread = $this->getDialogIdsArray($trade->owner_id);

        $dialog_info = $dialog->checkIfThreadExists($trade->buyer_id, $user_dialog_thread);
        if (!empty($dialog_info)) {
            $text = ' закрыл сделку <a href="' . route('purchases', ['id' => $trade->id]) . '">#' . $trade->id . '</a>.';
            $text = 'Модератор: ' . auth()->user()->name . $text;
            $user = User::find('1');

            $this->adminMsg($dialog_info, $text, $trade->owner_id, $trade->buyer_id, $user);
        }

        return back()->with('flash_message_success', 'Сделка успешно закрыта');
    }

    public function refuse(Request $request, $id)
    {
        $this->validate($request, [
            'password' => 'required|string|min:4|max:30',
        ]);

        $this->checkAdminPassword($request->password);

        $trade = Trade::find($id);
        $user = User::find($trade->buyer_id);
        /*
        * Balance Calculate in RUB (transfer from other currency)
        */
        $commission = PriceCommission::find($trade->payment_id);

        $rub_total_price = $trade->price;

        if (!empty($commission)) {
            $rub_commision_value = floatval($trade->price) * floatval($commission->output_commission) / 100;
            $rub_total_price = floatval($trade->price + $rub_commision_value) * floatval($commission->coefficient / 100);
        }


        /*
         * User Balance add
         */
        if (!empty($user)) {
            $balance = $user->balance;
            if ($balance != '')
                $balance = floatval($balance) + $rub_total_price;
            else
                $balance = $rub_total_price;
            if ($balance > 0) {
                $user->balance = $balance;
            }
        }

        if ($user->save()) {
            $trade->is_payed = 1;
            $trade->refuse_date = Carbon::now();
            $trade->refuse_moderator_id = auth()->id();
            $trade->status = 3;
            $trade->save();
            $user = User::find($trade->buyer_id);
            if (!empty($user) && !empty($trade)) {
                $dialog = new Dialog();

                $user_dialog_thread = $this->getDialogIdsArray($trade->owner_id);

                $dialog_info = $dialog->checkIfThreadExists($trade->buyer_id, $user_dialog_thread);
                if (!empty($dialog_info)) {
                    $text = ' отменил сделку <a href="' . route('purchases', ['id' => $trade->id]) . '">#' . $trade->id . '</a> и вернул деньги покупателю <a href="' . route('user-profile', ['id' => $trade->buyer_id]) . '">' . $trade->buyer->name . '</a>';
                    $text = 'Модератор: ' . auth()->user()->name . $text;
                    $user = User::find('1');

                    $this->adminMsg($dialog_info, $text, $trade->owner_id, $trade->buyer_id, $user);
                }
                return back()->with('flash_message_success', 'Деньги успешно возвращены');
            }
        }

        return back();
    }


    public function refusePayment(Request $request, $id)
    {
        $this->validate($request, [
            'password' => 'required|string|min:4|max:30',
        ]);


        $this->checkAdminPassword($request->password);

        $trade = Trade::find($id);
        $trade->is_payed = !$trade->is_payed;
        $trade->save();

        return back()->with('flash_message_success', 'Статус оплаты изменен');
    }

    public function userTrade(Trade $trade, $user_id)
    {
        $user = User::find($user_id);
        $trades = $trade->getAllUserTrade($user_id);
        return view('vendor.voyager.trade.index', compact('trades', 'user'));
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

    private function checkAdminPassword($i)
    {


        $password = AdminPassword::find('1');

        $name = 'password_fail_attempt_' . auth()->id();
        $count = 0;


        if (session()->has($name) && session()->has('password_fail_attempt_time_' . auth()->id()) && !session()->get('password_fail_attempt_time_' . auth()->id()) < Carbon::now()->addDays('3')->timestamp) $count = session()->get($name);
        if ($count >= 5) return abort(404, 'Слишком много попыток. ');

        session()->forget($name);
        if (bcrypt($i) != $password->password) {
            session()->put('password_fail_attempt_time_' . auth()->id(), Carbon::now()->timestamp);
            $count++;
            session()->put($name, $count);
            return abort(403);
        }

        session()->forget($name);
        session()->forget('password_fail_attempt_time_' . auth()->id());

        return true;
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $regex = "/^(?=.+)(?:[1-9]\d*|0)?(?:\.\d+)?$/";

        $this->validate($request, [
            'character_name' => 'required|string|max:254',
            'price' => array('required', 'regex:' . $regex),
            'get_availability' => array('required', 'regex:' . $regex),
        ]);

        $trade = Trade::find($id);

        $trade->character_name = $request->character_name;
        $trade->price = $request->price;
        $trade->get_availability = $request->get_availability;

        $trade->save();
        return back()->with('flash_message_success', 'Успешно обновленно');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
