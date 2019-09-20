@extends('layouts.app')

@section('content')
    <main>
        <div class="container">
            <div class="row">
                <div class="col-md-24">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <form class="js-form_check" method="POST" action="{{ route('login') }}">
                                {{ csrf_field() }}
                                <input type="hidden" name="remember" checked>
                                <div>
                                    <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                        <div class="form-group__ttl">Почта</div>
                                        <div class="input-wrap">
                                            <input type="email" name="email" value="{{ old('email') }}"
                                                   required="required" class="form-control"/>
                                            @if ($errors->has('email'))
                                                <span class="help-block">
                                                    <strong>{{ $errors->first('email') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                        <div class="form-group__ttl">Пароль</div>
                                        <div class="input-wrap">
                                            <input type="password" name="password" value="" required="required"
                                                   class="form-control"/>
                                            @if ($errors->has('password'))
                                                <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <a href="{{ route('password.request') }}" class="forgot-pass-link">Забыли пароль?</a>
                                <div class="form-footer text-center">
                                    <button type="submit" class="btn btn_blue btn_upper">Войти</button>
                                </div>
                                <div class="form-group">
                                    <div class="modal-footer__ttl text-center"><span>Войти через</span></div>
                                    <div class="login-as">
                                        <div class="row">
                                            <div class="col-xs-12 col-xx-24"><a href="{{ url('/auth/facebook') }}"
                                                                                class="login-as-link">
                                                    <div class="login-as-link__icon"><i class="ico ico-fb"></i></div>
                                                    <div class="login-as-link__text"><span>Facebook</span></div>
                                                </a>
                                            </div>
                                            <div class="col-xs-12 col-xx-24"><a href="{{ url('/auth/twitter') }}"
                                                                                class="login-as-link">
                                                    <div class="login-as-link__icon"><i class="ico ico-tw"></i></div>
                                                    <div class="login-as-link__text"><span>Twitter</span></div>
                                                </a>
                                            </div>
                                            <div class="col-xs-12 col-xx-24"><a href="{{ url('/auth/google') }}"
                                                                                class="login-as-link">
                                                    <div class="login-as-link__icon"><i class="ico ico-gp"></i></div>
                                                    <div class="login-as-link__text"><span>Google+</span></div>
                                                </a>
                                            </div>
                                            <div class="col-xs-12 col-xx-24"><a href="{{ url('/auth/vkontakte') }}"
                                                                                class="login-as-link">
                                                    <div class="login-as-link__icon"><i class="ico ico-vk"></i></div>
                                                    <div class="login-as-link__text"><span>Vkontakte</span></div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
