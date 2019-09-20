<?php
/**
 * Created by PhpStorm.
 * User: pilkoandriy
 * Date: 18.11.17
 * Time: 2:35
 */

use App\Models\Lang\Lang;
use App\Models\Lang\LangIndexName;

if (!function_exists('localeDate')) {

    function localeDate($date, $format)
    {

        $lang = Lang::find(session('langId'));
        // dd(strtolower($lang->code));
        Jenssegers\Date\Date::setLocale(strtolower($lang->code));

        if (!empty($date)) return Jenssegers\Date\Date::createFromFormat('d-m-Y H:i:s', $date->format('d-m-Y H:i:s'))->format($format);
        else return null;
    }
}

if (!function_exists('dayAgo')) {

    function dayAgo($date)
    {
        Jenssegers\Date\Date::setLocale('ru');

        if (!empty($date)) return Jenssegers\Date\Date::createFromFormat('d-m-Y H:i:s', $date->format('d-m-Y H:i:s'))->ago();
        else return '';
    }
}

if (!function_exists('checkCurrentRouteName')) {

    function checkCurrentRouteName($name)
    {
        if (is_array($name)) {
            foreach ($name as $item)
                if (\Route::current()->getName() == $item) return true;
        } else return \Route::current()->getName() == $name;
    }
}

if(!function_exists('default_lang')) {
    function default_lang() {

        // dd(app()->getLocale());
    // function default_lang($lang = '') {
        // if(empty(session('langId'))) {
        //     session(['langId' => Lang::where('default', 1)->first()->id]);
        // } else {
        //     if(!empty($lang)) {
        //         session(['langId', $lang]);
        //         return $lang;
        //     } else {
        //         return Lang::where('default', 1)->first()->id;
        //     }
        // }
        // session(['langId' => 1]);
        // $_SESSION['langId'] = 1;
    }
}

if(!function_exists('lang')) {
//     function lang($langId, $structure, $key, $min = 1) {
//         $version = 'v1';

//         if(empty(session('langId'))) {
//             $langId = app()->getLocale();
//             session(['langId' => $langId]);
//         } else {
//             $langId = session('langId');
//         }


//         if(empty($structure)) {
//             return NULL;
//         } else if (empty($key)) {
//             return NULL;
//         } else {
//             \Cache::remember($langId . '_' . $structure . '_' . $min . '_' . $version, $min, function () use ($structure, $langId) {

//                     // dd($structure);

//                 if(LangIndexName::where('name', $structure)
//                     ->first() !== NULL)
//                     return LangIndexName::where('name', $structure)
//                         ->first()->langIndexStructure()
//                         ->with(['langTranslate' => function ($q) use ($langId) {
//                             return $q->where('lang_id', $langId);
//                         }])->get();



                    
//                     // ->langIndexStructure()
//                     // ->with(['langTranslate' => function ($q) use ($langId) {
//                     //     return $q->where('lang_id', $langId);
//                     // }])->get();

//             });
//         }
            
//         if(@\Cache::get($langId . '_' . $structure . '_' . $min . '_' . $version) !== NULL)
//             if(@\Cache::get($langId . '_' . $structure . '_' . $min . '_' . $version)->where('name', $key)->first() !== NULL) 
//                 $expression = @\Cache::get($langId . '_' . $structure . '_' . $min . '_' . $version)
//                     ->where('name', $key)
//                     ->first()
//                     ->langTranslate()
//                     ->first()
//                     ->name;

//         // dump($expression);
//         // dump($expression);

//         if(empty($expression)) {
//             return $key;
//         } else {
//             return $expression;
//         }
//     }

    function lang($langId, $structure, $key, $min = 1) {
        $version = 'v6';
        if(empty(session('langId'))) {
            $langId = app()->getLocale();
            session(['langId' => $langId]);
        } else {
            $langId = session('langId');
        }
        \Cache::remember($langId . '_' . $structure . '_' . $min . '_' . $version . '_' . $key, $min, function() use($structure, $key, $langId) {
            $lang = LangIndexName::where('name', $structure)->first();
            if(empty($lang)) {
                return null;
            } else if(empty($lang->structure->where('name', $key)->first())) {
                return null;
            } else if(empty($lang->structure->where('name', $key)->first()->langTranslate->where('lang_id', $langId)->first())) {
                return null;
            } else {
                return LangIndexName::where('name', $structure)->first()->structure->where('name', $key)->first()->langTranslate->where('lang_id', $langId)->first()->name;
            }
        });
        $expression = @\Cache::get($langId . '_' . $structure . '_' . $min . '_' . $version . '_' . $key);
        if(empty($expression)) {
            return $key;
        } else {
            return $expression;
        }
    }
}

if(!function_exists('vue_lang')) {
    function vue_lang($index, $time = 1) {
        $version = 'v13';

        if(empty(session('langId'))) {
            $langId = app()->getLocale();
            session(['langId' => $langId]);
        } else {
            $langId = session('langId');
        }

        Cache::remember('vue_lang' . $langId . $index . $time . $version, $time, function() use($langId, $index) {
            // $lang = LangIndexName::where('name', $index)->first()->langIndexStructure()->with(['vueTranslate'])->get();
            // dd($lang);

            $lang = LangIndexName::where('name', $index)->first()->langIndexStructure()->with(['vueTranslate' => function($query) use($langId) {
                $query->where('lang_id', $langId)->get();
            }])->get();

            // $lang = LangIndexName::where('name', $index)->first()->langIndexStructure()

            return $lang;
        });

        $expression = @\Cache::get('vue_lang' . $langId . $index . $time . $version);
        if(empty($expression)) {
            return $index . '.' . $langId . '.' . $time;
        } else {
            return $expression;
        }
        
        return $lang;

    }
}

if(!function_exists('select_lang')) {
    function select_lang() {
        $lang = Lang::orderBy('default', "DESC")->get();
        echo "<form method=\"POST\" action=\"/lang\">";
        echo "<input type=\"hidden\" name=\"_token\" value=\"" . csrf_token() . "\">";
        echo "<select name=\"lang\" data-placeholder='Choose a Language...' onchange=\"if (this.selectedIndex) console.log($(this).closest('form').trigger('submit'));\">";
            echo "<option>" . @$lang->where('id',session('langId'))->first()->name . "</option>";
        foreach ($lang as $key => $value) {
            if(session('langId') != $value->id)
                echo "<option value=" . $value->id . ">" . $value->name . "</option>";
        }
        echo "</select>";
        echo "</form>";
    }
}

if(!function_exists('select_lang_vue')) {
    function select_lang_vue() {
        return Lang::orderBy('default', "DESC")->get();
        // return (object)['csrf' => csrf_token(), 'lang' => Lang::orderBy('default', "DESC")->get()];
    }
};

if(!function_exists('comission')) {
    function comission($item, $lot_price) {
        $price = '';
        $price = $lot_price;
        $amount = $price * 100 / $item->coefficient;
        $comissionPrice = $amount / ((100 - ($item->site + $item->withdrawal + $item->other + $item->payment)) / 100);
        if(empty($comissionPrice)) return 0;
        $price = ($comissionPrice * pow ( 10 , 3 )) / pow ( 10 , 3 );
        return number_format((float)$price, 2, '.', '');
    }   
}


