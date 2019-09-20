<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class ChatDisput extends Model
{
    protected $fillable = [
        'dialog_id', 'closed_at', 'reason', 'admin_id', 'status', 'dialog_id'];

    protected $dates = [
        'closed_at'
    ];

    protected $casts = [
        'status'
    ];

    public function chat()
    {
        return $this->belongsTo('App\Models\Chat', 'dialog_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'admin_id');
    }
}
