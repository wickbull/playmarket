<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ChatSetting extends Model
{
    protected $fillable = [
        'title', 'keyword', 'is_active', 'value'
    ];

    protected $casts = [
        'value' => 'integer'
    ];

    public function getByKeyWord($keyword)
    {
        return $this->where('keyword', $keyword)
            ->where('is_active', 1)
            ->first();
    }

    public function getAllP($paginate)
    {
        return $this->paginate($paginate);
    }


}
