<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
        'invoice_id', 'price', 'currency_id', 'trade_id', 'user_id', 'status', 'payment_date', 'payment_type', 'payment_detail', 'type', 'payout_purse'
    ];


    protected $dates = [
        'payment_date'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function trade()
    {
        return $this->belongsTo(Trade::class, 'trade_id');
    }

    public function currency()
    {
        return $this->belongsTo(PriceCommission::class, 'currency_id');
    }


    public function getAllP($paginate)
    {
        return $this->orderBy('created_at', 'DESC')
            ->where('status','!=','-1')
            ->with('user', 'trade.lot.subtags', 'trade.lot.currency','currency')
            ->paginate($paginate);
    }

    public function getByTransactionId($transactionId)
    {
        return $this->where('invoice_id', $transactionId)
            ->with('trade','currency')
            ->first();
    }

    public function getAllUserPayment($user_id, $paginate)
    {
        return $this->where('user_id', $user_id)
            ->with('trade.lot.subtags', 'trade.lot.currency', 'currency')
            ->paginate($paginate);
    }
}
