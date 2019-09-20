<?php

namespace App\Http\Controllers\Game;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Game;
use App\Models\Server;
use App\Models\Tag;

use App\Models\GameCustomParam;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class GameController extends Controller
{
    /**
     * Game list
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $games = Game::with('tags')->paginate(50);
        return view('vendor.voyager.game.index', compact('games'));
    }

    /**
     * View for create
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function storeView()
    {
        $tags = Tag::all();
        $servers = Server::all();
        $currency = Currency::all();
        return view('vendor.voyager.game.add', compact('tags', 'servers', 'currency'));
    }

    /**
     * Create action
     *
     * @param Request $request
     * @return $this
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect('admin/add-game')
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $game = new Game();
            $game->name = $request->name;
            $game->region = $request->region;
            isset($request->description) ? $game->description = $request->description : null;
            $game->save();


            $count = 0;
            foreach ($request->servers as $serverKey => $serverItem) {
                if (!empty($serverKey) && !empty($serverItem))
                    $game->servers()->create([
                        'name' => $serverItem,
                        'side' => isset($request->side[$count]) ? $request->side[$count] : null,
                    ]);
                $count++;
            }
            $game->tags()->sync($request->tags);

            $game->currency()->sync($request->currency);

            return redirect('/admin/games-list');
        }

    }

    /**
     * View for update
     *
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function updateView($id)
    {
        $game = Game::find($id);
        $tags = Tag::all();
        $servers = Server::all();
        $currency = Currency::all();

        return view('vendor.voyager.game.edit', compact('game', 'tags', 'servers', 'currency'));
    }

    public function deleteParam($id)
    {
        GameCustomParam::find($id)->delete();
        return 'done';
    }

    public function editParam(Request $request)
    {
        $game = GameCustomParam::find($request->id);
        $game->updateOrCreate([
            'id' => $request->id,
        ],[
            'name' => $request->name,
            'custom_input' => $request->custom_input,
            'param' => $request->param,
        ]);

        return 'done';

        // $game->gameParams()->updateOrCreate([
        //             'name' => $value->name
        //         ], [
        //             'custom_input' => $value->custom_input,
        //             'param' => $value->param,
        //         ]);
    }

    /**
     * Update action
     *
     * @param $id
     * @param Request $request
     * @return $this
     */
    public function update($id, Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
        ]);

        $customParams = json_decode($request->customParams);

        // dd($customParams);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect('admin/add-game')
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $game = Game::find($id);
            $game->name = $request->name;
            $game->region = $request->region;
            isset($request->description) ? $game->description = $request->description : null;

            $game->tags()->sync($request->tags);

            $game->currency()->sync($request->currency);

            if(!empty($customParams))
                foreach ($customParams as $key => $value) {
                    $game->gameParams()->updateOrCreate([
                        'name' => $value->name
                    ], [
                        'custom_input' => $value->custom_input,
                        'param' => $value->param,
                    ]);
                }

            if (!empty($request->servers) && count($request->servers))
                foreach ($request->servers as $serverKey => $serverItem)
                    if (!empty($serverKey) && !empty($serverItem))

                        $game->servers()->updateOrCreate([
                            'id' => $serverKey,
                        ], [
                            'name' => $serverItem,
                            'side' => isset($request->side[$serverKey]) ? $request->side[$serverKey] : null,
                        ]);



            if ($game->save()) Session::flash('flash_message_success', 'Успешно обновлено');
            else Session::flash('flash_message_error', 'Error');
            return back();
        }

    }

    /**
     * Delete action
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function destroy($id)
    {
        $game = Game::find($id);

        if ($game) {
            $game->servers()->delete();
            $game->delete();
            Session::flash('flash_message_success', 'Game deleted');
            return redirect('/admin/games-list');
        }
        Session::flash('flash_message_error', 'Game not deleted');
        return redirect('/admin/games-list');
    }

    public function destroyServer($id)
    {
        $server = Server::find($id);

        if ($server) {
            $server->delete();
            return response()->json(['success' => true]);
        }
    }

}
