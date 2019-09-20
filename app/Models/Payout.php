<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Payout extends Model
{
    protected $fillable = ['wallet', 'user_id', 'currency_id', 'amount', 'status', 'payment_info'];

    protected $dates = [
        'confirm_date'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function admin()
    {
        return $this->belongsTo(User::class, 'admin_id');
    }

    public function currency()
    {
        return $this->belongsTo(PriceCommission::class, 'currency_id');
    }


}
