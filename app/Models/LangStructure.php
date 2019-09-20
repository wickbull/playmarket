<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LangStructure extends Model
{
    protected $fillable = [
        'lang_id', 'key', 'value', 'page'
    ];

    public function lang() {
    	return $this->belongsTo(App\Models\Lang::class);
    }

 //    public function category() {
	// 	return $this->belongsTo('App\Category');
	// }
	// public function user() {
	// 	return $this->belongsTo('App\User');
	// }
}
