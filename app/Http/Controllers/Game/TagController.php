<?php

namespace App\Http\Controllers\Game;

use App\Models\Tag;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class TagController extends Controller
{
    /**
     * Index page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $tags = Tag::paginate(50);
        return view('vendor.voyager.tags.index', compact('tags'));
    }

    /**
     * View for edit
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function storeView()
    {
        return view('vendor.voyager.tags.add');
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
            'name' => 'required|unique:tags',
        ]);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect('admin/add-tag')
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $tag = new Tag();
            $tag->name = $data['name'];
            $tag->price_per_unit = isset($data['price_per_unit']) ? $data['price_per_unit'] : 0 ;;
            if ($tag->save()) {
                Session::flash('flash_message_success', 'Tag saved');
            } else {
                Session::flash('flash_message_error', 'Tag not saved');
            }
            return redirect('/admin/tags');
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
        $tag = Tag::find($id);
        return view('vendor.voyager.tags.edit', compact('tag'));
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
            'name' => 'required|unique:tags,name,'.$id.'',
        ]);
//        dd($data);
        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect('admin/edit-tag/'.$id)
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $tag = Tag::find($id);
            $tag->name = $data['name'];
            $tag->price_per_unit = isset($data['price_per_unit']) ? $data['price_per_unit'] : 0 ;
            if ($tag->save()) {
                Session::flash('flash_message_success', 'Tag update');
            } else {
                Session::flash('flash_message_error', 'Tag not update');
            }
            return redirect('/admin/tags');
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
        $tag = Tag::find($id);

        if ($tag) {
            $tag->delete();
            Session::flash('flash_message_success', 'Tag deleted');
            return redirect('/admin/tags');
        }
        Session::flash('flash_message_error', 'Tag not deleted');
        return redirect('/admin/tags');
    }
}
