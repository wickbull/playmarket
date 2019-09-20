<?php

namespace App\Http\Controllers\Game;

use App\Http\Controllers\Controller;
use App\Models\Game;
use App\Models\SubTag;
use App\Models\SubTagMetadata;
use App\Models\Tag;
use App\Models\TagSubTag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class SubTagController extends Controller
{
    /**
     * Index page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $sub_tags = SubTag::paginate(50);

        return view('vendor.voyager.sub_tags.index', compact('sub_tags'));
    }

    /**
     * View for edit
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function storeView()
    {
        $tags = Tag::all();
        $games = Game::all();
        $subtags = SubTag::whereHas('subTagMetadata')->with('subTagMetadata')->orderBy('name')->get();
        return view('vendor.voyager.sub_tags.add', compact('tags', 'games', 'subtags'));
    }

    /**
     * Create sub tag and add
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $game_id = $request->input('game');
        $tag_id = $request->input('tag');
        $sub_tag_name = $request->input('sub_tag_name');
        $sub_tag_metadata = $request->only('metadata');
        if (!$request->ajax()) {
            $sub_tag = new SubTag();
            $sub_tag->name = $sub_tag_name;
            $sub_tag->priority = $request->priority;
            $sub_tag->attach = isset($data['attach']) ? $data['attach'] : 0;

            if ($sub_tag->save() && isset($tag_id) && isset($game_id)) {
                Session::flash('flash_message_success', 'SubTag saved');
                $this->relationTagAndSubTag($tag_id, $sub_tag->id, $game_id);
                if (isset($sub_tag_metadata['metadata'])) {
                    $this->subTagMetadata($sub_tag_metadata['metadata'], $sub_tag, $request->metadata_priority);
                }
            }
            return redirect('/admin/sub-tags');
        }
    }

    /**
     *
     * Create relationship between tag, sub tag and game table
     *
     * @param $tag_id
     * @param $sub_tag_id
     * @param $game_id
     * @return $this|TagSubTag
     */
    private function relationTagAndSubTag($tag_id, $sub_tag_id, $game_id)
    {
        $find_rel = TagSubTag::where('sub_tag_id', $sub_tag_id)->get();

        if ($find_rel->isNotEmpty()) {
            $rel = TagSubTag::where('sub_tag_id', $sub_tag_id);
            $rel->update([
                'tag_id' => $tag_id,
                'game_id' => $game_id
            ]);
            return $rel;
        } else {
            $rel = new TagSubTag();

            $rel->tag_id = $tag_id;
            $rel->sub_tag_id = $sub_tag_id;
            $rel->game_id = $game_id;
            $rel->save();

        }
    }

    /**
     * Save sub tag metadata in table
     *
     * @param $metadatas
     * @param $sub_tag_id
     */
    private function subTagMetadata($metadatas, $sub_tag, $priority = [])
    {

        foreach ($metadatas as $metadataKey => $metadata) {
            $find_sub_tag = SubTagMetadata::where(['subtags_id' => $sub_tag->id, 'name' => $metadata])->get();

            if ($find_sub_tag->isNotEmpty()) {
                $sub_tag_metadata = SubTagMetadata::where([
                    'subtags_id' => $sub_tag->id,
                    'name' => $metadata,
                ])->update(
                    ['name' => $metadata, 'subtags_id' => $sub_tag->id, 'priority' => !empty($priority[$metadataKey]) ? $priority[$metadataKey] : null]
                );
            } else {
                $sub_tag_metadata = new SubTagMetadata();
                $sub_tag_metadata->name = $metadata;
                $sub_tag_metadata->subtags_id = $sub_tag->id;
                $sub_tag_metadata->priority = $priority[$metadataKey];
                $sub_tag_metadata->save();
            }
        }
    }

    /**
     *
     *
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function updateView($id)
    {
        $sub_tag = SubTag::find($id);

        $tags = Tag::all();
        $games = Game::all();
        $subtags = SubTag::orderBy('name')->get();
//        whereHas('games', function ($q) use ($sub_tag) {
//            if (!empty($sub_tag->games) && !empty($sub_tag->games->first()))
//                $q->where('game_id', $sub_tag->games->first()->id);
//        })


        return view('vendor.voyager.sub_tags.edit', compact('sub_tag', 'tags', 'games', 'subtags'));
    }

    /**
     *
     *
     *
     * @param $id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function update($id, Request $request)
    {
        $data = $request->all();
        $game_id = $request->input('game');
        $tag_id = $request->input('tag');
        $sub_tag_name = $request->input('name');
        $sub_tag_metadata = $request->only('metadata');
        $attach = isset($data['attach']) ? $data['attach'] : 0;
        if (!$request->ajax()) {
            $sub_tag = SubTag::find($id);
            if (!empty($sub_tag_name)) {
                $sub_tag->name = $sub_tag_name;
                $sub_tag->priority = $request->priority;
            }
            if (isset($attach)) {
                $sub_tag->attach = $attach;
                $sub_tag->save();
            }
            if (isset($tag_id) && isset($game_id)) {
                Session::flash('flash_message_success', 'SubTag saved');
                $this->relationTagAndSubTag($tag_id, $sub_tag->id, $game_id);
                if (isset($sub_tag_metadata['metadata'])) {
                    $this->subTagMetadata($sub_tag_metadata['metadata'], $sub_tag, $request->metadata_priority);
                } elseif (empty($sub_tag_metadata['metadata']) && $sub_tag->subTagMetadata()->get()->isNotEmpty()) {
                    $metadata = $sub_tag->subTagMetadata()->delete();
                }
            }
            return redirect('/admin/edit-sub-tag/'.$id);
        }
    }

    public function destroy($id)
    {
        $sub_tag = SubTag::find($id);
        $sub_tag->tags()->detach();
        $sub_tag->subTagMetadata()->delete();
        $sub_tag->delete();
        return redirect('/admin/sub-tags');
    }


    public function destroySubTagMetadata(Request $request)
    {
        SubTagMetadata::destroy($request->id);
        return response()->json(['success' => true]);
    }
}
