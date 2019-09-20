<?php

namespace App\Models\Lang;

use Illuminate\Database\Eloquent\Model;

class LangIndexStructure extends Model
{

    protected $fillable = [
    	'index_name_id', 'name'
    ];

    public function langTranslate() {
    	return $this->hasMany(LangIndexTranslation::class, 'structure_id', 'id');
    }

    public function vueTranslate() {
        return $this->hasOne(LangIndexTranslation::class, 'structure_id', 'id');
        // return $this->hasOne(LangIndexTranslation::class, 'structure_id', 'id');
    }

    public function langIndex() {
    	return $this->belongsTo(LangIndexName::class);
    }

    public function updateOrCreate(array $attributes, array $values = [])
    {
        $instance = $this->firstOrNew($attributes);

        $instance->fill($values);

        $instance->save();

        return $instance;
    }



    /* new relations */

    public function langIndexName() {
        return $this->belongsTo(LangIndexName::class, 'id', 'index_name_id');
    }
}
