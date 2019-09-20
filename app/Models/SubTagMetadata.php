<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubTagMetadata extends Model
{
    use SoftDeletes;

    protected $fillable = ['priority'];

    public function subtags()
    {
        return $this->belongsToMany(SubTag::class, 'lot_sub_tags', 'sub_tag_id', 'id');
    }
}
