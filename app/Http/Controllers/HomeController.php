<?php

namespace App\Http\Controllers;


use Session;

use App\Models\Game;
use App\Models\Trade;
use Auth;

use App\Models\Lang;
use Carbon\Carbon;
use App\Models\Lot;
use App\Models\PriceCommission;

// use \Cache;

class HomeController extends Controller
{

    public function __construct()
    {
        default_lang();
    }


    const TRADE_PER_PAGE = 6;

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(PriceCommission $priceCommission)
    {
        $featured_game = [];
        $user = Auth::user();

        if ($user) {
            $trades = Trade::where('owner_id', $user->id)
                ->orWhere('buyer_id', $user->id)
                ->with(['lot' => function ($q) {
                    $q->select('id', 'game_id')
                        ->with('game');
                }])
                ->orderBy('id', 'desc')
                ->take(4)
                ->get();
            foreach ($trades as $trade) $arr[] = $trade->lot->game;
            if(isset($arr) && count($arr)) $featured_game = collect($arr)->unique();
            // dump($featured_game);
        }

        // $last_trades = Trade::where('status', 0)
        //     ->with('owner', 'lot')
        //     ->orderBy('id', 'desc')
        //     ->take(self::TRADE_PER_PAGE)
        //     ->get();
        
        Lot::where('top_at', '<', Carbon::now())->update(['top' => NULL, 'top_at' => NULL]);
        
        $last_trades = Game::get();

        // dump(Carbon::now());
        $now = Carbon::now();
        
        if(auth()->guest() || (auth()->check() && auth()->user()->balance < 10)) $comissions = $priceCommission->getForNonRegister();
        else $comissions = $priceCommission->getAll();
        // dd($comissions);

        // foreach ($last_trades as $key => $value) {
        //     # code...currency

            
        //     if(!empty($value->lot()->first())) {
        //         dump($value->lot()->first()->user);
        //     }
        // }

        // dd(0);

        $collection = Game::with('tags')->orderBy('name')->get();
        $games = $collection->groupBy(function ($item) {
            return mb_substr($item->name, 0, 1);
        });

        // dump($featured_game);
        // dump($games);
        // dump($last_trades);


        /* LANGUAGE */
        // $lang = Lang::find(2)->langStructure()->where('page','index')->get();
        // dump($lang);
        // $langId = 2;
        /* LANGUAGE */

        // session('custom_language', 2);
        //session(["langId" => 2]); // langId|finder


        return view('home', compact('featured_game', 'games', 'last_trades', 'now', 'comissions'));
    }

    public function xml()
    {
        $newsXML = new \SimpleXMLElement('<result></result>');
        $newsXML->addChild('result_code', 0);
        header('Content-type: text/xml');
        return response($newsXML->asXML(),200)->header('Content-type','text/xml');
    }
}
