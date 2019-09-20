<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Currency extends Model
{
    use SoftDeletes;

    protected $table = 'currencies';

    public function games()
    {
        return $this->belongsTo(Game::class);
    }

    public function lots()
    {
        return $this->hasMany(Lot::class)->orderBy('price','ASC');
    }

}
