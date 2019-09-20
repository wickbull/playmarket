<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Review;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $comments = Review::paginate(50);
        return view('vendor.voyager.comment.index', compact('comments'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Review $comment)
    {
        return view('vendor.voyager.comment.edit', compact('comment'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Review $comment)
    {
        if ($comment->mark != $request->mark) {
            $user = $comment->seller;
            $rating = $user->rating;
            if (!empty($rating)) $user->update(['rating' => $request->mark ? ++$rating : --$rating]);
            else $user->update(['rating' => $request->mark ? '1' : '-1']);
        }
        $comment->update($request->all());
        $comment->created_at = $request->created_at;
        $comment->save();
        session()->flash('flash_message_success', 'Успешно обновленно');
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Review $comment)
    {
        $comment->delete();
        session()->flash('flash_message_success', 'Успешно удален');
        return back();
    }
}
