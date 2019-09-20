<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Invoice;
use App\Models\Lot;
use App\Models\PriceCommission;
use App\Models\Review;
use App\Models\SmsCode;
use App\Models\Trade;
use App\Models\UserWallet;
use App\User;
use Auth;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;

class ProfileController extends Controller
{

    /**
     * User profile page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $user = User::where('id', auth()->id())->with(['wallets', 'reviews.trade.lot.game', 'lots' => function ($q) {
            $q->orderBy('active', 'DESC');
        }])->first();
        if (empty($user)) {
            return view('errors.404');
        }
        $games = Lot::with('game')->where('owner_id', $user->id)->distinct()->get(['game_id'])->toArray();
        $currencies = Lot::with('currency')->where([['owner_id', $user->id], ['currency_id', '!=', null]])->distinct()->get(['currency_id'])->toArray();
        $servers = Lot::with('server')->where([['owner_id', $user->id], ['server_id', '!=', null]])->distinct()->get(['server_id'])->toArray();
        $tags = Lot::with('tag')->where([['owner_id', $user->id], ['tag_id', '!=', null]])->distinct()->get(['tag_id'])->toArray();

        $invoices = Invoice::where('user_id', $user->id)
            ->where(function ($q) {
                $q->whereNotIn('status', ['0', '3', '-1'])
                    ->orWhere('type', 'out');
            })
            ->latest()
            ->get();

        $commissions = PriceCommission::where('is_active', '1')
            ->get();

        $wallets = $user->wallets;



        return view('profile.index', compact('user', 'games', 'currencies', 'servers', 'tags', 'wallets', 'invoices', 'commissions'));
    }


    public function wallet(Request $request)
    {
        $user = auth()->user();
        $i = 0;
        $user->wallets()->delete();
        foreach ($request->currency_id as $currency) {
            if ($currency != ''  && $request->wallet_id[$i] != '')
                UserWallet::create([
                    'currency_id' => $currency,
                    'wallet_id' => $request->wallet_id[$i],
                    'user_id' => $user->id
                ]);
            $i++;
        }
        return redirect('/profile#tab-cabinet_balance');
    }


    public function getUserWallet()
    {
        $commissions = PriceCommission::where('is_active', '1')
            ->get();
        $user = User::where('id', auth()->id())->with('wallets')->first();

        return response()->json(view('modals._parts.money-modal-form', compact('commissions', 'user'))->render());

    }



    /**
     * View user page
     *
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function view($id)
    {
        $user = User::with([
            'reviews' => function ($q) {
                $q->orderBy('created_at', 'DESC')->with('trade.lot.game');
            },
            'lots' => function ($lots) {
            return $lots->where('active', '1')->orderByGameTag();
        }])->where('id', $id)->first();
        if (empty($user)) {
            return view('errors.404');
        }
        $games = Lot::with('game')->where('owner_id', $user->id)->where('active', '1')->distinct()->get(['game_id'])->toArray();
        $currencies = Lot::with('currency')->where([['owner_id', $user->id], ['currency_id', '!=', null]])->where('active', '1')->distinct()->get(['currency_id'])->toArray();
        $servers = Lot::with('server')->where([['owner_id', $user->id], ['server_id', '!=', null]])->where('active', '1')->distinct()->get(['server_id'])->toArray();
        $tags = Lot::with('tag')->where([['owner_id', $user->id], ['tag_id', '!=', null]])->where('active', '1')->distinct()->get(['tag_id'])->toArray();
        $review_access = [];

        $commissions = PriceCommission::where('is_active', '1')->get();

        if (auth()->check())
            $review_access = Trade::where([
                'owner_id' => $id,
                'buyer_id' => auth()->id(),
                'status' => 0,
                'is_payed' => 1,
            ])
                ->with('review')
                ->get();

        return view('profile.view', compact('user', 'games', 'currencies', 'servers', 'tags', 'review_access', 'commissions'));
    }


    public function feedback(Request $request, $id)
    {
        $validate = Validator::make($request->all(), [
            'text' => 'nullable|string|max:255',
            'mark' => 'nullable|boolean',
            'trade_id' => 'required_without:lot_id|exists:trades,id',
            'lot_id' => 'required_without:trade_id|exists:lots,id'

        ]);

        if ($validate->fails())
            return response()->make($validate->errors()->first(), 400);

        $review_access = Trade::where([
            'owner_id' => $id,
            'buyer_id' => auth()->id(),
            'status' => 0,
            'is_payed' => 1,
        ])
            ->with('review')
            ->get();


        if (count($review_access) && $review_access->where('review', null)) {
            if ($request->has('lot_id')) {
                $trade = $review_access->where('review', null)->first();
                if (!empty($trade))
                    $trade_id = $trade->id;
                else
                    return response()->json(['false' => true, 'msg' => lang(session('langId'), 'form_message', 'you_dh__access_to_send_review', 43200)]);
            } else {
                $trade_id = $request->trade_id;

            }


            $owner = User::find($id);
            if ($request->mark == 0)
                $owner->rating = $owner->rating - 1;
            else
                $owner->rating++;
            $owner->save();
            $item = Review::create([
                'text' => $request->text,
                'mark' => $request->mark,
                'user_id' => auth()->id(),
                'seller_id' => $id,
                'trade_id' => $trade_id,
            ]);

            if ($request->has('lot_id')) {
                $review = new Review();
                $reviews = $review->getFeedbackById($item->id);
                return response()->json([
                    'success' => true,
                    'review' => $reviews,
                ]);
            } else
                return response()->json([
                    'success' => true,
                    'view' => view('profile.parts.feedback-list', compact('item'))->render(),
                    'rating' => $owner->rating
                ]);
        }
        return response()->json(['false' => true], 403);
    }

    public function getFeedback(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'lot_id' => 'required|numeric|exists:lots,id',
        ]);

        if ($validate->fails())
            return response()->make($validate->errors()->first(), 400);

        $lot = Lot::find($request->lot_id);
        $can_send_feedback = null;

        if (auth()->check()) {
            $review_access = Trade::where([
                'owner_id' => $lot->owner_id,
                'buyer_id' => auth()->id(),
                'status' => 0,
                'is_payed' => 1,
            ])
                ->with('review')
                ->get();
            if (count($review_access) && $review_access->where('review', null)->first()) {
                $can_send_feedback = true;
            }
        }
        if (!empty($lot)) {
            $review = new Review();
            $reviews = $review->getFeedbackByUserId($lot->owner_id);
        }
        return response()->json(['review' => $reviews, 'send_feedback_access' => $can_send_feedback]);
    }

    /**
     * Update user avatar
     *
     * @param $id
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function update($id, Request $request)
    {

        $user = Auth::user();
        $img_path = 'users_avatars/' . $user->id . '/';
        $file = $request->file('avatar');

        if (!empty($file)) {
            $avatar_name = time() . '-' . $file->getClientOriginalName();

            Image::make($file)->save(public_path('/users_avatars/' . $avatar_name));
            $user->avatar = '/users_avatars/' . $avatar_name;
            $user->save();
            Session::flash('flash_message_success', lang(session('langId'), 'form_message', 'avatar_updated', 43200));
            return redirect('/profile');
        }
        return redirect('/profile');

    }

    /**
     * Update user phone
     *
     * @param Request $request
     * @return $this
     */
    public function updatePhone(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data, [
            'phone' => 'required|unique:users',
            'code' => 'required',
            'password' => 'required|string|min:6',
        ]);
        if ($validator->fails()) {
            Session::flash('flash_message_error', lang(session('langId'), 'form_message', 'check_your_data', 43200));
            return redirect('/profile')
                ->withErrors($validator)
                ->withInput();
        }
        $code = $data['code'];
        $phone = preg_replace("/[^0-9]/", "", $request->input('phone'));

        $check_sms = SmsCode::where(['code' => $code, 'phone' => $phone])->first();

        if ($check_sms) {
            User::find(auth()->id())->update(['phone' => $phone]);
            $codeModel = new SmsCode();
            $all_sms = $codeModel->getLatestPhoneSms($phone);
            foreach ($all_sms as $item)
                $item->delete();
            $text = lang(session('langId'), 'form_message', 'msisdn_is_added', 43200);
            if (strlen(auth()->user()->phone) < 5) {
                $text .= lang(session('langId'), 'form_message', 'add_and_confirm_msisdn', 43200) . '<a href="/profile#tab-cabinet_personal_data">'.lang(session('langId'), 'form_message', 'link', 43200).'</a>';
                session()->flash('phone_need', true);
            }
            session()->flash('flash_message_success', $text);
        } else {
            session()->flash('flash_message_error', lang(session('langId'), 'form_message', 'wrong_sms', 43200));
            return redirect('/profile#tab-cabinet_personal_data')
                ->withErrors($validator)
                ->withInput();
        }

        $text = null;
        if (auth()->user()->email == '') $text .= lang(session('langId'), 'form_message', 'add_mail_in_settings', 43200);

        if (auth()->user()->confirmed == '0') $text .= lang(session('langId'), 'form_message', 'confirm_mail_in_settings', 43200);

        if (!empty($text)) {
            session()->flash('flash_message_rules', $text);
            return redirect()->route('my-profile') . '#tab-cabinet_personal_data';
        }


        return redirect('/profile#tab-cabinet_personal_data');

    }

    public function smsCode(SmsCode $codeModel, Request $request)
    {

        $phone = preg_replace("/[^0-9]/", "", $request->input('phone'));

        $all_sms = $codeModel->getLatestPhoneSms($phone);

        $now = Carbon::now();

        switch ($all_sms->count()) {
            case 0:
                $url = $this->sendSms($phone);
                break;
            case 1:
                if ($all_sms->first()->created_at > $now->addMinutes('5'))
                    $url = $this->sendSms($phone);
                else {
                    return response()->json(['error' => lang(session('langId'), 'form_message', 'sms_sended_1', 43200) . $phone . lang(session('langId'), 'form_message', 'sms_sended_2', 43200)
                        . $all_sms->first()->created_at->diff($now->addMinutes('5'))->format('%i ' . lang(session('langId'), 'form_message', 'minutes', 43200) . ' %s ' . lang(session('langId'), 'form_message', 'seconds', 43200))], '403');
                }

                break;
            case 2:
                if ($all_sms->first()->created_at > $now->addDays(3))
                    $url = $this->sendSms($phone);
                else {
                    return response()->json(['error' => lang(session('langId'), 'form_message', 'sms_sended', 43200) . $phone . lang(session('langId'), 'form_message', 'sms_sended_2', 43200)
                        . $all_sms->first()->created_at->diff($now->addDays(3))->format('%d ' . lang(session('langId'), 'form_message', 'days', 43200) . ' %H ' . lang(session('langId'), 'form_message', 'hours', 43200) . ' %i ' . lang(session('langId'), 'form_message', 'minutes', 43200) . ' %s ' . lang(session('langId'), 'form_message', 'seconds', 43200))], '403');
                }

                break;

            default:
                return response()->json(['error' => lang(session('langId'), 'form_message', 'sms_sended', 43200) . $phone . lang(session('langId'), 'form_message', 'sms_sended_2', 43200)
                    . $all_sms->first()->created_at->diff($now->addDays(3))->format('%d ' . lang(session('langId'), 'form_message', 'days', 43200) . ' %H ' . lang(session('langId'), 'form_message', 'hours', 43200) . ' %i ' . lang(session('langId'), 'form_message', 'minutes', 43200) . ' %s ' . lang(session('langId'), 'form_message', 'seconds', 43200))], '403');
                break;
        }


        return $url;
    }


    protected function sendSms($phone)
    {

        $code = rand(1000, 9999);

        $sms_code = new SmsCode();
        $sms_code->code = $code;


        $login = config('services.smscru.login');
        $pass = config('services.smscru.secret');

//        $url1 ="https://smsc.ru/sys/send.php?login=bigdrop&psw=9343eeea42e0f814db5118762161fbce&phones=380638315477&mes=123";

        $url = '';

        $sms_code->phone = $phone;
        if ($sms_code->save()) {
            $url = "https://smsc.ru/sys/send.php?login=" . $login . "&psw=" . $pass .
                "&phones=" . $phone . "&mes=" . $code;
        }

        return $url;
    }

    /**
     * Update user email
     *
     * @param Request $request
     * @return $this
     */
    public function updateEmail(Request $request)
    {
        $data = $request->all();
        if (Hash::check($data['password'], Auth::user()->password)) {
            $validator = Validator::make($data, [
                'email' => 'required|unique:users',
            ]);
            if ($validator->fails()) {
                Session::flash('flash_message_error', lang(session('langId'), 'form_message', 'check_your_input_data', 43200));
                return redirect('/profile')
                    ->withErrors($validator)
                    ->withInput();
            }

            $user = auth()->user();

            $user->update([
                'email' => $data['email'],
                'confirmed' => '0'
            ]);

            $confirmation_code = str_random(30);

            $user->update([
                'confirmation_code' => $confirmation_code
            ]);


            Mail::send('email.verify', ['data' => $confirmation_code], function ($message) use ($user) {
                $message->to($user->email, $user->name)
                    ->subject(lang(session('langId'), 'form_message', 'confirming_mail', 43200));
            });


            Session::flash('flash_message_success', lang(session('langId'), 'form_message', 'mail_updated_and_we_send_letter_1', 43200) . $user->email . lang(session('langId'), 'form_message', 'mail_updated_and_we_send_letter_1', 43200));
            return redirect('/profile');
        }
    }


    public function confirmEmail(Request $request)
    {
        $data = $request->all();
        if (Hash::check($data['password'], auth()->user()->password)) {
            $confirmation_code = str_random(30);

            $user = User::find(auth()->id());

            if ($user->confirmed == '1')
                return back()->with('flash_message_error', lang(session('langId'), 'form_message', 'mail_was_confirmed', 43200));

            $user->update([
                'confirmation_code' => $confirmation_code
            ]);

            Mail::send('email.verify', ['data' => $confirmation_code], function ($message) use ($user) {
                $message->to($user->email, $user->name)
                    ->subject('Подтверждение email');
            });


            Session::flash('flash_message_success', lang(session('langId'), 'form_message', 'send_to_mail_confirm_letter_1', 43200) . $user->email . lang(session('langId'), 'form_message', 'send_to_mail_confirm_letter_2', 43200));
            return redirect('/profile');
        }
    }


    /**
     * Update user password
     *
     * @param Request $request
     * @return $this
     */
    public function updatePassword(Request $request)
    {
        $data = $request->all();

        if (!empty(Auth::user()->provider)) {

        }

        if (Hash::check($data['password'], Auth::user()->password)) {
            $validator = Validator::make($data, [
                'change-password' => 'required|min:6',
                'confirmed' => 'required|same:change-password'
            ]);
            if ($validator->fails()) {
                Session::flash('flash_message_error', lang(session('langId'), 'form_message', 'check_your_input_data', 43200));
                return redirect('/profile')
                    ->withErrors($validator)
                    ->withInput();
            }

            User::find(Auth::user()->id)->update(['password' => sha1($data['change-password'])]);
            Session::flash('flash_message_success', lang(session('langId'), 'form_message', 'password_updated', 43200));
            return redirect('/profile');
        }
        Session::flash('flash_message_error', lang(session('langId'), 'form_message', 'check_your_old_password', 43200));
        return redirect('/profile');
    }

    /**
     * Confirm rules by user
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function confirmRules()
    {
        $id = Auth::user()->id;

        $user = User::find($id);
        if (!empty($user)) {
            $user->confirmed_rules = 1;
            if ($user->save()) {
                session()->flash('flash_message_success', lang(session('langId'), 'form_message', 'rules_accepted', 43200));


                $text = null;
                if (auth()->user()->email == '') $text .= lang(session('langId'), 'form_message', 'add_mail_in_settings', 43200);
                if (auth()->user()->confirmed == '0') $text .= lang(session('langId'), 'form_message', 'confirm_mail_in_settings', 43200);
                if (strlen(auth()->user()->phone) < 5) {
                    $text .= lang(session('langId'), 'form_message', 'add_and_confirm_msisdn', 43200) . '<a href="/profile#tab-cabinet_personal_data">'.lang(session('langId'), 'form_message', 'link', 43200).'</a>.';
                    session()->flash('phone_need', true);
                }

                if (!empty($text)) {
                    session()->flash('flash_message_rules', $text);
                    return redirect()->route('my-profile') . '#tab-cabinet_personal_data';
                }

                return redirect('/profile');
            }
            Session::flash('flash_message_error', 'Error');
            return redirect('/profile');
        }
    }

    /**
     * Generate new user password when click btn in user profile
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function resetPass()
    {
        $user = Auth::user();
        $password = str_random(10);
        $user->password = $password;

        if ($user->save()) {
            Mail::send('email.resetpass', ['data' => $password], function ($message) use ($user) {
                $message->to($user->email, $user->name)
                    ->subject('Password generation');
            });
            User::find(Auth::user()->id)->update(['password' => bcrypt($password)]);
            return response()->json([
                'message' => lang(session('langId'), 'form_message', 'password_sended_to_mail', 43200)
            ]);

        }
        return response()->json([
            'message' => lang(session('langId'), 'form_message', 'nonono', 43200)]);
    }

    public function updateStatus()
    {
        return response()->json();
    }

    public function getUserReview(Review $review, Request $request, $id)
    {
        if (request()->ajax()) {
            $reviews = $review->getFeedbackByUserId($id, $request->mark);
            return response()->json(view('profile.parts.feedback-list-composer', compact('reviews'))->render());
        }

    }


    public function addWallet(Request $request)
    {

    }
}

