<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PriceCommission extends Model
{

    protected $fillable = [
        'title', 'operation_result', 'keyword', 'site', 'payment', 'withdrawal', 'other', 'is_active', 'coefficient', 'symbol', 'output_commission', 'can_withdrawal'
    ];

    public $timestamps = false;

    protected $casts = [
        'is_active' => 'boolean',
        'site' => 'double',
        'payment' => 'double',
        'withdrawal' => 'double',
        'other' => 'double',
        'coefficient' => 'double',
        'output_commission' => 'double',
        'can_withdrawal' => 'boolean'

    ];

    public function trades()
    {
        return $this->hasMany(Trade::class, 'payment_id');
    }

    /*
     * get
     */

    public function getAll()
    {
        return $this->where('is_active', '1')
            ->orderBy('priority', 'ASC')
            ->get();
    }

    public function getForNonRegister()
    {
        return $this->where('is_active', '1')
            ->where('id', '!=', 1)
            ->get();

    }


    public function getByKeyword($keyword)
    {
        return $this->where('keyword', $keyword)->first();
    }

    public function getById($id)
    {
        return $this->where('id', $id)->first();
    }


}
