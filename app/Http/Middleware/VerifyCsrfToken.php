<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as BaseVerifier;

class VerifyCsrfToken extends BaseVerifier
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
        'logout', '/webmoney/payment/success', '/webmoney/payment/fail', '/webmoney/payment/confirmation', '/yandex/payment/confirmation','/qiwi/payment/confirmation'
    ];
}
