<?php

namespace App\Providers;

use App\Libraries\ShaHasher;
use Illuminate\Hashing\HashServiceProvider;

class ShaHashServiceProvider extends HashServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
//        dd(1);
        $this->app->singleton('hash', function () {
            return new ShaHasher;
        });
//        $this->app->singleton('hash', function() { return new ShaHasher; });
    }
}
