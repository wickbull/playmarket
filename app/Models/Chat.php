<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    public function receiver()
    {
        return $this->belongsTo(User::class,'receiver_id');
    }

    public function sender()
    {
        return $this->belongsTo(User::class,'sender_id');
    }

    public function lot()
    {
        return $this->belongsTo(Lot::class,'lot_id');
    }
}
