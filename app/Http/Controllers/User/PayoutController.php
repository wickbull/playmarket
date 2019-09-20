<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Invoice;
use App\Models\Payout;
use App\Models\PriceCommission;
use Carbon\Carbon;
use Illuminate\Http\Request;

class PayoutController extends Controller
{
    public function store(PriceCommission $priceCommission, Request $request)
    {
        $commission = $priceCommission->getById($request->currency_id);

        if ($commission && $commission->can_withdrawal == '1') $total = floatval($request->price - ($request->price * $commission->output_commission / 100.0));
        else  return back()->with('flash_message_error', 'Что то пошло не так!');

        if (auth()->user()->is_block_payment == 1) return back()->with('flash_message_error', 'Вы не можете проводить вывод средств. Обратитесь к службе поддержки что бы узнать причину блокировки.');

        if (floatval(auth()->user()->balance) < $total) return back()->with('flash_message_error', 'У вас недостаточно средств на счёту');

        if (isset($total)) {
            $payout = Payout::create([
                'wallet' => $request->wallet,
                'amount' => $total,
                'user_id' => auth()->id(),
                'currency_id' => $request->currency_id,
                'status' => '0'

            ]);
            Invoice::create([
                'invoice_id' => 'payout-'.$payout->id,
                'price' => $total,
                'currency_id' => $request->currency_id,
                'user_id' => auth()->id(),
                'status' => '0',
                'payment_date' => Carbon::now(),
                'payment_type' => $commission->keyword,
                'type' => 'out',
            ]);
            $user = auth()->user();
            $balance = $user->balance;
            $user->balance = floatval($balance) - $total;
            $user->ip = $request->ip();
            $user->save();
            return redirect(url()->previous() . '#tab-cabinet_balance')->with('flash_message_success', 'Заявка на вывод создана. В ближайшее время модератор обработает её и переведёт деньги на ваш счёт.');
        } else
            return redirect(url()->previous() . '#tab-cabinet_balance')->with('flash_message_error', 'Что то пошло не так!');
    }

    public function destroy(Invoice $invoice)
    {
        if ($invoice->type == 'out' && $invoice->status == 0 && !empty($invoice->price) && auth()->id() == $invoice->user_id) {
            $user = auth()->user();
            if (!empty($user->balance)) $balance = $user->balance;
            else $balance = 0;
            $user->balance = floatval($balance) + $invoice->price;
            $user->ip = request()->ip();
            $user->save();
            $invoice->delete();
            return redirect(url()->previous() . '#cabinet_balance')->with('flash_message_success', 'Вы удалили заявку на вывод. Деньги вернулись вам на счёт.');
        }
        if ($invoice->status != 0) return redirect(url()->previous() . '#cabinet_balance')->with('flash_message_error', 'Ваш вывод уже обработали.');
        if (auth()->id() != $invoice->user_id) return redirect(url()->previous() . '#cabinet_balance')->with('flash_message_error', 'Данный вывод не пренадлежит вам');
        return redirect(url()->previous() . '#cabinet_balance')->with('flash_message_error', 'Что то пошло не так!');

    }
}
