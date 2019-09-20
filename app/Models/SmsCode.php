<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SmsCode extends Model
{
    use SoftDeletes;

    public function getLatestPhoneSms($phone)
    {
        return $this->where('phone', $phone)
            ->orderBy('created_at', 'ASC')
            ->get();
    }
}
