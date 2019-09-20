<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Trade extends Model
{
    const CLOSE_TRADE = 0;
    const OPEN_TRADE = 1;
    const REFUSE_TRADE = 3;

    const PAID = 1;
    const UNPAID = 0;


    protected $casts = [
        'price' => 'double',
        'amount_clear' => 'double'
    ];

    protected $dates = [
        'refuse_date', 'closed_at'
    ];


    public function owner()
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function buyer()
    {
        return $this->belongsTo(User::class, 'buyer_id');
    }

    public function lot()
    {
        return $this->belongsTo(Lot::class);
    }

    public function dialogs()
    {
        return $this->hasMany(Dialog::class, 'lot_id');
    }

    public function paymentCurrency()
    {
        return $this->belongsTo(PriceCommission::class, 'payment_id');
    }

    public function review()
    {
        return $this->hasOne(Review::class, 'trade_id');
    }

    public function sendTo()
    {
        return $this->hasOne(GameCustomParam::class, 'id', 'send_id');
    }

    public function getAllTrade()
    {
        return $this->with(['owner', 'buyer', 'lot.game', 'lot.server', 'lot.currency', 'lot.tag'])
            ->orderBy('created_at', 'DESC')
            ->paginate('50');
    }

    public function getAllUserTrade($user_id)
    {
        return $this->where('owner_id', $user_id)
            ->orWhere('buyer_id', $user_id)
            ->with(['owner', 'buyer', 'lot.game', 'lot.server', 'lot.currency', 'lot.tag'])
            ->orderBy('created_at', 'DESC')
            ->paginate('15');
    }


    public function getUserActiveTradeIds($auth_id)
    {
        return $this->where('owner_id', $auth_id)
            ->where('status', self::OPEN_TRADE)
            ->where('is_payed', self::PAID)
            ->orWhere('buyer_id', $auth_id)
            ->where('status', self::OPEN_TRADE)
            ->where('is_payed', self::PAID)
            ->get(['owner_id', 'buyer_id', 'lot_id'])
            ->toArray();

    }
}
