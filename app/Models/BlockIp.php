<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BlockIp extends Model
{

    use SoftDeletes;

    protected $fillable = [
        'ip', 'user_id', 'from', 'to',
    ];

    protected $dates = [
        'from', 'to'
    ];

    public function users(){
        return $this->hasOne('User');
    }

}
