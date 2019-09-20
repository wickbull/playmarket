<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    {{--<meta name="viewport" content="width=device-width, initial-scale=1">--}}
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Rubik:400,500,700&display=swap" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/0.8.2/css/flag-icon.min.css">
    <link rel="shortcut icon" href="{{asset('favicon.ico')}}" type="image/x-icon">

    <title>
        @if(View::hasSection('title'))
            @yield('title')
        @else
            {{ env('APP_NAME','Playmarket') }} | @lang(session('langId'), 'head_menu', 'obgr', 43200)
        @endif
    </title>


    <meta name="verification" content="2ee52a9056a466c50f9a363a7a3d60"/>
    <!-- CSS -->
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{csrf_token()}}">
    <!-- SEO -->

@yield('SEO')

<!-- TITLE -->

    @include('_partial._head')
    @stack('head')

<!--Start of Zendesk Chat Script-->
    <script type="text/javascript">
        window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
            d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
        _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
            $.src="https://v2.zopim.com/?3rCUdnyEn7B3XPLup8vGeis9VutZTcb7";z.t=+new Date;$.
                type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
    </script>
    <!--End of Zendesk Chat Script-->
</head>
<body>
<div class="l-page-wrapper">
    <div id="app">
        @include('_partial._header')
        @if ($errors->any())
            <div class="alert alert-danger true text-center" role="alert">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        @if(session()->has('flash_message_success'))
            <div class="alert alert-success true text-center"
                 role="alert">{!! session()->get('flash_message_success') !!}</div>
        @endif
        @if(session()->has('flash_message_rules'))
            <div class="alert alert-warning text-center" role="alert">
                @php($flash_message_rules = session()->get('flash_message_rules'))
                @if(is_array($flash_message_rules)) @foreach($flash_message_rules as $rule){!! $rule !!}@endforeach
                @else {!! $flash_message_rules !!}
                @endif
            </div>
        @endif
        @if(session()->has('flash_message_error'))
            <div class="alert alert-danger true text-center"
                 role="alert">{!!session()->get('flash_message_error') !!}</div>
        @endif
        <div id="ressPassMsg">

        </div>

        @yield('content')
    </div>
    @include('_partial._footer')
</div>


@if(auth()->check())
    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
        {{ csrf_field() }}
    </form>
@else
    @include('modals.modal-auth')
    @include('modals.modal-reg')
@endif

@yield('scripts')
<script>
    $('.update-captcha').on('click', function (e) {
        e.preventDefault();
        $.post("{{route('captcha.render')}}", {
            _token: "{{csrf_token()}}"
        }).done(function (data) {
            $('.captcha').html(data);
        })
    })
    $('.register-submit-button').on('click', function () {
        if ($('#captcha').val().length > 0)
            $.post("{{route('captcha.check')}}", {
                _token: "{{csrf_token()}}", captcha: $('#captcha').val()
            }).done(function (data) {
                $('#register-form').submit();
            }).fail(function (data) {
                alert('Код с картинки введен не верно, поробуйте ещё раз');
                $(".update-captcha").trigger("click");
            })
    })

    $('.h-list.nav-user-item li a').on('click', function () {
        if ($(this).attr('aria-controls') !== undefined) {
            $('.h-list li').removeClass('active');
            $('.h-list li a[aria-controls=' + $(this).attr('aria-controls') + ']').closest('li').addClass('active');
            $('.tab-content .tab-pane').removeClass('active').removeClass('in');
            $('.tab-content #' + $(this).attr('aria-controls')).addClass('active').addClass('in');
        }
    })
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/js/bootstrap-select.min.js"></script>
<!-- webmoney passport label#9CF93502-41AA-4D0E-A4E0-159B1BEEE12D begin -->
<a href="//passport.webmoney.ru/asp/certview.asp?wmid=236312820801">
    <img data-src="https://files.webmoney.ru/files/5xtc9oj4/inline" border="0"  class='lazyload'/>
</a>
<!-- webmoney passport label#9CF93502-41AA-4D0E-A4E0-159B1BEEE12D end -->
</body>
</html>
