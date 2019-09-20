<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class DialogParticipant extends Model
{
    protected $fillable = [
        'user_id', 'dialog_id', 'last_read'
    ];

    protected $dates = [
        'last_read', 'deleted_at'
    ];

    public function users()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function dialogs()
    {
        return $this->belongsTo(Dialog::class, 'dialog_id');
    }


}
