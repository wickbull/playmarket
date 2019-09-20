<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Server extends Model
{
    use SoftDeletes;

    protected $fillable = ['name', 'game_id', 'side'];

    public function games()
    {
        return $this->belongsTo(Game::class, 'game_id');
    }

    public function lot()
    {
        return $this->hasOne(Lot::class, 'server_id');
    }
}
