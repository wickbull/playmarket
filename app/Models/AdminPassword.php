<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AdminPassword extends Model
{
    protected $guarded = [
        'password'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password'
    ];

}
