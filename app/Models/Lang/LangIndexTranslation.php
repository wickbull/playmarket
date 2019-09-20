<?php

namespace App\Models\Lang;

use Illuminate\Database\Eloquent\Model;

class LangIndexTranslation extends Model
{
	// use Notifiable;

	protected $fillable = [
    	'lang_id', 'structure_id', 'name'
    ];

    public function langStructure() {
    	return $this->belongsTo(LangIndexStructure::class, 'id', 'structure_id');
    }

    public function lang() {
    	return $this->belongsTo(Lang::class, 'id', 'lang_id');
    }

    public function updateOrCreate(array $attributes, array $values = [])
	{
	    $instance = $this->firstOrNew($attributes);

	    $instance->fill($values);

	    $instance->save();

	    return $instance;
	}

}
