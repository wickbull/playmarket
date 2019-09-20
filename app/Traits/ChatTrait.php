<?php

namespace App\Traits;


use App\Events\ChatGlobalMessage;
use App\Events\NewEventCount;
use App\Models\Dialog;
use App\Models\Trade;
use App\User;

trait ChatTrait
{
    public function tradeNotification(Trade $trade, $text)
    {
        /*
        * Get buyer dialog id's (stupid idea) (Can reword, in total we need to get chat (lot owner with lot buyer)
        */
        $user_dialog_thread = $this->getDialogIdsArray($trade->buyer_id);
        /*
        * Get thread owner with buyer user
        */

        $dialog = new Dialog();
        $chat = $dialog->getLotChatThread($user_dialog_thread, $trade->owner_id);

        // Admin User
        $user = User::find(1);


        $data = $this->adminMsg($chat, $text, $trade->buyer_id, $trade->owner_id, $user, $trade->lot_id);

        $dialogs = $data['dialogs'];

        $users = $dialogs->dialogParticipants()
            ->where('user_id', '!=', $user->id)
            ->get();


        foreach ($users as $item) {
            $other_user = $user->where('id', $item->user_id)->first();
            if ($other_user->id != $trade->buyer_id) $user_id = $trade->buyer_id;
            else $user_id = $trade->owner_id;
            $event = [
                'user_id' => intval($user_id),
                'thread_id' => intval($dialogs->id),
                'new_thread' => empty($chat) ? true : false,
                'owner_id' => intval($trade->owner_id),
                'buyer_id' => intval($trade->buyer_id),
                'msg' => true,
                'lot_id' => intval($trade->lot_id),
                'is_system' => true,
                'trade_status' => intval($trade->status)
            ];
            broadcast(new NewEventCount($other_user, $event));
        }

        return $data['message'];

    }

    public function adminMsg($chat, $text, $first_user_id, $second_user_id, $user, $lot_id = null)
    {
        if (empty($chat)) {
            $dialogs = Dialog::create([]);
            $message = $dialogs->messages()->create([
                'sender_id' => 1,
                'lot_id' => $lot_id,
                'seen' => 0,
                'text' => $text,
            ]);
            $dialogs->dialogParticipants()->create([
                'user_id' => $first_user_id,
            ]);
            $dialogs->dialogParticipants()->create([
                'user_id' => $second_user_id,
            ]);
            $dialogs->dialogParticipants()->create([
                'user_id' => 1,
            ]);

        } else {
            $dialog_id = $chat->id;
            $dialogs = Dialog::find($dialog_id);
            $message = $dialogs->messages()->create([
                'sender_id' => 1,
                'lot_id' => $lot_id,
                'seen' => 0,
                'text' => $text,
            ]);

            foreach ($dialogs->dialogParticipants as $participant) $participant->touch();
        }


        $messages = [
            'id' => $message->id,
            'is_system' => true,
            'body' => $message->text,
            'name' => $user->name,
            'game' => isset($lot) ? $lot->id : null,
            'avatar' => $user->avatar != '' ? $user->avatar : 'no-image.jpg',
            'status' => 1,
            'time' => $message->created_at->format('d.m.y H:i:s'),
        ];
        $from_messages = $messages;
        $from_messages['name'] = $user->name;

        broadcast(new ChatGlobalMessage($user, $dialogs, $from_messages))->toOthers();

        $first_user = User::find($first_user_id);
        $second_user = User::find($second_user_id);

        $event = [
            'user_id' => intval($second_user_id),
            'thread_id' => $dialogs->id,
            'lot_id' => null,
            'msg' => true,
        ];
        broadcast(new NewEventCount($first_user, $event));

        $event = [
            'user_id' => intval($first_user_id),
            'thread_id' => $dialogs->id,
            'lot_id' => null,
            'msg' => true,
        ];
        broadcast(new NewEventCount($second_user, $event));

        return [
            'dialogs' => $dialogs,
            'message' => $messages
        ];

    }


    public function getDialogIdsArray($id)
    {
        /*
         * Get all user participants (need get dialog_id)
         */

        $users = new User();

        $participants = $users->getThreadWithMessageByLotId($id);

        /*
         * Create array off chat ids
         */
        $user_dialog_thread = [];
        if ($participants != '') foreach ($participants->participants as $item) $user_dialog_thread[] = $item->dialog_id;
        return $user_dialog_thread;
    }
}