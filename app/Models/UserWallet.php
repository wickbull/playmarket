<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class UserWallet extends Model
{
    protected $fillable = [
        'user_id', 'currency_id', 'wallet_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

}
