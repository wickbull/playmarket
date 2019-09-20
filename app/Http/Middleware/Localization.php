<?php

namespace App\Http\Middleware;

use Closure;

use App\Models\Lang\LangIndexName;

class Localization
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if(!!session('langId')) {
            dd(1);
        } else {
            // strtolower();
            // ucwords();
            // session('langId', ucwords(config('app.locale')))
        }

        return $next($request);
    }
}
