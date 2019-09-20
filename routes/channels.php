<?php

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

use App\Models\Dialog;

Broadcast::channel('App.User.{id}', function ($user, $id) {
    return (int)$user->id === (int)$id;
});

//Broadcast::channel('chat', function ($user) {
//    return auth()->check();
//});


Broadcast::channel('chat', function ($user) {
    return auth()->check();
});


Broadcast::channel('threads.chats.{dialog}', function ($user, Dialog $dialog) {
    return $dialog->hasUser($user->id);
});