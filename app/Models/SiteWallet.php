<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SiteWallet extends Model
{
    protected $fillable = [
        'title', 'keyword', 'wallet_key', 'secret_key', 'api_key', 'is_active', 'merchant_id', 'secret_password', 'additional_field', 'additional_field2'
    ];

    protected $casts = [
        'is_active'
    ];

    public function merchant()
    {
        return $this->belongsTo(PriceCommission::class, 'merchant_id');
    }

    public function getByKeyword($keyword)
    {
        return $this->where('keyword', $keyword)
            ->where('is_active', '1')
            ->latest('updated_at')
            ->first();
    }

    public function getForPayoutByCurrencyId($merchant_id)
    {
        return $this->where('merchant_id', $merchant_id)
            ->get();
    }

    public function getAll()
    {
        return $this->latest()->paginate();
    }
}