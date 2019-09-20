<?php

namespace App\Models\Lang;

use Illuminate\Database\Eloquent\Model;

class Lang extends Model
{
    protected $fillable = [
        'name', 'code', 'default'
    ];

	public function translate() {
		return $this->hasMany(LangIndexTranslation::class, 'lang_id', 'id');
	}

	public function updateOrCreate(array $attributes, array $values = [])
	{
	    $instance = $this->firstOrNew($attributes);
	    $instance->fill($values);
	    $instance->save();
	    return $instance;
	}

}
