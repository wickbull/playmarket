<?php

namespace App\Events;

use App\User;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;


class NewEventCount implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;


    public $user;
    public $event;


    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(User $user, $event)
    {
        $this->user = $user;
        $this->event = $event;
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
        return ['event' => $this->event];
    }
}
