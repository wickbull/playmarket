<?php

namespace App\Http\Middleware;

use App\Models\BlockIp;
use Carbon\Carbon;
use Closure;

class IpMiddleware
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
        $ip = BlockIp::where('ip', $request->ip())->where('to', '>', Carbon::now())->first();
        if ($ip || (auth()->check() && auth()->user()->is_block == 1)) return response()->view('errors.403');
        return $next($request);
    }
}
