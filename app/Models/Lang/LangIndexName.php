<?php

namespace App\Models\Lang;

use Illuminate\Database\Eloquent\Model;

class LangIndexName extends Model
{

    protected $fillable = [
    	'name'
    ];

    public function structure() {
    	return $this->hasMany(LangIndexStructure::class, 'index_name_id', 'id');
    }

    public function langIndexStructure() {
    	return $this->hasMany(LangIndexStructure::class, 'index_name_id', 'id');
    }

    // public function lang() {
    // 	return $this->belongsTo(Lang::class);
    // }

}
