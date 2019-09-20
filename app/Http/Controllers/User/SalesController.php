<?php

namespace App\Http\Controllers\User;

use App\Events\NewEventCount;
use App\Http\Controllers\Controller;
use App\Models\Lot;
use App\Models\Trade;
use App\Traits\ChatTrait;
use App\User;
use Auth;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SalesController extends Controller
{

    use ChatTrait;

    public function index($id = null)
    {
        $user = auth()->user();
        if (isset($id)) {
            if (Trade::where('owner_id', $user->id)
                ->where('id', $id)->exists())
                $sales = Trade::where('id', $id)
                    ->with('lot.currency','lot.game','lot.server','lot.tag')
                    ->orderBy('created_at', 'DESC')
                    ->get();
            else return abort(404);
        } else {
            $sales = Trade::where('owner_id', $user->id)
                ->where(function ($query) {
                $query->where('is_payed', '1')
                    ->orWhere('status', '3');
            })
                ->with('lot.currency','lot.game','lot.server','lot.tag')
                ->orderBy('created_at', 'DESC')
                ->get();
        }
        $lots_ids = Trade::where('owner_id', $user->id)->distinct()->get(['lot_id'])->toArray();
        $lots = Lot::whereIn('id', $lots_ids)->distinct()->get(['game_id']);

        $games = Lot::with('game')->whereIn('id', $lots_ids)->distinct()->get(['game_id'])->toArray();


        $my_lots = Lot::where('owner_id', $user->id)->get();


      


        return view('trade.sales', compact('sales', 'games', 'lots', 'my_lots'));
//        return view('trade.sales', compact('sales', 'games', 'currencies', 'servers', 'tags', 'lots', 'my_lots'));
    }

    public function refuseMoney($id)
    {
        $trade = Trade::find($id);
        $user = User::find($trade->buyer_id);
        if (!empty($user) && !empty($trade) && $trade->owner_id == auth()->id() && $trade->is_payed == 1) {
            $this->refuse($user, $trade);
            return back()->with('flash_message_success', 'Деньги успешно возвращены');
        }

        return redirect()->route('sales')->with('flash_message_error', 'Что то пошло не так. Обратитесь к администратору');

    }

    public function refuseMoneyAxios(Request $request)
    {
        $trade = Trade::where('lot_id', $request->lot_id)
            ->where('owner_id', auth()->id())
            ->where('status', '1')
            ->latest()
            ->first();
        if (!empty($trade)) {
            $user = User::find($trade->buyer_id);
            if (!empty($user) && $trade->owner_id == auth()->id() && $trade->is_payed == 1) {
                $msg = $this->refuse($user, $trade);
                return response()->json(['success' => true, 'msg' => $msg]);
            }
            if ($trade->is_payed == 0) return response()->json(['error' => 'Покупец ещё не оплатил товар.'], 422);
        }
        return response()->json(['error' => 'Что то пошло не так, обратитесь к администратору'], 422);

    }


    protected function refuse(User $user, Trade $trade)
    {
        $balance = $user->balance;
        isset($balance) ? $balance = $balance + $trade->amount_clear : $balance = $trade->amount_clear;
        $user->balance = $balance;
        if ($user->save()) {
            $trade->is_payed = 0;
            $trade->refuse_date = Carbon::now();
            $trade->status = 3;
            $trade->save();
            $text = '';
            $text .= 'Продавец <a href="' . route('user-profile', ['id' => $trade->owner_id]) . '">' . $trade->owner->name . '</a> закрыл заказ <a href="' . route('purchases', ['id' => $trade->id]) . '">#' . $trade->id . '</a> ';
            $text .= 'и вернул деньги покупателю <a href="' . route('user-profile', ['id' => $trade->buyer_id]) . '">' . $trade->buyer->name . '</a>.';
            $msg = $this->tradeNotification($trade, $text);
        }

        $owner = User::find($trade->owner_id);
        $event = [
            'sale' => true,
            'msg' => false,
            'count' => -1,
            'refuse' => true,
            'lot_id' => intval($trade->lot_id),
            'trade_id' => intval($trade->id),
            'user_id' => intval($trade->buyer_id),
            'owner_id' => intval($trade->owner_id)

        ];

        broadcast(new NewEventCount($owner, $event));

        $buyer = User::find($trade->buyer_id);

        $event = [
            'purchases' => true,
            'msg' => false,
            'count' => -1,
            'refuse' => true,
            'lot_id' => intval($trade->lot_id),
            'trade_id' => intval($trade->id),
            'user_id' => intval($trade->owner_id),
            'owner_id' => intval($trade->owner_id)

        ];

        broadcast(new NewEventCount($buyer, $event));

        return isset($msg) ? $msg : null;
    }

}
