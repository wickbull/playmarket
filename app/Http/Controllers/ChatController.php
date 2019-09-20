<?php

namespace App\Http\Controllers;

use App\Events\ChatGlobalMessage;
use App\Events\NewEventCount;
use App\Models\ChatSetting;
use App\Models\Dialog;
use App\Models\DialogMessage;
use App\Models\Lot;
use App\Models\Trade;
use App\Traits\ChatTrait;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;

/**
 * Class ChatController
 * @package App\Http\Controllers
 */
class ChatController extends Controller
{
    use ChatTrait;

    /**
     *  Antispam error msg
     */
    const ANTISPAM_MSG = 'Антиспам защита, вы исчерпали лимит сообщений на день. Лимит: ';

    /**
     *  Dialog msg per page
     */
    const PER_PAGE = 15;

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendMessage(Request $request)
    {

        $data = $request->all();
        $validator = Validator::make($data, [
            'text' => 'required|max:1000|string',
        ]);

        if ($validator->fails()) return response()->json($validator->errors()->first(), 400);


        $response = [];
        $user = auth()->user();
        $dialog_id = null;
        $new_dialog = null;


        $chatSetting = new ChatSetting();
        // Get Admin Msg per day value
        $msg_per_day = $chatSetting->getByKeyWord('msg_per_day');

        $messages = new DialogMessage();
        //Get current user msg count
        $current_user_msg_count = $messages->getMsgPerDaysCount($dialog_id, $user->id, date('d'));

        if (isset($msg_per_day) && $msg_per_day->value <= $current_user_msg_count) return response()->json(['msg' => ' ' . $msg_per_day->value], 403);

        if (!empty($request->text) && !empty($user)) {
            $lot = null;

            if ($request->has('lot_id') && !empty($request->lot_id)) {
                $lot = Lot::find(intval($request->lot_id));


                if ($user->id == $lot->owner_id) return response()->json($response);

                // Get all user chat ids
                $user_dialog_thread = $this->getDialogIdsArray($user->id);

                $dialog = new Dialog();

                // Check if chat user and other user exists
                $dialog_info = $dialog->checkIfThreadExists($lot->owner_id, $user_dialog_thread);

                if (!isset($dialog_info)) {
//Create new Dialog chat with msg
                    $dialogs = Dialog::create([]);
                    $new_dialog = $dialogs->id;
                    $message = $dialogs->messages()->create([
                        'sender_id' => $user->id,
                        'lot_id' => isset($request->lot_id) ? $request->lot_id : null,
                        'seen' => 0,
                        'text' => $request->text,
                    ]);
                    $dialogs->dialogParticipants()->create([
                        'user_id' => $user->id,
                        'last_seen' => Carbon::now(),
                    ]);
                    $dialogs->dialogParticipants()->create([
                        'user_id' => $lot->owner_id,
                    ]);
                } else {
                    // Create new msg
                    $dialog_id = $dialog_info->id;
                    $dialogs = Dialog::find($dialog_id);
                    $message = $dialogs->messages()->create([
                        'sender_id' => $user->id,
                        'lot_id' => isset($request->lot_id) ? $request->lot_id : null,
                        'seen' => 0,
                        'text' => $request->text,
                    ]);
                    $dialogs->dialogParticipants()->touch();
                }
            } elseif (!empty($request->thread_id)) {
                $dialog_id = $request->thread_id;
                $dialogs = Dialog::find($dialog_id);
                $message = $dialogs->messages()->create([
                    'sender_id' => $user->id,
                    'lot_id' => isset($request->lot_id) ? $request->lot_id : null,
                    'seen' => '0',
                    'text' => $request->text,
                ]);
                $dialogs->dialogParticipants()->touch();
            } else return response()->json($response);


            $messages = [
                'id' => $message->id,
                'body' => $message->text,
                'name' => 'You',
                'game' => isset($lot) ? $lot->id : null,
                'avatar' => $user->avatar != '' ? $user->avatar : 'no-image.jpg',
                'status' => $user->is_online,
                'time' => $message->created_at->format('d.m.y H:i:s'),
            ];
            $from_messages = $messages;
            $from_messages['name'] = $user->name;

            broadcast(new ChatGlobalMessage($user, $dialogs, $from_messages))->toOthers();

            $users = $dialogs->dialogParticipants()
                ->where('user_id', '!=', $user->id)
                ->where('user_id', '!=', 1)
                ->get();

            $other_user_id = 0;

            foreach ($users as $item) {
                $other_user = $user->where('id', $item->user_id)->first();
                $event = [
                    'user_id' => intval($user->id),
                    'thread_id' => $dialogs->id,
                    'lot_id' => isset($request->lot_id) ? $request->lot_id : null,
                    'new_user_id' => $new_dialog,
                    'msg' => true,
                ];
                $other_user_id = $other_user->id;
                broadcast(new NewEventCount($other_user, $event));
            }

            $response = array(
                'success' => true,
                'message' => $messages,
                'thread_id' => $dialogs->id,
                'to_user_id' => $other_user_id,
                '$current_user_msg_count' => $current_user_msg_count,
                '$msg_per_day' => $msg_per_day

            );
        }
        return response()->json($response);
    }

    /**
     * Get All User Thread
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getGlobalThread()
    {
        $user = auth()->user();

        $new_msg = $user->newMessageCountLoad();

        $trade = new Trade();
        $activeTrade = $trade->getUserActiveTradeIds($user->id);

        $active_trade_users_ids = [];

        foreach ($activeTrade as $item) {

            if ($item['owner_id'] == $user->id)
                $active_trade_users_ids[] = [
                    'user_id' => $item['buyer_id'],
                    'owner_id' => $item['owner_id'],
                    'buyer_id' => $item['buyer_id'],
                    'lot_id' => $item['lot_id']
                ];
            else
                $active_trade_users_ids[] = [
                    'user_id' => $item['owner_id'],
                    'owner_id' => $item['owner_id'],
                    'buyer_id' => $item['buyer_id'],
                    'lot_id' => $item['lot_id']
                ];
        }

        $new_chat_event = json_encode([
            'new_msg' => $new_msg,
            'active_trade' => $active_trade_users_ids
        ]);

        $user_dialog_thread = $this->getDialogIdsArray($user->id);

        $userModel = new User();

        $users = $userModel->getAllUserByDialogId($user_dialog_thread, $user->id);


        $langId = 1;

        $lang = vue_lang('vue_chat', 43200);

        return view('chat.index', compact('users', 'new_chat_event', 'langId', 'lang'));
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getNewUserToThread(Request $request)
    {
        $user = new User();
        $users = $user->getNewChatUser($request->dialog_id);
        return response()->json(['user' => $users]);

    }


    /**
     * Get Message Thread
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getThreadMessage(Request $request)
    {
        $user = auth()->user();

        if (!$request->has('skip')) $skip = 0;
        else $skip = $request->skip;

        $dialog = new Dialog();

        if (isset($request->lot_id)) {
            $lot = Lot::find(intval($request->lot_id));
            if ($user->id == $lot->owner_id) return response()->json();

            $user_dialog_thread = $this->getDialogIdsArray($user->id);

            /*
             * Get thread owner with auth user
             */
            $dialogs = $dialog->getLotChatThread($user_dialog_thread, $lot->owner_id, self::PER_PAGE, $skip);
        }
        elseif (isset($request->thread_id)) $dialogs = $dialog->getChatThreadWithMessage($request->thread_id, self::PER_PAGE, $skip);
        else return response()->json();


        if (!empty($dialogs)) {

            $other_user_id = $dialog->getParticipantsId($dialogs->id, $user->id)->dialogParticipants->where('user_id', '!=', $user->id)->first()->user_id;


            $other_user = User::find($other_user_id);

            $dialogs->dialogParticipants()->where('user_id', auth()->id())->update([
                'last_read' => Carbon::now()
            ]);
            $dialogs->messages()->where('sender_id', '!=', auth()->id())->update([
                'seen' => '1'
            ]);

            $admin = User::find('1');


            foreach ($dialogs->messages as $message) {
                $system = false;
                if ($message->sender_id != $user->id) {
                    if ($message->sender_id == 1) {
                        $name = $admin->name;
                        $avatar = $admin->avatar != '' ? $admin->avatar : 'images/useful/svg/default-avatar.svg';
                        $status = true;
                        $system = true;

                    } else {
                        $name = $other_user->name;
                        $avatar = $other_user->avatar != '' ? $other_user->avatar : 'images/useful/svg/default-avatar.svg';
                        $status = $other_user->is_online;
                    }
                } else {
                    $name = 'You';
                    $avatar = $user->avatar != '' ? $user->avatar : 'images/useful/svg/default-avatar.svg';
                    $status = $user->is_online;
                }
                $messages[] = [
                    'id' => $message->id,
                    'lot_id' => intval($request->lot_id),
                    'body' => $message->text,
                    'name' => $name,
                    'avatar' => $avatar,
                    'status' => $status,
                    'is_system' => $system,
                    'time' => $message->created_at->format('d.m.y H:i:s'),
                ];
            }

            $response = [
                'messages' => $messages,
                'user' => $other_user,
                'thread_id' => $dialogs->id,
                'messages_count' => $dialogs->messages_count,
                'current_msg_index' => $skip + self::PER_PAGE,
                'per_page' => self::PER_PAGE

            ];

            return response()->json($response);
        }
        return response()->json();
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function markAsRead(Request $request)
    {
        $dialogs = Dialog::find($request->data['thread_id']);
        $dialogs->messages()->where('sender_id', $request->data['user_id'])->update(['seen' => '1']);
        return response()->json();
    }
}
