<?php

namespace App\Http\Controllers\User;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Intervention\Image\Exception\InvalidArgumentException;
use Symfony\Component\HttpFoundation\Session\Flash\FlashBag;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('confirm');
    }

    public function confirm($confirmation_code)
    {
        if( ! $confirmation_code)
        {
            throw new InvalidArgumentException('Неверный код подтверждения');
        }

        $user = User::whereConfirmationCode($confirmation_code)->first();

        if ( ! $user)
        {
            throw new InvalidArgumentException('Неверный код подтверждения');
        }

        $user->confirmed = 1;
        $user->confirmation_code = null;
        $user->save();

        return redirect('/');
    }
}
