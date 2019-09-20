<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubTag extends Model
{
    use SoftDeletes;

    public function tags()
    {
        return $this->belongsToMany(Tag::class, 'sub_tag_tag')->withPivot('game_id','tag_id','sub_tag_id');
    }

    public function subTagMetadata()
    {
        return $this->hasMany(SubTagMetadata::class, 'subtags_id')->orderBy('priority','DESC');
    }

    public function attachTagMetadata()
    {
        return $this->belongsTo(SubTagMetadata::class, 'attach');

    }


    public function games()
    {
        return $this->belongsToMany(Game::class,  'sub_tag_tag')->withPivot('game_id','tag_id','sub_tag_id');
    }

    public function tag()
    {
        return $this->hasMany(Tag::class);
    }


    public function game()
    {
        return $this->belongsTo(GameTag::class);
    }

    public function lotSubTag()
    {
        return $this->hasMany(LotSubtag::class);
    }
}
