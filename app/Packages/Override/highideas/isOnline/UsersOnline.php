<?php

namespace HighIdeas\UsersOnline\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class UsersOnline
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $response = $next($request);
        /*
         * Set cache custom cache lifetime
         */
        if (Auth::user()) {
            Auth::user()->setCache(5);
        }

        return $response;
    }
}
