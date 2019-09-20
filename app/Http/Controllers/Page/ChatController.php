<?php

namespace App\Http\Controllers\Page;

use App\Models\Lot;
use App\Models\Message;
use App\User;
use Auth;
use App\Models\Dialog;
use App\Events\ChatMessage;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\DialogMessage;
use App\Models\DialogParticipant;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class ChatController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();

        $list_dialogs = [];
        $unread_msg = [];
        $ids = [];

        $dialog_from = DB::table('messages')->select('to')->where(['from' => $user->id])->groupBy('to')->get()->toArray();
        $dialog_to = DB::table('messages')->select('from')->where(['to' => $user->id])->groupBy('from')->get()->toArray();
//        dd($dialog_from);
        $arr = array_merge($dialog_from, $dialog_to);
//        dd($arr);
        foreach ($arr as $usr_id) {
            if (isset($usr_id->to)) {
                $ids[] = $usr_id->to;
            } elseif (isset($usr_id->from)) {
                $ids[] = $usr_id->from;
            }
        }

        $users = User::findMany(array_unique($ids));

        foreach ($users as $c_user) {
            $msg = DB::table('messages')->select('*')->where('to', $user->id)->where('from', $c_user->id)->where('is_read', '0')->count();
            $unread_msg[$c_user->id] = $msg;
        }

        return view('chat.index', compact('users', 'unread_msg'));
    }

    public function gameChat()
    {
        return view('chat.game-chat');
    }

    public function chatPage()
    {

        $users = User::all();
        return view('chat', ['users' => $users]);
    }

    /**
     * Get all messages
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function messages(Request $request)
    {
//        if (empty($user)) {
//            return view('errors.404');
//        }
//        $dialog_msg = [];
//        $dialogs = [];
//
//        $dialogs_participants = DialogParticipant::with('dialog')->where('user_id', $user->id)->get();
//
//        foreach ($dialogs_participants as $dialog_p) {
//            $dialog = Dialog::find($dialog_p['dialog_id']);
//            $dialogs = $dialog;
//            $dialog_msg = DialogMessage::with('user', 'dialog')->where('dialog_id', $id)->get();
//        }
//
//
//        return compact('dialogs', 'dialog_msg');

        $user = Auth::user();
        $per_page = 5;
        if ($request->input('limit') != '')
            $limit_r = $request->input('limit');
        else
            $limit_r = 1000;
        $thread = [];
        $chat = [];

        $buddy = $request->input('user');
        $limit = isset($limit_r) ? $limit_r : $per_page;


        $read_msg = Message::where([
            'from' => intval($buddy),
            'to' => $user->id,
        ])->where(['is_read' => 0]);
        $read_msg->update(['is_read' => 1]);

        $messages = Message::where([
            'from' => $user->id,
            'to' => intval($buddy)
        ])->orWhere([
            ['from', '=', intval($buddy)],
            ['to', '=', $user->id]
        ])
            ->limit($limit)
            ->orderBy('created_at', 'ASC')
            ->with('fromUsers', 'toUsers')
            ->get();

        $total = Message::where([
            'from' => $user->id,
            'to' => intval($buddy),
        ])->orWhere([
            ['from', '=', intval($buddy)],
            ['to', '=', $user->id]
        ])->count();

        $chatbuddy = User::find($buddy);

        $contact = [
            'name' => ucwords($chatbuddy->name),
            'status' => $chatbuddy->is_online,
            'id' => $chatbuddy->id,
            'limit' => $limit + $per_page,
            'more' => $total <= $limit ? false : true,
            'scroll' => $limit > $per_page ? false : true,
            'remaining' => $total - $limit
        ];


        foreach ($messages as $message) {
//            $owner = User::find($message['from']);
            $chat = [
                'msg' => $message['id'],
                'sender' => $message['from'],
                'recipient' => $message['to'],
                'status' => $message->fromUsers->is_online,
                'avatar' => $message->fromUsers->avatar != '' ? $message->fromUsers->avatar : 'no-image.jpg',
                'body' => $message['message'],
                'time' => date("j/m/Y, H:i:s", strtotime($message['time'])),
                'type' => $message['from'] == $user->id ? 'out' : 'in',
                'name' => $message['from'] == $user->id ? 'You' : ucwords($message->fromUsers->name),
            ];
            array_push($thread, $chat);
        }


        $response = [
            'success' => true,
            'errors' => '',
            'message' => '',
            'buddy' => $contact,
            'thread' => $thread
        ];

        return response()->json($response);
    }

    public function save_message(Request $request)
    {
        $logged_user = Auth::user();
        $buddy = $request->input('user');
        $message = $request->input('message');


        if ($logged_user->id == intval($buddy))
            return response()->json(array(
                'success' => false,
                'message' => 'Вы не можете писать сообщение себе'
            ), 422);

        if ($message != '' && $buddy != '') {
            $new_msg = new Message();
            $new_msg->from = $logged_user->id;
            $new_msg->to = intval($buddy);
            $new_msg->message = $message;
            $new_msg->time = Carbon::now();


            $new_msg->save();

            $owner = User::find($new_msg->from);
            $chat = array(
                'msg' => $new_msg->id,
                'sender' => $new_msg->from,
                'recipient' => $new_msg->to,
                'avatar' => $owner->avatar != '' ? $owner->avatar : 'no-image.jpg',
                'body' => $new_msg->message,
                'time' => date('j/m/Y, H:i:s', strtotime($new_msg->time)),
                'type' => $new_msg->from == $logged_user->id ? 'out' : 'in',
                'name' => $new_msg->from == $logged_user->id ? 'You' : ucwords($owner->name)
            );

            $response = array(
                'success' => true,
                'message' => $chat,
            );
        } else {
            $response = array(
                'success' => false,
                'message' => 'Empty fields exists'
            );
        }

        return response()->json($response);
    }


    public function updates()
    {
        $new_exists = false;
        $user_id = Auth::user()->id;
        $last_seen = Message::where(['to' => $user_id, 'is_read' => 0])->orderBy('id', 'DESC')->first();
        $thread = [];
        $senders = [];
        $groups = [];

        if ($last_seen) {
            $new_exists = true;
        }
//        var_dump($last_seen);die();
        if ($new_exists) {
            $messages = Message::where([
                'to' => $user_id,
                'is_read' => 0
            ])
                ->orderBy('id', 'DESC')->get();

            foreach ($messages as $message) {
                if (!isset($senders[$message->from])) {
                    $senders[$message->from]['count'] = 1;
                } else {
                    $senders[$message->from]['count'] += 1;
                }
//                $owner = $this->user->get($message->from);
                $owner = User::find($message['from']);
                $chat = array(
                    'msg' => $message['id'],
                    'sender' => $message['from'],
                    'recipient' => $message['to'],
                    'avatar' => $owner->avatar != '' ? $owner->avatar : 'no-image.jpg',
                    'body' => $message['message'],
                    'time' => date("j/m/Y, H:i:s", strtotime($message['time'])),
                    'type' => $message['from'] == $user_id ? 'out' : 'in',
                    'name' => $message['from'] == $user_id ? 'You' : ucwords($owner->name)

                );
                array_push($thread, $chat);
            }

            foreach ($senders as $key => $sender) {
                $sender = ['user' => $key, 'count' => $sender['count']];
                array_push($groups, $sender);
                $read_msg = Message::where([
                    'to' => $user_id,
                    'from' => $sender['user']
                ])->where(['is_read' => 0]);
                $read_msg->update(['is_read' => 1]);
            }


            $response = array(
                'success' => true,
                'messages' => $thread,
                'senders' => $groups
            );

        } else {
            $response = array(
                'success' => false,
                'messages' => $thread,
                'senders' => $groups
            );
        }

        return response()->json($response);
    }


    public function ajaxMessage($id)
    {
        $user = Auth::user();
        $lot = Lot::find($id);
        $dialog_msg = [];

        $dialogs_participants = DialogParticipant::with(['dialog' => function ($dialog) use ($lot) {
            return $dialog->where(['lot_id' => $lot->id]);
        }])->where('user_id', $user->id)->get();

        foreach ($dialogs_participants as $dialog_p) {
            $dialog = Dialog::where(['id' => $dialog_p['dialog_id'], 'lot_id' => $lot->id])->first();
            $dialogs = $dialog;
            if ($dialog) {
                $dialog_msg = DialogMessage::with('user', 'dialog')->where('dialog_id', $dialog->id)->get();
            }
        }

        if (empty($user)) {
            $html = view('game.parts.lot-chat', compact('dialog_msg', 'lot'))->render();

            return response()->json(compact('html'));
        }

        $html = view('game.parts.lot-chat', compact('dialog_msg', 'lot'))->render();

        return response()->json(compact('html'));
    }

    public function countMessage()
    {
        $user = Auth::user();
        $msg = 0;
        $id = '';
        if ($user) {
            $msg = DB::table('messages')->select('*')->where('to', $user->id)->where('is_read', '0')->count();
//            dd($msg);
            $id = $user->id;

        }
        return response()->json(['count_msg' => $msg, 'user_id' => $id]);

    }
}
