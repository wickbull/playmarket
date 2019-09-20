<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lang extends Model
{
    protected $fillable = [
        'name', 'code', 'default'
    ];

	public function langStructure() {
		return $this->hasMany(LangStructure::class, 'lang_id', 'id');
	}
}
