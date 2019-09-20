<?php

namespace App\Http\Controllers\Game;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Game;
use App\Models\Lot;
use App\Models\LotSubtag;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

use Carbon\Carbon;

class LotController extends Controller
{
    public function index()
    {
        $lots = Lot::with('game', 'tag', 'subtags')->orderBy('created_at', 'DESC')->paginate(50);

        return view('vendor.voyager.lots.index', compact('lots'));
    }

    public function updateView($id)
    {
        $lot = Lot::find($id);
        $mutable = Carbon::now();
        $data = $mutable <=> $lot->top_at;
        if($data == 1)
            $lot->update(['top' => NULL, 'top_at' => NULL]);

        $game = Game::where('id', $lot->game_id)->with(['servers', 'subtags' => function ($q) use ($lot) {
            $q->where('tag_id', $lot->tag_id);
        }])->first();
        $tag = Tag::find($lot->tag_id);
        $games = Game::all();
        $currencies = Currency::all();
        $subtags = $game->subtags;
        $servers = $game->servers;

        return view('vendor.voyager.lots.edit', compact('lot', 'servers', 'tag', 'subtags', 'games', 'currencies'));
    }

    public function update($id, Request $request)
    {
        $data       = $request->except('subtags', '_token', 'active'/*, 'top', 'top_at'*/);
        $sub_tags   = $request->input('subtags');
        $active     = $request->input('active');
        $top        = $request->input('top');
        $top_at     = $request->input('top_at');

        $lot = Lot::find($id);

        $validator = Validator::make($data, [
            'server_id' => 'required',
            'price' => 'required',
        ]);
        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect('/admin/edit-lot/'.$id)
                ->withErrors($validator)
                ->withInput();
        }

        // dump($lot->game_id);
        // dump(intval($lot->game_id));

        /*
         * for save data for game proposition (Accounts, Items etc.)
         */
        if (!empty(intval($lot->game_id)) && !empty(intval($lot->game_id))) {
            $game = Game::find($lot->game_id);
            $tag = Tag::find($lot->tag_id);
            $lot->active = isset($active) ? $active : 0;

            $lot->update($data);
            if (!empty($sub_tags) && $lot->save()) {
                $this->subTagsUpdateData($sub_tags, $lot);
            }
        }

        if(empty($top)) {
            $lot->update(['top' => NULL, 'top_at' => NULL]);
        }
        
        return redirect('/admin/edit-lot/'.$id);
    }


    private function subTagsUpdateData($subtags, $lot)
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

    public function destroy($id)
    {
        $lot = Lot::find($id);

        $lot->subtags()->delete();
        $lot->delete();

        Session::flash('flash_message_success', 'Tag deleted');
        return redirect('/admin/lots');
    }
}
