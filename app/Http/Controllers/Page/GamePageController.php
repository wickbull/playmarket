<?php

namespace App\Http\Controllers\Page;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Game;
use App\Models\Lot;
use App\Models\LotSubtag;
use App\Models\PriceCommission;
use App\Models\SubTag;
use App\Models\Tag;
use App\Models\Trade;
use App\User;
use Auth;
use Cache;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use Carbon\Carbon;

class GamePageController extends Controller
{
    /**
     * Get game page
     *
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index(PriceCommission $priceCommission, Trade $trade, $id)
    {
        $users = new User();
        $user_online = $users->allOnline()->pluck('id')->toArray();

        // $lots       = Lot::where('top', 1)->get();
        // $mutable    = Carbon::now();
        // foreach($lots as $lot) {
        //     $data = $mutable <=> $lot->top_at;
        //     if($data == 1)
        //         $lot->update(['top' => NULL, 'top_at' => NULL]);
        // }

        Lot::where('top_at', '<', Carbon::now())->update(['top' => NULL, 'top_at' => NULL]);

        $game = Game::where('id', $id)
            ->with(['currency.lots' => function ($q) use ($user_online) {
                $q->with(['user' => function($q){
                    $q->withCount('reviews');
                }, 'server'])
//                    ->whereHas('user', function ($q) use ($user_online) {
//   User online                 $q->onlineUser($user_online, true);
//                })
                ;
            }, 'tags.lots' => function ($q) use ($user_online) {
                $q->with(['user' => function($q){
                    $q->withCount('reviews');
                }, 'tag', 'server', 'subtags.subtag', 'subtags.subtagMetadata', 'game'])
//                    ->whereHas('user', function ($q) use ($user_online) {
//   User online                     $q->onlineUser($user_online, true);
//                })
                ;
            }, 'tags.subtags' => function ($q) use ($id) {
                $q->where('game_id', $id)
                    ->with(['subTagMetadata', 'attachTagMetadata']);
            }, 'tags.subtags.subTagMetadata', 'servers'])
            ->first();

        $new_chat_event = [];


        if (auth()->check()) {
            $user = auth()->user();

//            if ($user && $user->confirm == 0)
//                Session::flash('flash_message_error', 'Для покупки необходимо потвердить email.');

            $new_msg = $user->newMessageCountLoad();

            $activeTrade = $trade->getUserActiveTradeIds($user->id);

            $active_trade_users_ids = [];

            foreach ($activeTrade as $item) {

                if ($item['owner_id'] == $user->id)
                    $active_trade_users_ids[] = [
                        'user_id' => $item['buyer_id'],
                        'lot_id' => $item['lot_id']
                    ];
                
                else
                    $active_trade_users_ids[] = [
                        'user_id' => $item['owner_id'],
                        'lot_id' => $item['lot_id']
                    ];
                    
            }

            $new_chat_event = [
                'new_msg' => $new_msg,
                'active_trade' => $active_trade_users_ids
            ];
        }

        $new_chat_event = json_encode($new_chat_event);
        if(auth()->guest() || (auth()->check() && auth()->user()->balance < 10)) $commissions = $priceCommission->getForNonRegister();
        else $commissions = $priceCommission->getAll();

        $lang = vue_lang('vue_game', 43200);

        $admin = 1;
        $top = 1;
        $background = 0;

        // dd($game->gameParams);

        $gameParams = $game->gameParams;

        // dd($gameParams);

        // dd($game);

        // dd(json_encode(vue_lang(session("langId"), 'index', 43200)));


        return view('test', compact('game', 'new_chat_event', 'commissions', 'lang', 'admin', 'top', 'background', 'gameParams'));
    }


    public function gameSellService(PriceCommission $priceCommission, $id, $slug, $currency_id)
    {
        $text = null;

        // @lang(session("langId"), 'game', 'add_email_in_settings', 43200)


        if (auth()->user()->email == '') $text .= lang(session("langId"), 'game', 'add_email_in_settings', 43200);
        if (auth()->user()->confirmed == '0') $text .= ' ' . lang(session("langId"), 'game', 'confirm_email_in_settings', 43200);
        if (strlen(auth()->user()->phone) < 5) {
            $text .= ' '.lang(session("langId"), 'game', 'add_msisdn', 43200).' <a href="/profile#tab-cabinet_personal_data">'.lang(session("langId"), 'game', 'link', 43200).'</a>.';
            session()->flash('phone_need', true);
        }

        if (!empty($text)){ session()->flash('flash_message_rules',$text); return redirect()->route('my-profile') . '#tab-cabinet_personal_data';}



        if (auth()->user()->confirmed_rules == 0) {
            session()->flash('flash_message_rules', lang(session("langId"), 'game', 'access_rules', 43200).' <a href="/page/pravila-dlya-prodavcov">'.lang(session("langId"), 'game', 'link', 43200).'</a>');
            return redirect('/page/pravila-dlya-prodavcov');
        }



        $pos = strrpos($currency_id, '-', -1);
        $currency_id = substr($currency_id, $pos, strlen($currency_id));
        $currency_id = preg_replace('/\D/', '', $currency_id);
        $game = Game::find($id);

        $currency = Currency::find($currency_id);

        $commissions = $priceCommission->getAll();

        $lots = Lot::where('owner_id', auth()->id())
            ->where('currency_id', $currency_id)
            ->where('game_id', $id)->get();



        return view('game.sell-service', compact('game', 'currency', 'commissions', 'lots'));
    }

    public function sellCurrency($id, Request $request, $slug, $currency_id)
    {
        $request->merge(['min_order_price' => preg_replace(
            '/[^0-9.]*/',
            null,
            $request->min_order_price
        )]);
        $validator = Validator::make($request->except('_token'), [
            'min_order_price' => 'nullable|numeric|min:0',
            'servers.*.stock' => 'nullable|numeric|min:0',
            'servers.*.price' => 'nullable|numeric|min:0',
        ]);


        if ($validator->fails()) {
            session()->flash('flash_message_error', $validator->errors()->first());
            return redirect()
                ->back()
                ->withErrors($validator)
                ->withInput();
        }

        $text = null;
        if (auth()->user()->email == '') $text .= lang(session("langId"), 'game', 'add_email_in_settings', 43200);
        if (auth()->user()->confirmed == '0') $text .= ' '.lang(session("langId"), 'game', 'confirm_email_in_settings', 43200);
        if (strlen(auth()->user()->phone) < 5) {
            $text .= ' '.lang(session("langId"), 'game', 'add_msisdn', 43200).' <a href="/profile#tab-cabinet_personal_data">'.lang(session("langId"), 'game', 'link', 43200).'</a>.';
            session()->flash('phone_need', true);
        }

        if (!empty($text)){ session()->flash('flash_message_rules',$text); return redirect()->route('my-profile') . '#tab-cabinet_personal_data';}

        if (auth()->user()->confirmed_rules == 0) {
            session()->flash('flash_message_rules', lang(session("langId"), 'game', 'access_rules', 43200).' <a href="/page/pravila-dlya-prodavcov">'.lang(session("langId"), 'game', 'link', 43200).'</a>');
            return redirect('/page/pravila-dlya-prodavcov');
        }



        $pos = strrpos($currency_id, '-', -1);
        $currency_id = substr($currency_id, $pos, strlen($currency_id));
        $currency_id = preg_replace('/\D/', '', $currency_id);


        $servers_currency = $request->input('servers');

        $lots = Lot::where('owner_id', auth()->id())
            ->where('currency_id', $currency_id)
            ->where('game_id', $id)
            ->get();

        $min_order = 0;
        if (isset($request->min_order_price)) {
            $min_order = $request->min_order_price;
            $lots->each(function ($item) use ($min_order) {
                $item->update(['min_order' => $min_order]);
            });
        } elseif (!empty($lots) && $lots->count()) $min_order = !empty($lots->first()->min_order_price) ? $lots->first()->min_order_price : 0;


        foreach ($servers_currency as $key => $s_currency) {

            if (isset($s_currency['server-id']))
                $active = '1';
            else
                $active = '0';

            $currency = Currency::find($currency_id);
            $game = Game::find($id);


            $current_lot = $lots->where('server_id', $key)->first();
            if (!empty($current_lot)) {
                $current_lot->update([
                    'price' => !empty($s_currency['price']) ? $s_currency['price'] : '0',
                    'availability' => !empty($s_currency['stock']) ? $s_currency['stock'] : '0',
                    'min_order' => $min_order,
                    'active' => !empty($s_currency['stock']) && !empty($s_currency['price']) ? $active : '0'
                ]);
            } else {
                if ($s_currency['price'] != null && $s_currency['stock'] != null) {
                    $lot = new Lot();
                    $lot->owner_id = auth()->id();
                    $lot->game_id = $game['id'];
                    $lot->server_id = $key;
                    $lot->currency_id = $currency['id'];
                    $lot->price = !empty($s_currency['price']) ? $s_currency['price'] : '0';
                    $lot->availability = !empty($s_currency['stock']) ? $s_currency['stock'] : '0';
                    $lot->min_order = $min_order;
                    $lot->active = !empty($s_currency['stock']) && !empty($s_currency['price']) ? $active : '0';
                    $lot->save();
                }
            }

        }

        $tag = $slug;

        return redirect('/game/' . $id . '#tab-game-chat-' . $tag);
    }

    public function editCurrencySellProposition($id)
    {
        $lot = Lot::find($id);
        $game = Game::find($lot->game_id);
        $tag = Tag::find($lot->tag_id);


        $currency = Currency::where('id', $lot->currency_id)->first();
        $subtags = $game->subtags;
        $servers = $game->servers;

        return view('profile.modals.edit-currency-lot', compact('lot', 'servers', 'tag', 'subtags', 'currency', 'game'));
    }

    /*
     * Money refuse
     */

    public function refuseLotMoney(Request $request, $id)
    {
//        Lot
    }

    public function editCurrencySellCurrency($id, Request $request)
    {


        $validator = Validator::make($request->except('_token'), [
            'min_order_price' => 'nullable|numeric|min:0',
            'servers.*.stock' => 'nullable|numeric|min:0',
            'servers.*.price' => 'nullable|numeric|min:0',
        ]);


        if ($validator->fails()) {
            session()->flash('flash_message_error', $validator->errors()->first());
            return redirect()
                ->back()
                ->withErrors($validator)
                ->withInput();
        }

        $servers_currency = $request->input('servers');


        foreach ($servers_currency as $key => $s_currency) {
            if (isset($s_currency['server-id'])) {
                $lot = Lot::where(['id' => $id, 'server_id' => $s_currency['server-id']])->first();
                $currency = Currency::where('id', $lot['currency_id'])->first();
                $game = Game::find($id);

                $lot->owner_id = Auth::user()->id;
                $lot->server_id = $s_currency['server-id'];
                $lot->currency_id = $currency['id'];
                $lot->price = $s_currency['price'];
                $lot->availability = $s_currency['stock'];
                $lot->active = 1;
                $lot->save();
            } else {
                $lot = Lot::where(['id' => $id])->first();
                $lot->active = 0;
                $lot->save();
            }

        }

        return redirect('/profile#tab-cabinet_lots');
    }

    public function sellProposition($game_id, $tag_id, Request $request)
    {

        $validator = Validator::make($request->all(), [
            'price' => 'required|numeric|min:0',
            'availability' => 'nullable|numeric|min:0',
            'active' => 'nullable|boolean',
            'min_order' => 'nullable|numeric|min:0',
            'description' => 'nullable|string|max:1000',
        ]);

        if ($validator->fails()) {
            session()->flash('flash_message_error', $validator->errors()->first());
            return redirect('/game/' . $game_id)
                ->withErrors($validator)
                ->withInput();
        }

        $text = null;
        if (auth()->user()->email == '') $text .= lang(session("langId"), 'game', 'add_email_in_settings', 43200);
        if (auth()->user()->confirmed == '0') $text .= ' ' . lang(session("langId"), 'game', 'confirm_email_in_settings', 43200);
        if (strlen(auth()->user()->phone) < 5) {
            $text .= ' '.lang(session("langId"), 'game', 'add_msisdn', 43200).' <a href="/profile#tab-cabinet_personal_data">'.lang(session("langId"), 'game', 'link', 43200).'</a>.';
            session()->flash('phone_need', true);
        }

        if (!empty($text)){ session()->flash('flash_message_rules',$text); return redirect()->route('my-profile') . '#tab-cabinet_personal_data';}


        if (auth()->user()->confirmed_rules == 0) {
            session()->flash('flash_message_rules', lang(session("langId"), 'game', 'access_rules', 43200).' <a href="/page/pravila-dlya-prodavcov">'.lang(session("langId"), 'game', 'link', 43200).'</a>');
            return redirect('/page/pravila-dlya-prodavcov');
        }




        $sub_tags = $request->input('subtags');
        $sub_tags_name = $request->input('subtags_name');
        $active = $request->input('active');
        $tag = '';

        /*
         * for save data for game proposition (Accounts, Items etc.)
         */
        if (!empty(intval($game_id)) && !empty(intval($tag_id))) {
            $game = Game::findOrFail($game_id);
            $tag = Tag::findOrFail($tag_id);
            if (!empty($game)) {
                $lot = Lot::create([
                    'owner_id' => auth()->id(),
                    'min_order' => isset($request->min_order) ? $request->min_order : 0,
                    'game_id' => $game_id,
                    'tag_id' => !empty($tag) ? $tag_id : null,
                    'active' => isset($active) ? $active : 0,
                    'price' => $request->price,
                    'description' => isset($request->description) ? $request->description : null,
                    'server_id' => isset($request->server_id) ? $request->server_id : null,
                    'availability' => isset($request->availability) ? $request->availability : 1
                ]);
                if (!empty($sub_tags)) {
                    $this->subTagsSaveData($sub_tags, $lot);
                }
                if (!empty($sub_tags_name)) {
                    $this->subTagsNameSaveData($sub_tags_name, $lot);
                }
            }
        }

        return redirect('/game/' . $game_id . '#tab-game-chat-' . $tag['name']);

    }

    private
    function subTagsSaveData($subtags, $lot)
    {
        foreach ($subtags as $key => $sub_tag_data) {
            $sub_tag = SubTag::find($key);
            $lot_subtag = new LotSubtag();
            $lot_subtag->sub_tag_value_id = $sub_tag_data;
            $lot_subtag->lot()->associate($lot);
            $lot_subtag->subtag()->associate($sub_tag);
            $lot_subtag->save();
        }
    }

    private
    function subTagsNameSaveData($subtags, $lot)
    {
        foreach ($subtags as $key => $sub_tag_data) {
            $sub_tag = SubTag::find($key);
            $lot_subtag = new LotSubtag();
            $lot_subtag->other_value = $sub_tag_data;
            $lot_subtag->lot()->associate($lot);
            $lot_subtag->subtag()->associate($sub_tag);
            $lot_subtag->save();
        }
    }

    public function editSellProposition($id)
    {
        $lot = Lot::find($id);
        $game = Game::where('id', $lot->game_id)->with(['subtags' => function ($q) use ($lot) {
            $q->where('tag_id', $lot->tag_id);
        }, 'servers'])->first();
        $tag = Tag::find($lot->tag_id);
        $subtags = $game->subtags;
        $servers = $game->servers;
        return view('profile.edit-lot', compact('lot', 'servers', 'tag', 'subtags'));
    }



    public
    function saveEditSellProposition($id, Request $request)
    {

        $validator = Validator::make($request->all(), [
            'price' => 'required|numeric|min:0',
            'availability' => 'nullable|numeric|min:0',
            'active' => 'nullable|boolean',
            'min_order' => 'nullable|numeric|min:0',
            'description' => 'nullable|string|max:100',
            'server_id' => 'required|exists:servers,id'
        ]);

        if ($validator->fails()) {
            session()->flash('flash_message_error', $validator->errors()->first());
            return back()
                ->withErrors($validator)
                ->withInput();
        }


        $data = $request->except('subtags', '_token', 'active');
        $sub_tags = $request->input('subtags');
        $active = $request->input('active');

        $lot = Lot::find($id);


        /*
         * for save data for game proposition (Accounts, Items etc.)
         */
        if (!empty(intval($lot->game_id)) && !empty(intval($lot->game_id))) {
            $lot->active = isset($active) ? $active : 0;

            $lot->update($data);

            if (!empty($sub_tags) && $lot->save()) {
                $this->subTagsUpdateData($sub_tags, $lot);
            }
        }

        return redirect('/profile#tab-cabinet_lots');
    }

    private
    function subTagsUpdateData($subtags, $lot)
    {

        LotSubtag::where(['lot_id' => $lot->id])->delete();
        foreach ($subtags as $key => $sub_tag_data) {
            $lot_subtag = new LotSubtag();
            $lot_subtag->sub_tag_value_id = $sub_tag_data;
            $lot_subtag->lot_id = $lot->id;
            $lot_subtag->sub_tag_id = $key;
            $lot_subtag->save();
        }
    }

    public
    function lotForm($id)
    {
        $lot = Lot::find($id);
        return view('game.lot-form', compact('lot'));
    }

    public
    function lotChat($id)
    {
        return view('game.lot-chat');
    }
}
