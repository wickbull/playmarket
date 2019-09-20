<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Tag extends Model
{
    use SoftDeletes;

    public function games()
    {
        return $this->belongsTo(Game::class);
    }


    public function subtags()
    {
        return $this->belongsToMany(SubTag::class, 'sub_tag_tag')->orderBy('priority','ASC');
    }

    public function lots()
    {
        return $this->hasMany(Lot::class)->orderBy('price', 'ASC');
    }
}
