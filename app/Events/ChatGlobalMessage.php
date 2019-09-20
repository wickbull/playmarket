<?php

namespace App\Events;

use App\Models\Dialog;
use App\User;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;


class ChatGlobalMessage implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;


    public $user;
    public $dialog;
    public $message;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(User $user, Dialog $dialog, $message)
    {
        //
        $this->user = $user;
        $this->dialog = $dialog;
        $this->message = $message;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('threads.chats.' . $this->dialog->id);
    }

    public function broadcastWith()
    {
        return [
            'message' => $this->message,
            'user_id' => $this->user->id,
            'thread_id' => $this->dialog->id,
//            'user_ids' => $this->dialog->dialogParticipants->pluck('user_id')->toArray()
        ];
    }
}
