<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class DialogMessage extends Model
{

    protected $fillable = [
        'sender_id', 'dialog_id', 'seen', 'text','lot_id'
    ];

    protected $casts = [
        'seen' => 'boolean'
    ];

    public function dialog()
    {
        return $this->belongsTo(Dialog::class);
    }

    public function users()
    {
        return $this->belongsTo(User::class, 'sender_id');
    }

    public function participants()
    {
        return $this->hasMany(DialogParticipant::class, 'dialog_id','participants');
    }

    public function lots()
    {
        return $this->belongsTo(Lot::class,'lot_id');
    }


    public function getMsgPerDaysCount($dialog_id,$user_id,$day)
    {
        return $this->where('sender_id',$user_id)
            ->dialogId($dialog_id)
            ->whereDay('created_at', $day)
            ->count();
    }

    public function scopeDialogId($q,$dialog_id)
    {
        if(isset($dialog_id))
            $q->where('dialog_id',$dialog_id);
    }



    /**
     * Returns unread messages given the userId.
     *
     * @param Builder $query
     * @param $userId
     * @return Builder
     */
    public function scopeUnreadForUser(Builder $query, $userId)
    {
        return $query->has('dialog')
            ->where('sender_id', '!=', $userId)
            ->whereHas('participants', function (Builder $query) use ($userId) {
                $query->where('user_id', $userId)
                    ->where(function (Builder $q) {
                        $q->where('last_read', '<', $this->getConnection()->raw($this->getConnection()->getTablePrefix() . $this->getTable() . '.created_at'))
                            ->orWhereNull('last_read');
                    });
            });
    }


    /*
     * Admin
     */

    public function getAllMsgByChatId($id)
    {
        return $this->where('dialog_id', $id)
            ->orderBy('created_at','ASC')
            ->with('users', 'lots')
            ->paginate('150');

    }


}
