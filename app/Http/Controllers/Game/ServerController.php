<?php

namespace App\Http\Controllers\Game;

use App\Http\Controllers\Controller;
use App\Models\Game;
use App\Models\Server;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class ServerController extends Controller
{
    /**
     * Index page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $servers = Server::with('games')->paginate(50);
        return view('vendor.voyager.servers.index', compact('servers'));
    }

    /**
     * View for edit
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function storeView()
    {
        $games = Game::all();
        return view('vendor.voyager.servers.add', compact('games'));
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
            'name' => 'required|unique:servers',
        ]);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect('admin/add-server')
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $server = new Server();
            $server->name = $data['name'];
            if ($server->save()) {
                Session::flash('flash_message_success', 'Server saved');
            } else {
                Session::flash('flash_message_error', 'Server not saved');
            }
            return redirect('/admin/servers');
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
        $server = Server::find($id);
        $games = Game::all();

        return view('vendor.voyager.servers.edit', compact('server', 'games'));
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
            'name' => 'required|unique:servers',
        ]);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect('admin/add-server')
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $server = Server::find($id);
            $server->name = $data['name'];
            if ($server->save()) {
                Session::flash('flash_message_success', 'Server update');
            } else {
                Session::flash('flash_message_error', 'Server not update');
            }
            return redirect('/admin/servers');
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
        $server = Server::find($id);

        if ($server) {
            $server->delete();
            Session::flash('flash_message_success', 'Server deleted');
            return redirect('/admin/servers');
        }
        Session::flash('flash_message_error', 'Server not deleted');
        return redirect('/admin/servers');
    }
}
