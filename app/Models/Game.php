<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Game extends Model
{
    use SoftDeletes;

    public function tags()
    {
        return $this->belongsToMany(Tag::class , 'game_tag')->withPivot('game_id','tag_id');
    }

    public function currency()
    {
        return $this->belongsToMany(Currency::class, 'game_currency');
    }

    public function servers()
    {
        return $this->hasMany(Server::class);
    }



    public function subtags()
    {
        return $this->belongsToMany(SubTag::class, 'sub_tag_tag', 'game_id')
            ->withPivot('game_id', 'tag_id', 'sub_tag_id')
            ->orderBy('priority', 'ASC');
    }






    public function lot()
    {
        return $this->hasMany(Lot::class);
    }

    public function server()
    {
        return $this->hasOne(Server::class);
    }

    public function mainCurrency()
    {
        return $this->hasOne(Currency::class);
    }


    public function gameParams()
    {
        return $this->hasMany(GameCustomParam::class);
    }


}
