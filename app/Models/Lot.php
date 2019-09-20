<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use Carbon\Carbon;

class Lot extends Model
{
    use SoftDeletes;

    protected $table = 'lots';

    protected $fillable = ['currency_id', 'game_id', 'owner_id', 'server_id', 'tag_id', 'price', 'description', 'availability', 'status', 'active', 'min_order', 'top', 'top_at'];


    public function subtags()
    {
        return $this->hasMany(LotSubtag::class);
    }

    public function tag()
    {
        return $this->belongsTo(Tag::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'owner_id');
    }

    public function self() {
        return $this->hasMany(Lot::class, 'id', 'id');
    }

    public function userDesc()
    {
        return $this->belongsTo(User::class, 'owner_id')->orderBy('name', 'DESC');
    }

    public function userAsc()
    {
        return $this->belongsTo(User::class, 'owner_id')->orderBy('name', 'ASC');
    }

    public function game()
    {
        return $this->belongsTo(Game::class,'game_id');
    }

    public function server()
    {
        return $this->belongsTo(Server::class);
    }

    public function currency()
    {
        return $this->belongsTo(Currency::class);
    }

    public function time()
    {
        // dump($this->top_at);
        // return $this->top_at - Carbon::now();
        return 0 > (strtotime(Carbon::now())-strtotime(Carbon::parse($this->top_at, 'UTC')));
        // return Carbon::parse($this->top_at, 'UTC')->diffInSeconds();
    }

    // public function lotParams()
    // {
    //     return $this->hasMany(LotCustomParam::class);
    // }

    


//    public function chat()
//    {
//        return $this->hasMany(Chat::class);
//    }

    /*
     * Query
     */

    public function scopeCurrencyFilter($q, $status)
    {

        if ($status) $q->whereNotNull('currency_id');
    }

    public function scopeServerId($q, $server_id)
    {
        if ($server_id != null)
            $q->where('server_id', $server_id);
    }

    public function scopeLotSubtag($q, $subtags)
    {
        if (!empty($subtags) && count($subtags))
            foreach ($subtags as $tag)
                $q->whereHas('subtags', function ($q) use ($tag) {
                    $q->where('sub_tag_value_id', $tag);
                });
    }

    public function scopeLotSubtagWithName($q, $subtags)
    {
        if (!empty($subtags) && count($subtags))
            $q->whereHas('subtags', function ($q) use ($subtags) {
                foreach ($subtags as $key => $value)
                    $q->where('sub_tag_id', $key)
                        ->where('other_value', 'LIKE', $value);
            });
    }

    public function scopeOrderByGameTag($q, $type = 'DESC')
    {
        $q->orderBy('game_id', $type)->orderBy('currency_id', $type)->orderBy('tag_id', $type);
    }

}
