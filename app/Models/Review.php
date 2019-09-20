<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    protected $fillable = [
        'text', 'trade_id', 'user_id', 'seller_id', 'mark'
    ];

    /*
     * Relation
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /*
    * Relation
    */
    public function seller()
    {
        return $this->belongsTo(User::class, 'seller_id');
    }


    public function trade()
    {
        return $this->belongsTo(Trade::class);
    }


    public function getFeedbackByUserId($user_id, $mark = null)
    {
        return $this->where('seller_id', $user_id)
            ->mark($mark)
            ->with('trade.lot.game', 'user')
            ->get();
    }

    public function scopeMark($q, $mark)
    {
        if ($mark !== null)
            $q->where('mark', $mark);
    }


    public function getFeedbackById($id)
    {
        return $this->where('id', $id)
            ->with('trade.lot.game', 'user')
            ->first();
    }


}
