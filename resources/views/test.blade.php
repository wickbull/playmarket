@extends('layouts.app')
@section('content')
    
<!-- <style>
    .bootstrap-select .dropdown-menu.inner {
        position: static;
        float: none;
        border: 0;
        padding: 0;
        margin: 0;
        -webkit-border-radius: 0;
        -moz-border-radius: 0;
        border-radius: 0;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
    }

    .bootstrap-select .dropdown-menu {
        width: 100%;
    }

    .dropdown-menu > .active > a, .dropdown-menu > .active > a:hover, .dropdown-menu > .active > a:focus {
        background-color: #f5f5f5;
        color: #000;
    }

    .bootstrap-select.open .dropdown-toggle .bs-caret:before {
        -webkit-transform: translateY(2px) rotate(225deg);
        -moz-transform: translateY(2px) rotate(225deg);
        -ms-transform: translateY(2px) rotate(225deg);
        -o-transform: translateY(2px) rotate(225deg);
        transform: translateY(2px) rotate(225deg);
        border-bottom-color: #2aa7ff;
        border-right-color: #2aa7ff;
    }
</style>    
 -->
    <main>
        <div class="c-games-chat">
            <div class="container">
                @if(auth()->check())
                    @if(auth()->user()->confirmed ===0)
                        @include('errors.confirm-email')
                    @endif
                @endif
                <shop-layout :game="{{$game}}"
                             :new_msg="{{$new_chat_event}}"
                             :auth="{{auth()->check()?auth()->user():'null'}}"
                             :commission="{{$commissions}}"
                             :admin="{{ $admin }}"
                             :game-params='{!! $gameParams !!}'
                             :lang="{{ $lang }}"></shop-layout>

                             {{--{{dd($gameParams)}}--}}

            </div>
        </div>
        @if(!empty($game->description))
            <div class="c-games-chat__descr" style="display: none;">
                <div class="container">
                    {!! $game->description !!}
                </div>
            </div>
        @endif
    </main>
@endsection

@section('scripts')

    <script>
        // Display after page load -_-
        $(document).on('ready', function () {
            $('.c-games-chat__descr').show();
        })
    </script>
@endsection