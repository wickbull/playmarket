<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ChatDisput;
use App\Models\Dialog;
use App\Models\DialogMessage;
use App\Models\Trade;
use App\Traits\ChatTrait;
use App\User;
use Illuminate\Http\Request;

class ChatAdminController extends Controller
{
    use ChatTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Dialog $dialog)
    {
        $chats = $dialog->getAllChatAdmin();
        return view('vendor.voyager.chat.index', compact('chats'));
    }

    public function disput()
    {
        $chats = ChatDisput::with('dialog')->orderBy('status')->paginate();
        return view('vendor.voyager.disput.index', compact('chats'));
    }

    public function userChat(Trade $trade, User $userModel, $id)
    {
        $user = User::find($id);

        $user_dialog_thread = $this->getDialogIdsArray($user->id);

        $chats = $userModel->getAllUserByDialogId($user_dialog_thread,$user->id);

        return view('vendor.voyager.chat.user-chat', compact('user', 'chats'));
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
    public function store(Request $request, $id)
    {
        $this->validate($request, [
            'msg' => 'required|string|max:700'
        ]);
        $dialog = new Dialog();
        $dialogs = $dialog->getParticipantsId($id);
        $users_id = $dialogs->dialogParticipants->where('user_id', '!=', '1')->pluck('user_id')->toArray();
        if (count($users_id) > 1) {
            $user = User::find('1');
            $text = $request->msg;
            if (auth()->id() != $user->id)
                $text = 'Администратор: ' . auth()->user()->name . '<br>' . $text;
            $this->adminMsg($dialogs, $text, $users_id[0], $users_id[1], $user);
        }
        return back()->with('flash_message_success', 'Сообщения отправлено');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(DialogMessage $dialogMessage, $id)
    {

        $msg  = $dialogMessage->getAllMsgByChatId($id);

        /*
         * Get one of User ID (first user msg to right, other user msg to left)
         */
        $unique_id = $msg->where('sender_id', '!=', 1)->unique('sender_id')->pluck('sender_id')->toArray();
        $main_id = '';
        if (count($unique_id))
            $main_id = $unique_id[0];
        return view('vendor.voyager.chat.show', compact('msg', 'main_id'));
    }

    public function showByUser(Dialog $dialog, DialogMessage $dialogMessage, $first, $second)
    {
        $user_dialog_thread = $this->getDialogIdsArray($first);

        $dialog_info = $dialog->checkIfThreadExists($second, $user_dialog_thread);
        if (!empty($dialog_info)) {
            $msg = $dialogMessage->getAllMsgByChatId($dialog_info->id);

            /*
             * Get one of User ID (first user msg to right, other user msg to left)
             */
            $unique_id = $msg->where('sender_id', '!=', 1)->unique('sender_id')->pluck('sender_id')->toArray();
            $main_id = '';
            if (count($unique_id))
                $main_id = $unique_id[0];

            return view('vendor.voyager.chat.show', compact('msg', 'main_id'));
        } else return back();
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
