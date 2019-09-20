<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $fillable = [
        'from', 'to', 'message', 'is_read', 'time'
    ];

    protected $dates = ['time'];

    public function fromUsers()
    {
        return $this->belongsTo(User::class, 'from');
    }

    public function toUsers()
    {
        return $this->belongsTo(User::class, 'to');
    }



}
