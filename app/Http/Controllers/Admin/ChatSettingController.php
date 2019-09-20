<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ChatSetting;
use Illuminate\Http\Request;

class ChatSettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(ChatSetting $chatSetting)
    {
        $chat_settings = $chatSetting->getAllP('10');
        return view('vendor.voyager.chat.setting.index', compact('chat_settings'));
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
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $setting = ChatSetting::find($id);
        return view('vendor.voyager.chat.setting.edit', compact('setting'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required|string',
            'value' => 'required|numeric',
            'is_active' => 'nullable|boolean',
        ]);
        $setting = ChatSetting::find($id);
        $setting->update([
            'title' => $request->title,
            'value' => $request->value,
            'is_active' => isset($request->is_active) ? 1 : 0
        ]);
        return redirect()->route('chat-setting');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
