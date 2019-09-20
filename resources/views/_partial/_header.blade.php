<header class="c-header js-header">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-5 balance-item">
                <div class="c-header__logo"><a href="/"><img src="/s/images/useful/logo.png" alt=""/></a></div>
            </div>
            <div class="c-header__menu-col col-md-20 col-sm-19">
                <button type="button" data-target-block=".c-header__menu"
                        class="c-header__menu-trig button-toggle visible-xs"></button>
                @if (Auth::guest())
                    <div class="c-header__menu minimized">
						<div class="c-header__search">
							<form action="">
							<div class="input-wrap-search">
								<img src="/s/images/useful/Search.png" alt=""> 
								<input id="search" type="text" name="main-search" placeholder="{{lang(session('langId'), 'head_menu', 'search', 43200)}}" value="" required="required" class="form-control">
							</div>
							</form>
						</div>
                        <div class="c-header__authreg">
                            <ul class="h-list">
                                <li>
                                    <button type="button" data-target="#modal-auth" data-toggle="modal" class="icon-link">
								        <span class="icon-link__txt">{{lang(session('langId'), 'head_menu', 'login', 43200)}}</span>
                                    </button>
                                </li>
                                <li>
                                    <button type="button" data-target="#modal-reg" data-toggle="modal"class="icon-link">
										<span class="icon-link__txt">{{lang(session('langId'), 'head_menu', 'register', 43200)}}</span>
                                    </button>
                                </li>
                                <li>
                                    {{-- {{ dd(select_lang_vue()) }} --}}

                                    {{-- {{dd(session('langId') )}} --}}

                                    <form method="POST" action="/lang" class="main-lang-picker">
                                        <input type="hidden" name="_token" value="{{csrf_token()}}">
                                        <select name="lang" class="selectpicker" data-width="fit" onchange="if (this.selectedIndex) $(this).closest('form').trigger('submit');">
                                            @foreach(select_lang_vue() as $value)
                                                {{-- {{$value}} --}}
                                                @if(session('langId') == $value->id)
                                                    <option value="{{$value->id}}" data-content='<span class="flag-icon flag-icon-{{strtolower($value->code)}}"></span>'></option>
                                                @endif
                                            @endforeach

                                            @foreach(select_lang_vue() as $value)
                                                @if(session('langId') != $value->id)
                                                    <option value="{{$value->id}}" data-content='<span class="flag-icon flag-icon-{{strtolower($value->code)}}"></span>'></option>
                                                @endif
                                            @endforeach
                                        </select>
                                    </form>
									{{-- <select class="selectpicker" data-width="fit">
										<option data-content='<span class="flag-icon flag-icon-us"></span>'></option>
										<option  data-content='<span class="flag-icon flag-icon-mx"></span>'></option>
									</select> --}}
                                </li>
                            </ul>
                        </div>
                    </div>
                @else
                    <div class="c-header__menu minimized c-header__menu--authorize">
						<div class="c-header__search">
							<form action="">
								<div class="input-wrap-search">
									<img src="/s/images/useful/Search.png" alt=""> 
									<input id="search" type="text" name="main-search" placeholder="{{lang(session('langId'), 'head_menu', 'search', 43200)}}" value="" required="required" class="form-control">
								</div>
							</form>
						</div>
                        <div class="c-header__links">
							<event-counter :event_count="{{auth()->user()->newMsgSum()}}"
                                :id="{{auth()->id()}}"
                                :langs="{{select_lang_vue()}}"
                                :csrf="{{json_encode(['csrf' => csrf_token()])}}"
                                :langid="{{json_encode(['lang_id' => session('langId')])}}"
                                :lang="{{ json_encode(vue_lang('head_menu', 43200)) }}">
                            </event-counter>

                            {{-- <li>
                                <select class="selectpicker" data-width="fit">
                                    <option data-content='<span class="flag-icon flag-icon-us"></span> '></option>
                                    <option  data-content='<span class="flag-icon flag-icon-mx"></span> '></option>
                                </select>
                            </li> --}}
                            {{--<ul class="h-list nav-user-item">
                                <li class="nav-my-sales">
                                    <a href="/sales">@lang(session('langId'), 'head_menu', 'my_sales', 43200)<!----></a>
                                </li> 
                                <li class="nav-my-purchases">
                                    <a href="/purchases">@lang(session('langId'), 'head_menu', 'my_purchases', 43200)<!----></a>
                                </li> 
                                <li class="nav-my-messages">
                                    <a href="/chat">@lang(session('langId'), 'head_menu', 'messages', 43200)<!----></a>
                                </li> 
                                <li>
                                    <a href="/profile#tab-cabinet_lots" aria-controls="cabinet_lots">@lang(session('langId'), 'head_menu', 'my_lots', 43200)<!----></a>
                                </li>
                            </ul>--}}

                            {{-- <event-counter :event_count="{{auth()->user()->newMsgSum()}}" :id="{{auth()->id()}}"></event-counter> --}}
                            {{--                            {!! \TCG\Voyager\Models\Menu::display('user', 'self'); !!}--}}
                        </div>
                        @if(auth()->user()->balance > 0)
                        @endif
                        <div class="c-header__user">
                            {{-- {{select_lang()}} --}}
                        </div>
                        <div class="c-header__user">
                            
                            <button type="button" data-target-block=".c-header__user-drop"
                                    class="c-header__user-trig button-toggle">
                                    {{-- <span class="c-header__user-avatar">
                                        <span class="h-object-fit">
                                            <img
                                                src="{{ Auth::user()->avatar }}"
                                                alt=""/>
                                        </span>
                                    </span> --}}
                                    <span class="c-header__user-name hidden-sm">{{ Auth::user()->name }}</span>
                            </button>
                            <div class="c-header__user-drop c-header-drop minimized">
                                <ul class="h-list">
                                    {{--                                    <li><a href="{{ route('purchases') }}">Мои покупки</a></li>--}}
                                    {{--                                    <li><a href="{{ route('chat') }}">Сообщения</a></li>--}}
                                    @if(!checkCurrentRouteName('my-profile'))
                                        <li><a
                                                    href="{{ route('my-profile') }}#tab-cabinet_balance">@lang(session("langId"), 'head_menu', 'balance', 1)</a></li>
                                    @endif

                                    @if(!checkCurrentRouteName('my-profile'))
                                        <li><a href="{{ route('my-profile') }}#tab-cabinet_profile">@lang(session("langId"), 'head_menu', 'profile', 1)</a>
                                    </li>
                                    @endif

                                    <li>
                                        <a href="{{ route('logout') }}"
                                           onclick="event.preventDefault();
                                               document.getElementById('logout-form').submit();">
                                            @lang(session("langId"), 'head_menu', 'exit', 1)
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</header>