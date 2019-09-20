<?php

namespace App\Http\Controllers;

use App\Models\Game;
use App\Models\Lot;
use App\Models\SubTagMetadata;
use App\Models\Tag;
use App\Models\Trade;
use App\User;
use Auth;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    /**
     * Search on home page
     * Search Games, Tags, Currency
     *
     * @param Request $request
     * @return \Illuminate\Contracts\Routing\ResponseFactory|\Symfony\Component\HttpFoundation\Response
     */
    public function search(Request $request)
    {
        if ($request->ajax()) {
            $search_string = $request->search;

            //Search game by name
            $search_data = Game::with('tags', 'currency')->where('name', 'LIKE', '%' . $search_string . '%')->get();

            if ($search_data->isEmpty()) {
                //Search tags by name
                $game_tags = Game::with(['currency', 'tags' => function ($query) use ($search_string) {
                    $query->where('name', 'like', '%' . $search_string . '%');
                }])->get();
                foreach ($game_tags as $tag) {
                    $tags_arr = $tag->tags->toArray();

                    if (!empty($tags_arr)) {
                        $search_data[] = $tag;
                    }
                }
                if ($search_data->isEmpty()) {
                    //Search currency by name
                    $game_currency = Game::with(['tags', 'currency' => function ($query) use ($search_string) {
                        $query->where('name', 'like', '%' . $search_string . '%');
                    }])->get();
                    foreach ($game_currency as $currency) {
                        $currency_arr = $currency->currency->toArray();

                        if (!empty($currency_arr)) {
                            $search_data[] = $currency;
                        }
                    }
                }
            }
            $games = $search_data->groupBy(function ($item, $key) {
                return mb_substr($item->name, 0, 1);
            });
            return response()->json(view('_partial._main_search', compact('games'))->render());
//            return response($search_data);
        }
    }

    public function searchServer(Request $request)
    {

        $referrer = $request->headers->get('referer');
        $path = parse_url($referrer, PHP_URL_PATH);
        $pathFragments = explode('/', $path);
        $game_id = end($pathFragments);

        $currency_id = $request->currency_id;
        $server_id = $request->server_id;
        $is_online = $request->is_online;
        $sort_by = $request->sort_by;

        $user = [];
        if ($is_online == true) {
            $users = new User();
            $user = $users->allOnline()->pluck('id')->toArray();
        }

        $query = Lot::whereHas('user', function ($q) use ($user, $is_online) {
            $q->onlineUser($user, $is_online);
        });

        if($sort_by == 1)
            $query = $query->orderBy('price', 'ASC');
        else if($sort_by == 2)
            $query = $query->orderBy('price', 'DESC');
        // else if($sort_by == 3) {
            // dd($query->get());
            // $user = new User();
            // $user = $user->orederBy('name', 'DESC')->get();

            // $query = $query->with('userDesc');
            // $query = $query->with(['user' => function($q) {
            //     $q->orderBy('name', 'ASC');
            // }]);

            // $query = $query->select('users.*')
            //     ->leftJoin('lots', 'lots.owner_id', '=', 'users.id')
                
            //     ->groupBy('users.id')
            //     ->orderByDesc('users.name')->find('all');

            // $query = $query->with('user')->toSql()/*orderBy(\DB::raw('users.name'))*/;
// dd($query);
            // $query = $query
            //     ->with(['user' => function ($query) {
            //         return $query->orderBy('name', 'ASC');
            //     }]);
                // ->join('user', 'lots.owner_id', '=', 'user.id')
                // ->orederBy('user.name', 'DESC');

            //             Forum::with([
            //     'comments' => function($q){
            //          $q->orderBy('created_at', 'desc');
            //      },
            //     'comments.user'
            // ])->find($id);
            // dump($query->get());
            // $query = $query->leftJoin('lots','users.id','=','lots.currency_id')
            // ->selectRaw('lots.*, count(lots.currency_id) AS `count`')
            // ->orderBy('count','DESC')->get();
            // $query = $query->withCount('user')->orderBy('name', 'DESC');
            // $query = $query->with('user')->get()->sortByDesc('user.name');
            // $query = $query->with('user')->orderBy('user.name', 'DESC');/*->orederBy('name', 'ASC')*/;
            // dump($query);
            // dd(1);
            // dump($query->get());
        // }
        // else if($sort_by == 4) {
        //     $query = $query->with(['user' => function ($q) { return $q->orederBy('name', 'ASC'); }]);

        // }
        else if($sort_by == 5)
            $query = $query->orderBy('created_at', 'DESC');
        else if($sort_by == 6)
            $query = $query->orderBy('created_at', 'ASC');

        else if($sort_by == 51)
            $query = $query->orderBy('created_at', 'DESC')->orderBy('price', 'ASC');
        else if($sort_by == 52)
            $query = $query->orderBy('created_at', 'DESC')->orderBy('price', 'DESC');
        else if($sort_by == 53)
            $query = $query->orderBy('created_at', 'DESC')->with(['user' => function ($q) { $q->orederBy('name', 'ASC'); }]);
        else if($sort_by == 54)
            $query = $query->orderBy('created_at', 'DESC')->with(['user' => function ($q) { $q->orederBy('name', 'DESC'); }]);

        else if($sort_by == 61)
            $query = $query->orderBy('created_at', 'ASC')->orderBy('price', 'ASC');
        else if($sort_by == 62)
            $query = $query->orderBy('created_at', 'ASC')->orderBy('price', 'DESC');
        else if($sort_by == 63)
            $query = $query->orderBy('created_at', 'ASC')->with(['user' => function ($q) { $q->orederBy('name', 'ASC'); }]);
        else if($sort_by == 64)
            $query = $query->orderBy('created_at', 'ASC')->with(['user' => function ($q) { $q->orederBy('name', 'DESC'); }]);
        else if($sort_by == 0)
            $query = $query;

        // dump($query);
        $search_server = $query
            ->serverId($server_id)
            // ->where('server_id', $server_id)
            ->where([
                'currency_id' => $currency_id,
                'game_id' => $game_id,
                'active' => 1
            ])
            ->with(['user' => function ($q) {
                $q->withCount('reviews')->with('reviews');
            }, 'server'])
            ->get();

        return response($search_server);
    }

    public function gameTagsFilter(Request $request)
    {
        if ($request->ajax()) {
            $dialog_msg = [];
            $tag_id = $request->tag_id;
            $server_id = $request->server_id;
            $subtag_id = $request->subtag_id;
            $meta_id = $request->meta_id;

            $referrer = $request->headers->get('referer');
            $path = parse_url($referrer, PHP_URL_PATH);
            $pathFragments = explode('/', $path);
            $game_id = end($pathFragments);

            $tag = Tag::find($tag_id);
            $game = Game::find($game_id);

            $meta_subtag = SubTagMetadata::find($meta_id);
            if ($meta_subtag) {
                $lots = Lot::whereHas(
                    'subtags', function ($q) use ($meta_subtag) {
                    $name = isset($meta_subtag->name) ? $meta_subtag->name : '';
                    if ($name)
                        $q->where('name', 'like', $name);
                })->whereHas(
                    'server', function ($q) use ($server_id) {
                    if ($server_id != 0)
                        $q->where('id', '=', $server_id);
                })->
                whereHas(
                    'tag', function ($t) use ($tag_id) {
                    $t->where('id', '=', $tag_id);
                })
                    ->orderBy('price', 'ASC')
                    ->get();
            } elseif ($server_id) {

                $lots = Lot::whereHas(
                    'server', function ($q) use ($server_id) {
                    $q->where('id', '=', $server_id);
                })->
                whereHas(
                    'tag', function ($t) use ($tag_id) {
                    $t->where('id', '=', $tag_id);
                })
                    ->orderBy('price', 'ASC')
                    ->get();
            } else {
                $lots = Lot::where(['game_id' => $game_id, 'tag_id' => $tag_id])
                    ->orderBy('price', 'ASC')
                    ->get();
            }

            $html = view('game.parts.lot-block', compact('lots', 'game', 'tag', 'dialog_msg'))->render();

            return response()->json(compact('html'));

        }
    }

    public function lotsFilter(Request $request)
    {

        $user = auth()->user();
        //Filter
        $filter = [];
        isset($request->status_id) ? $filter[] = ['status_id', '=', $request->status_id] : null;
        if (isset($request->tag_id)) if ($request->tag_id != 'currency') $filter[] = ['tag_id', '=', $request->tag_id];
        isset($request->game_id) ? $filter[] = ['game_id', '=', $request->game_id] : null;
        isset($request->server_id) ? $filter[] = ['server_id', '=', $request->server_id] : null;
        isset($request->user_id) ? $filter[] = ['owner_id', '=', $request->user_id] : null;

        // Get URL path
        $referrer = $request->headers->get('referer');
        $path = parse_url($referrer, PHP_URL_PATH);
        $pathFragments = explode('/', $path);
        $url_path = end($pathFragments);

        // Get Lots
        if (!empty($filter) && $url_path != 'profile') {
            $lots = Lot::where($filter)->orderByGameTag()->get();
            return response()->json(view('profile.parts.user-profile-list', compact('lots'))->render());
        } elseif (!empty($filter) && $url_path == 'profile') $lots = Lot::where($filter)->where('owner_id', $user->id)->orderByGameTag()->get();
        else $lots = Lot::where('owner_id', $user->id)->orderByGameTag()->get();

        return response()->json(view('profile.parts.list-lots', compact('lots'))->render());
    }

    public function salesFilter(Request $request)
    {
        $user = auth()->user();
        $dialog_msg = [];
        if ($request->input('status') == 0 || $request->input('status') == 1 || $request->input('status') == 3) {
            $status = [$request->input('status')];
        }

        if (!empty($request->input())) {
            $sales = Trade::whereHas(
                'lot', function ($lot) use ($request) {
                if ($request->input('game_id')) {
                    $lot->where('game_id', $request->input('game_id'));
                }
            })->whereHas(
                'buyer', function ($buyer) use ($request) {
                if ($request->input('buyer_name')) {
                    $buyer->where('name', 'like', '%' . $request->input('buyer_name') . '%');
                }
            })
                ->where(function ($q) use ($request) {
                    if ($request->input('id')) {
                        $q->where('id', $request->input('id'));
                    } elseif ($request->input('status') != null && intval($request->input('status')) == 0 || intval($request->input('status')) == 1 || intval($request->input('status')) == 3) {
                        $q->where('status', $request->input('status'));
                    }
                })
                ->where(function ($buyer) use ($user) {
                    $buyer->where('owner_id', '=', $user->id);
                })
                ->where(function ($query) {
                    $query->where('is_payed', '1')
                        ->orWhere('status', '3');
                })
                ->orderBy('created_at', 'DESC')
                ->get();
        } else {
            $sales = Trade::where('owner_id', $user->id)->where('is_payed', '1')->orderBy('status', 'DESC')->get();
        }

        $html = view('trade.parts.sales-list', compact('sales', 'dialog_msg'))->render();

        return response()->json(compact('html'));

    }


    public function itemFilter(Request $request, $game_id, $tag_id)
    {

        // dump($request->all());
        if (!empty($request->subtags) && count($request->subtags))
            $subtags = array_filter($request->subtags);
        else
            $subtags = null;

        if (!empty($request->subtag_name) && count($request->subtag_name))
            $subtags_name = array_filter($request->subtag_name);
        else
            $subtags_name = null;


        $server_id = $request->server_id;
        $sort_by = $request->sort;


        $is_online = $request->salers;

        $user = [];
        if ($is_online != null) {
            $users = new User();
            $user = $users->allOnline()->pluck('id')->toArray();
        } else
            $is_online = false;




        // $lots = Lot::where('game_id', $game_id)
        //     ->where('tag_id', $tag_id)
        //     ->where('active', '1')
        //     ->serverId($server_id)
        //     ->whereHas('user', function ($q) use ($user, $is_online) {
        //         $q->onlineUser($user, $is_online);
        //     })
        //     ->lotSubtagWithName($subtags_name)
        //     ->lotSubtag($subtags)
        //     ->with(['user' => function ($q) {
        //         $q->withCount('reviews')->with('reviews');
        //     }, 'tag', 'server', 'subtags.subtag', 'subtags.subtagMetadata', 'game'])
        //     ->orderBy('price', 'ASC')
        //     ->get();

        $query = Lot::where('game_id', $game_id)
            ->where('tag_id', $tag_id)
            ->where('active', '1')
            ->serverId($server_id)
            ->whereHas('user', function ($q) use ($user, $is_online) {
                $q->onlineUser($user, $is_online);
            })
            ->lotSubtagWithName($subtags_name)
            ->lotSubtag($subtags)
            ->with(['user' => function ($q) {
                $q->withCount('reviews')->with('reviews');
            }, 'tag', 'server', 'subtags.subtag', 'subtags.subtagMetadata', 'game']);
            // ->orderBy('price', 'ASC')
            // ->get();


        if($sort_by == 1)
            $query = $query->orderBy('price', 'ASC');
        else if($sort_by == 2)
            $query = $query->orderBy('price', 'DESC');
        else if($sort_by == 3)
            $query = $query->with(['user' => function ($q) { $q->orederBy('name', 'ASC'); }]);
        else if($sort_by == 4)
            $query = $query->with(['user' => function ($q) { $q->orederBy('name', 'DESC'); }]);
        else if($sort_by == 5)
            $query = $query->orderBy('created_at', 'DESC');
        else if($sort_by == 6)
            $query = $query->orderBy('created_at', 'ASC');

        else if($sort_by == 51)
            $query = $query->orderBy('created_at', 'DESC')->orderBy('price', 'ASC');
        else if($sort_by == 52)
            $query = $query->orderBy('created_at', 'DESC')->orderBy('price', 'DESC');
        else if($sort_by == 53)
            $query = $query->orderBy('created_at', 'DESC')->with(['user' => function ($q) { $q->orederBy('name', 'ASC'); }]);
        else if($sort_by == 54)
            $query = $query->orderBy('created_at', 'DESC')->with(['user' => function ($q) { $q->orederBy('name', 'DESC'); }]);

        else if($sort_by == 61)
            $query = $query->orderBy('created_at', 'ASC')->orderBy('price', 'ASC');
        else if($sort_by == 62)
            $query = $query->orderBy('created_at', 'ASC')->orderBy('price', 'DESC');
        else if($sort_by == 63)
            $query = $query->orderBy('created_at', 'ASC')->with(['user' => function ($q) { $q->orederBy('name', 'ASC'); }]);
        else if($sort_by == 64)
            $query = $query->orderBy('created_at', 'ASC')->with(['user' => function ($q) { $q->orederBy('name', 'DESC'); }]);

        $lots = $query->get();

        return response()->json($lots);

    }


    public function profileLotFilter(Request $request, $id)
    {
        $filter = [];
        $filter[] = ['active', '=', '1'];
        $filter[] = ['owner_id', '=', $id];
        isset($request->status_id) ? $filter[] = ['status_id', '=', $request->status_id] : null;
        if (isset($request->tag_id)) if ($request->tag_id != 'currency') $filter[] = ['tag_id', '=', $request->tag_id];
        isset($request->game_id) ? $filter[] = ['game_id', '=', $request->game_id] : null;
        isset($request->server_id) ? $filter[] = ['server_id', '=', $request->server_id] : null;

        $lots = Lot::where($filter)->currencyFilter($request->tag_id == 'currency')->with(['currency', 'game', 'tag', 'server'])->get();

        return response()->json(view('profile.parts.user-profile-list', compact('lots'))->render());


    }
}
