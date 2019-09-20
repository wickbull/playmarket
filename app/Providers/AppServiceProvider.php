<?php

namespace App\Providers;

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;
use Captcha;
use \Cache;
use App\Models\Lang;

use Illuminate\Support\Facades\Blade;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {

        Blade::directive('lang', function($expression){
            // dump($expression);

            return "<?php echo lang($expression) ?>";

            /*$version = "v5";

            // $langId = session('custom_language'); //get from seesion on future;
            $langId = 2; //get from seesion on future;

            // dump($langId);

            list($page, $key, $min) = explode(',', $expression);

            $min = 1;

            $app = array_map(function($v){return str_replace('\'','',$v);}, array_map('trim', ['langId' =>  $langId, 'page' => $page, 'key' => $key, 'min' => $min]));


            Cache::remember($app['page'].'.'.$app['langId'].':'.$app['min'] ."-". $version, $app['min'], function() use($app) {
                return Lang::find($app['langId'])
                    ->langStructure()
                    ->where('page', $app['page'])
                    ->get();
            });

            // dump(Cache::get($app['page'].'.'.$app['langId'].':'.$app['min'] ."-". $version)
            //     ->where('key', $app['key'])
            //     ->first());

            return @Cache::get($app['page'].'.'.$app['langId'].':'.$app['min'] ."-". $version)
                ->where('key', $app['key'])
                ->first()
                ->value;*/
        });


        // Blade::directive('role', function ($role) {
            /*return "<?php if (access()->hasRole{$role}): ?>";*/
        // });

        // return Lang::find($langId)->langStructure()->where('page', 'index')->get();
     
        // Blade::directive('endauth', function () {
            /*return '<?php endif; ?>';*/
        // });
    }
}
