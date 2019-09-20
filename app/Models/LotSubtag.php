<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LotSubtag extends Model
{
    protected $table = 'lot_sub_tags';


    public function lot()
    {
        return $this->belongsTo(Lot::class);
    }

    public function subtag()
    {
        return $this->belongsTo(SubTag::class, 'sub_tag_id');
    }

    public function subtagMetadata()
    {
        return $this->belongsTo(SubTagMetadata::class, 'sub_tag_value_id');
    }

}
