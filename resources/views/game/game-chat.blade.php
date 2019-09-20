@extends('layouts.app')

@section('content')

    <main>
        <div class="c-games-chat">
            <div class="container">
                @if(Auth::user())
                    @if(Auth::user()->confirmed ===0)
                        @include('errors.confirm-email')
                    @endif
                @endif
                <div class="c-games-chat__inner">
                    <div class="row">
                        <div class="col-lg-12 col-md-6_10 col-sm-14 col-xs-24">
                            <div role="tablist" class="c-tab-nav c-games-chat__tabs-nav xs-full xx-full">
                                <button type="button" class="c-tab-nav__trig visible-xs"><span>Адена</span>
                                </button>
                                <ul class="c-tab-nav__drop h-list minimized">
                                    @foreach($game->currency as $currency)
                                        <li role="presentation"
                                            @if($loop->first) class="active" @endif><a
                                                    href="#game-chat-{{$currency->name}}"
                                                    aria-controls="game-chat-{{$currency->name}}" role="tab"
                                                    data-toggle="tab"><span>{{ $currency->name }}</span></a></li>
                                    @endforeach
                                    @foreach($game->tags as $tag)
                                        <li role="presentation"
                                            @if($game->currency->isEmpty() && $loop->first)
                                            class="active"
                                                @endif><a
                                                    href="#game-chat-{{$tag->name}}"
                                                    aria-controls="game-chat-{{$tag->name}}" role="tab"
                                                    data-toggle="tab"><span>{{ $tag->name }}</span></a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    @include('game.currency')
                    @include('game.tags')
                </div>
            </div>
        </div>
        @if(!empty($game->description))
        <div class="c-games-chat__descr">
            <div class="container">
                {!! $game->description !!}
            </div>
        </div>
        @endif
    </main>

@endsection

@section('scripts')
    @parent
    <script src="{{ asset('js/search.js') }}"></script>
@endsection