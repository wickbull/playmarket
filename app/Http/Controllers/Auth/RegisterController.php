<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Notifications\SendRegisterEmail;
use App\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected function redirectTo()
    {
        return url()->previous();
    }
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255|unique:users',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
            'confirm' => 'required',
        ]);
    }

    public function renderCaptcha()
    {
        return captcha_img();
    }

    public function checkCaptcha(Request $request)
    {
        if ($request->has('captcha') && captcha_check($request->captcha)) {
            session()->put('captcha_success', 1);
            return response()->json(['success' => true]);
        } else return response()->json(['msg' => 'Код с картинки введен не верно, поробуйте ещё раз'], 422);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data, $ip, $confirmation_code)
    {


        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => Hash::make($data['password']),
            'avatar' => '/default-avatar.svg',
            'ip' => $ip,
            'confirmation_code' => $confirmation_code
        ]);
    }

    public function register(Request $request)
    {
        if (session()->pull('captcha_success') !== 1)
            return back()->with('flash_message_error', 'Вы не ввели код из картинки');

        $this->validator($request->all())->validate();

        $confirmation_code = str_random(30);

        $user = $this->create($request->all(), $request->ip(), $confirmation_code);
        event(new Registered($user));
        $this->guard()->login($user);
        $user->notify(new SendRegisterEmail($confirmation_code));
        return back()->with('flash_message_success', 'Требуется активация. На адрес ' . $user->email . ' отправлено письмо с ссылкой для активации учётной записи.');



        return $this->registered($request, $user)
            ?: redirect($this->redirectPath());
    }
}
