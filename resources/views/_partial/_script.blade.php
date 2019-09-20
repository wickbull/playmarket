{{--<script type="text/javascript">var base = "/chat/index.php/";</script>--}}
{{--<script type="text/javascript" src="{{ asset('chat/assets/js/jquery-ui.js') }}"></script>--}}
{{--<script type="text/javascript" src="{{ asset('chat/assets/js/jquery.slimscroll.js') }}"></script>--}}
{{--<script type="text/javascript" src="{{ asset('chat/assets/js/main.js') }}"></script>--}}
{{--<script type="text/javascript" src="{{ asset('chat/assets/js/chatigniter.js') }}"></script>--}}
{{--<script type="text/javascript" src="{{ asset('chat/assets/js/chatigniter1.js') }}"></script>--}}
{{--<script type="text/javascript" src="http://talk.laraman.ru/chat/assets/js/jquery-1.10.2.min.js"></script>--}}


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-show-password/1.0.3/bootstrap-show-password.min.js"></script>

<script src="{{ asset('js/app.js') }}"></script>

<script src="{{ asset('js/separate/global.js') }}"></script>
<script src="{{ asset('bower_components/bootstrap/js/transition.js') }}"></script>
<script src="{{ asset('js/helpers/bs_modal_fix.js') }}"></script>
<script src="{{ asset('js/plugins/bs/modal.js') }}"></script>
<script src="{{ asset('js/helpers/bsModalCenter.js') }}"></script>
<script src="{{ asset('js/helpers/resizer.js') }}"></script>
<script src="{{ asset('js/helpers/toggle-blocks.js') }}"></script>
<script src="{{ asset('bower_components/svg4everybody/dist/svg4everybody.min.js') }}"></script>
<script src="{{ asset('js/lib/modernizr-custom.js') }}"></script>
<script src="{{ asset('js/helpers/object-fit.js') }}"></script>
{{--@if(Request::path() == 'chat' || Request::path() == 'test')--}}
{{--@endif--}}
<script src="{{ asset('js/main.js') }}"></script>


{{--<script data-main="/js/main" src="/js/require.js"></script>--}}
@if(Auth::user())
    <script>
        $(document).ready(function () {
            window.userid = '{{ Auth::user()->id }}';
            window.name = '{{ Auth::user()->name }}';
            $("#password").password('toggle');
        })
    </script>
@endif

<script>
    $('div.alert.true').delay(6000).slideUp(600);

    $(window).load(function () {
        $(".reveal").on('click', function () {
            var $pwd = $(".pwd");
            if ($pwd.attr('type') === 'password') {
                $pwd.attr('type', 'text');
            } else {
                $pwd.attr('type', 'password');
            }
        });
        $( '.lazyload' ).each( function(){
            //* set the img src from data-src
            $( this ).attr( 'src', $( this ).attr( 'data-src' ) );
        } );
        @if($errors->has('password') || $errors->has('email'))
        $("#modal-auth").modal('show');
        @endif
    });
</script>
