<?php

namespace App\Events;

use App\Models\Dialog;
use App\User;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;


class ChatMessageCount implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;


    public $user;
    public $count;


    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(User $user, $count)
    {
        $this->user = $user;
        $this->count = $count;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('App.User.' . $this->user->id);
    }

    public function broadcastWith()
    {
        return ['msg_count' => $this->count];
    }
}
