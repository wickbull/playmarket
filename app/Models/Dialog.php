<?php

namespace App\Models;

use App\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\ModelNotFoundException;

/**
 * Class Dialog
 * @package App\Models
 */
class Dialog extends Model
{

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function dialogParticipants()
    {
        return $this->hasMany(DialogParticipant::class, 'dialog_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function messages()
    {
        return $this->hasMany(DialogMessage::class, 'dialog_id');
    }

    public function messagesCount()
    {
        return $this->hasMany(DialogMessage::class, 'dialog_id')->where('sender_id', '!=', auth()->id())->where('seen', '0');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function users()
    {
        return $this->belongsToMany(User::class, DialogParticipant::class, 'dialog_id', 'user_id');
    }


    public function getChatThreadWithMessage($id, $take = null, $skip = null)
    {
        return $this->where('id', $id)
            ->with(['dialogParticipants' => function ($q) use ($skip, $take) {
                $q->with('users');
            }, 'messages' => function ($q) use ($skip, $take) {
                $q->with(['lots.currency', 'lots.server', 'lots.game']);
                if ($take)
                    $q->latest()->skip($skip)->take($take);
            }])
            ->withCount('messages')
            ->first();
    }

    public function checkIfThreadExists($other_user_id, $threads)
    {
        return $this->whereIn('id', $threads)
            ->whereHas('dialogParticipants', function ($q) use ($other_user_id) {
                $q->where('user_id', $other_user_id);
            })
            ->first();
    }


    public function getLotChatThread($chat_ids, $other_user_id, $take = null, $skip = null)
    {
        return $this->whereIn('id', $chat_ids)
            ->whereHas('dialogParticipants', function ($q) use ($other_user_id) {
                $q->where('user_id', $other_user_id);
            })
            ->with(['dialogParticipants' => function ($q) use ($skip, $take) {
                $q->with('users');
            }, 'messages' => function ($q) use ($skip, $take) {
                $q->with(['lots.currency', 'lots.server', 'lots.game']);
                if ($take)
                    $q->latest()->skip($skip)->take($take);
            }])
            ->withCount('messages')
            ->first();
    }


    /**
     * @param $other_user_id
     * @param $user_id
     * @return mixed
     */
//    public function checkIfThreadExists($other_user_id, $user_id)
//    {
//        return $this->whereHas('dialogParticipants', function ($q) use ($user_id, $other_user_id) {
//            $q->whereIn('user_id', [$user_id, $other_user_id]);
//        })
//            ->pluck('id')
//            ->first();
//    }

    public function getUnreadMessagesCount()
    {
        return $this->withCount('messagesCount');
    }


    public
    function getThreadIfExists($other_user_id, $user_id)
    {
        return $this->whereHas('dialogParticipants', function ($q) use ($user_id, $other_user_id) {
            $q->where('user_id', $user_id)->where('user_id', $other_user_id);
        })
            ->with(['dialogParticipants' => function ($q) {
                $q->with('users');
            }])
            ->get();
    }


    /**
     * @param $thread_id
     * @param $user_id
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public
    function getThreadWithMessage($thread_id, $user_id)
    {
        $thread = Dialog::whereIn('id', $thread_id)
            ->whereHas('dialogParticipants', function ($q) use ($user_id) {
                $q->where('user_id', $user_id);
            })
            ->with(['dialogParticipants' => function ($q) {
                $q->with('users');
            }, 'messages' => function ($q) {
                $q->with(['lots.currency', 'lots.server', 'lots.game']);
            }])
            ->get();
//        $thread->markAsRead($user_id);
        return $thread;
    }


    /**
     * @param $user_id
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public
    function getLatestUserChat($user_id)
    {
        return $this->whereHas('dialogParticipants', function ($q) use ($user_id) {
            $q->where('user_id', $user_id);
        })
            ->with(['dialogParticipants' => function ($q) {
                $q->with('users');
            }, 'messages.lots'])
            ->get();
    }

    /**
     *
     *
     * @param $threads_id
     * @param $user_id
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    public
    function getAllGlobalThreads($threads_id, $user_id)
    {
        return $this->whereIn('id', $threads_id)
            ->whereHas('dialogParticipants', function ($q) use ($user_id) {
                $q->where('user_id', $user_id);
            })
            ->with(['dialogParticipants' => function ($q) {
                $q->with('users');
            }])
            ->get();
    }

    /**
     *  Get Participants Ids
     *
     * @param $threads_id
     * @param $user_id
     * @return Model|null|static
     */
    public
    function getParticipantsId($threads_id, $user_id = null)
    {
        return $this->where('id', $threads_id)
            ->whereHas('dialogParticipants', function ($q) use ($user_id) {
                if (isset($user_id))
                    $q->where('user_id', $user_id);
            })
            ->with('dialogParticipants')
            ->first();
    }

    /**
     * Check user exitst
     *
     * @param $user_id
     * @return bool
     */
    public
    function hasUser($user_id)
    {
        if ($user_id == 1)
            return false;
        return $this->whereHas('dialogParticipants', function ($q) use ($user_id) {
            $q->where('user_id', $user_id);
        })->exists();
    }


    /**
     * Finds the participant record from a user id.
     *
     * @param $userId
     *
     * @return mixed
     *
     * @throws ModelNotFoundException
     */
    public
    function getParticipantFromUser($userId)
    {
        return $this->dialogParticipants()->where('user_id', $userId)->firstOrFail();
    }


    /**
     * Mark a thread as read for a user.
     *
     * @param int $userId
     */
    public
    function markAsRead($userId)
    {
        try {
            $participant = $this->getParticipantFromUser($userId);
            $participant->last_read = new Carbon();
            $participant->save();
        } catch (ModelNotFoundException $e) { // @codeCoverageIgnore
            // do nothing
        }
    }


    /**
     * Returns array of unread messages in thread for given user.
     *
     * @param $userId
     *
     * @return \Illuminate\Support\Collection
     */
    public
    function userUnreadMessages($userId)
    {
        $messages = $this->messages()->get();
        try {
            $participant = $this->getParticipantFromUser($userId);
        } catch (ModelNotFoundException $e) {
            return collect();
        }
        if (!$participant->last_read) {
            return $messages;
        }
        return $messages->filter(function ($message) use ($participant) {
            return $message->updated_at->gt($participant->last_read);
        });
    }

    /**
     * Returns count of unread messages in thread for given user.
     *
     * @param $userId
     *
     * @return int
     */
    public
    function userUnreadMessagesCount($userId)
    {
        return $this->userUnreadMessages($userId)->count();
    }


    public function getAllChatAdmin()
    {
        return $this->with(['dialogParticipants' => function ($q) {
            $q->where('user_id', '!=', '1')
                ->with('users');
        }])
            ->withCount('messages')
            ->paginate('30');
    }

}
