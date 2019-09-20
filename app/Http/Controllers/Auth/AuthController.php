<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\BlockIp;
use App\User;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Socialite;

class AuthController extends Controller
{
    protected $redirectTo = '/';
    protected $loginPath = '/';


    public function redirectToProvider($provider)
    {
        return Socialite::with($provider)->redirect();
    }

    public function handleProviderCallback($provider, Request $request)
    {
        if ($request->has('error')) return redirect()->route('home');
        $user = Socialite::driver($provider)->user();
        $authUser = $this->findOrCreateUser($user, $provider, $request->ip());
        Auth::login($authUser, true);
        return redirect($this->redirectTo);
    }

    public function findOrCreateUser($user, $provider, $ip)
    {

        $authUser = User::where('email', $user->email)->first();
        if(empty($authUser)) $authUser = User::where('provider_id', $user->id)->first();
        if ($authUser) {
            if($authUser['status'] === 0){
                $authUser->update(['ip' => $ip, 'provider' => $provider]);

                $block_ip = BlockIp::where('user_id', $authUser['id'])->first();

                $block_ip->update(['ip' => $ip]);
                $block_ip->save();
                $authUser->save();
                return abort(403);
            }else{
                $authUser->update([
                    'provider' => $provider,
                    'provider_id' => $user->id,
                    'email' => isset($user->email) ? $user->email : $user->nickname . str_random(6) . '@test.mail',
                    'confirmed' => 1,
                    'confirmation_code' => null
                ]);
                return $authUser;
            }
        }
        $password = str_random(10);
        if(!empty($user->email)){
            Mail::send('email.password', ['data'=> $password], function($message) use($user) {
                $message->to( $user->email , $user->name)
                    ->subject('Password generation');
            });
        }
        $password = bcrypt($password);

        return User::create([
            'name'     => $user->name,
            'email' => isset($user->email) ? $user->email : $user->nickname . str_random(6) . '@test.mail',
            'password' => $password,
            'provider' => $provider,
            'provider_id' => $user->id,
            'avatar' => isset($user->avatar) ? $user->avatar : '/default-avatar.svg',
            'ip' => $ip,
            'confirmed' => isset($user->email) ? 1 : 0,
        ]);
    }
}
