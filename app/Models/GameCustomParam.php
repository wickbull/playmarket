<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GameCustomParam extends Model
{
    protected $fillable = ['game_id', 'name', 'custom_input', 'param'];

    public function game()
    {
        return $this->belongsTo(Game::class);
    }

    public function updateOrCreate(array $attributes, array $values = [])
	{
	    $instance = $this->firstOrNew($attributes);
	    $instance->fill($values);
	    $instance->save();
	    return $instance;
	}

	// public function trade()
	// {
	// 	return $this->belongsTo(Trade::class, 'id', 'send_id');
	// }
}
