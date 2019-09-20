<?php

namespace App\Http\Controllers\Game;

use App\Http\Controllers\Controller;
use App\Models\Game;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class SideController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $server_side = ServerSide::with('game')->paginate(50);
        return view('vendor.voyager.server_side.index', compact('server_side'));
    }

    /**
     * View for edit
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create()
    {
        $games = Game::all();
        return view('vendor.voyager.server_side.add', compact('games'));
    }

    /**
     * Create action
     *
     * @param Request $request
     * @return $this
     */
    public function store(Request $request)
    {

        $data = $request->all();
        $validator = Validator::make($data, [
            'title' => 'required',
            'game_id' => 'required|numeric',
        ]);


        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $server_side = new ServerSide();
            if ($server_side->firstOrCreate($request->only('title', 'game_id'))) {
                Session::flash('flash_message_success', 'server_side saved');
            } else {
                Session::flash('flash_message_error', 'server_side not saved');
            }
            return redirect('/admin/side');
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
        $server_side = ServerSide::find($id);
        $games = Game::all();
        return view('vendor.voyager.server_side.edit', compact('server_side', 'games'));
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
        $data = $request->all();
        $validator = Validator::make($data, [
            'title' => 'required|string|min:2',
            'game_id' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $server_side = ServerSide::find($id);
            if ($server_side->update($request->only('title', 'game_id'))) {
                Session::flash('flash_message_success', 'Сторона update');
            } else {
                Session::flash('flash_message_error', 'Сторона not update');
            }
            return redirect('/admin/side');
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
        ServerSide::destroy($id);
        Session::flash('flash_message_success', 'Сторона удалена');
        return redirect('/admin/side');
    }
}
