<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
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
        $this->middleware('guest')->except('logout');
    }

    public function authenticated(Request $request, $user)
    {
        if (!empty($user)) $user->update(['ip' => $request->ip()]);
    }


//    public function login(Request $request)
//    {
//
////        $auth = Auth::attempt(array('email' => $email, 'password' => $password));
//
//        $email = $request->email;
//        $password = $request->password;
//
//
//        if (Auth::attempt(array('email' => $email, 'password' => $password)))
//        {
////            $client = new GuzzleHttpClient;
////            $res = $client->request('POST'.);
//            return response()->json('success');
//        }
////        dd($request->email);
//    }

}
