<?php

namespace App;

use App\Models\BlockIp;
use App\Models\Dialog;
use App\Models\DialogMessage;
use App\Models\DialogParticipant;
use App\Models\Lot;
use App\Models\Review;
use App\Models\Trade;
use App\Models\UserWallet;
use App\Notifications\PasswordReset;
use Cache;
use Carbon\Carbon;
use HighIdeas\UsersOnline\Traits\UsersOnlineTrait as OnlineTrait;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable, OnlineTrait, SoftDeletes;

    protected $table = 'users';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'ip', 'provider', 'provider_id', 'avatar', 'status', 'confirmation_code', 'confirmed', 'create_lot', 'buy_lot', 'get_money', 'phone', 'is_online', 'confirmed_rules', 'rating', 'ip'
    ];


    protected $guarded = [
        'password'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'role_id', 'provider', 'provider_id', 'ip', 'is_block', 'is_block_payment'
    ];

    protected $appends = array('is_online');

    public function isAdmin()
    {
        return $this->role_id == '1';
    }

    /**
     * Send the password reset notification.
     *
     * @param  string $token
     * @return void
     */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new PasswordReset($token));
    }

    public function blockIp()
    {
        return $this->belongsTo(BlockIp::class, 'user_id')->where('to', '>=', Carbon::now());
    }


    public function lots()
    {
        return $this->hasMany(Lot::class, 'owner_id');
    }

    public function messages()
    {
        return $this->hasMany(DialogMessage::class, 'user_id');
    }

    public function participants()
    {
        return $this->hasMany(DialogParticipant::class, 'user_id');
    }

    public function getIsOnlineAttribute()
    {
        return $this->isOnline();
    }

    public function dialogs()
    {
        return $this->hasManyThrough(Dialog::class, DialogParticipant::class);
    }


    public function dialogMessage()
    {
        return $this->hasMany(DialogMessage::class, 'sender_id');
    }

    public function currentTrades()
    {
        return $this->hasMany(Trade::class, 'owner_id');
    }

    public function buyTrades()
    {
        return $this->hasMany(Trade::class, 'buyer_id');
    }

    public function newBuyTrades()
    {
        return $this->hasMany(Trade::class, 'buyer_id')->where('status', '1')->where('is_payed', '1');
    }

    public function newSaleTrades()
    {
        return $this->hasMany(Trade::class, 'owner_id')->where('status', '1')->where('is_payed', '1');
    }

    public function reviews()
    {
        return $this->hasMany(Review::class, 'seller_id');
    }

    public function wallets()
    {
        return $this->hasMany(UserWallet::class,'user_id','id');
    }



    /*
     * GEt
     */
    public function newMessageThread()
    {
        return $this->userNewMessage()->with(['participants' => function ($q) {
            $q->whereNull('last_read')
                ->orWhereRaw('last_read != updated_at')
                ->select('dialog_id', 'user_id');
        }])->first();
    }

    public function getAllUserTread($id)
    {
        return $this->where('id', $id)
            ->with(['participants' => function ($q) {
                $q->whereNull('last_read')->orWhereRaw('last_read != updated_at')->select('id', 'user_id');
            }])
            ->get();
    }


    public function getAllUserByDialogId($dialog_ids, $user_id)
    {
        return $this->whereHas('participants', function ($q) use ($dialog_ids, $user_id) {
            $q->whereIn('dialog_id', $dialog_ids)
                ->where('user_id', '!=', $user_id)
                ->where('user_id', '!=', 1);
        })
            ->with(['participants' => function ($q) use ($dialog_ids, $user_id) {
                $q->whereIn('dialog_id', $dialog_ids)
                    ->where('user_id', '!=', $user_id);
            }])
            ->get();
    }

    public function getNewChatUser($dialog_id)
    {
        return $this->whereHas('participants', function ($q) use ($dialog_id) {
            $q->where('dialog_id', $dialog_id)
                ->where('user_id', '!=', auth()->id())
                ->where('user_id', '!=', 1);
        })
            ->with(['participants' => function ($q) use ($dialog_id) {
                $q->where('dialog_id', $dialog_id)
                    ->where('user_id', '!=', auth()->id());
            }])
            ->first();
    }

    public function getThreadWithMessageByLotId($user_id)
    {
        $participants = $this->where('id', $user_id)
            ->whereHas('participants.dialogs')
            ->with('participants')
            ->first();
        return $participants;
    }


    /*
     * BadIdea Message count (Need fix)
     */
    public function newMessageCountLoad()
    {
        $all_participants = $this->participants()->with(['dialogs' => function ($q) {
            $q->withCount('messagesCount')->with(['dialogParticipants' => function ($q) {
                $q->where('user_id', '!=', auth()->id());
            }]);
        }])->get();
        $new_message = [];
        if (count($all_participants))
            foreach ($all_participants as $item) {
                $new_message[] = [
                    'thread_id' => $item->dialog_id,
                    'msg_count' => $item->dialogs->messages_count_count,
                    'user_id' => $item->dialogs->dialogParticipants->first()->user_id
                ];
            }

        return $new_message;
    }

    public function newMsgSum()
    {
        $sum = 0;
        $new_msg = $this->newMessageCountLoad();
        foreach ($new_msg as $item) {
            $sum += $item['msg_count'];
            // dd($sum);
        }
        $event_count = [
            'msg_count' => $sum,
            'purchases_count' => $this->newBuyTrades()->count(),
            'sales_count' => $this->newSaleTrades()->count()
        ];
        return json_encode($event_count);
    }


    public function scopeOnlineUser($q, $user, $is_online)
    {
        if ($is_online)
            $q->whereIn('id', $user);
    }

}
