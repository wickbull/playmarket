@extends('layouts.app')

{{-- {{dump(vue_lang('index', session("langId")))}}  для вюджс перевод --}}

@section('content')
    
    <main>
        <div class="c-main-banner">
            <div class="container">
                <div class="c-main-banner__inner">
                    <div class="c-main-banner__ttl"><span>@lang(session("langId"), 'index', 'intro_1', 43200)</span></div>
                    <div class="c-main-banner__txt"><span>@lang(session("langId"), 'index', 'intro_2', 43200)</span></div>
                </div>
            </div>
				</div>
				<div class="l-section-bordered">
            <div class="container">
                <div class="l-section-bordered__ttl">

                    <h2 class="h2">@lang(session("langId"), 'index', 'last_sales', 43200)</h2>
                </div>
                <div class="l-section-bordered__content">
                    <div class="c-last-sales">
                        <div class="row">
                            
                            {{--@foreach($last_trades as $trade)
                                @if(!empty($trade->lot->first()))
                                    @foreach($trade->lot->where('top',1) as $trade)
                                        <div class="col-md-12">
                                            <div class="c-last-sales__item" style="background: #f9f6b6;">
                                                <div class="col-md-12">
                                                        <img src="{{ $trade->user->avatar }}" alt="" style="width: 100%;">
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="c-last-sales__item-info">
                                                        <div class="c-last-sales__item-user">
                                                            <a href="/user-profile/{{ $trade->owner_id }}">{{ $trade->user->name }}</a>
                                                        </div>
                                                        <div class="c-last-sales__item-date">
                                                            <span>123123</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                                    @endforeach
                                @endif
                            @endforeach--}}

                            @foreach($last_trades as $trade)
                                @if(!empty($trade->lot->first()))
                                    @foreach($trade->lot->where('top',1) as $trade)
                                        @if($trade->time() == true)
                                            <div class="col-md-6 col-sm-12 col-xs-24">
                                                <div class="c-last-sales__item">
                                                    <div class="c-last-sales__item-header">
                                                        <div class="c-last-sales__item-avatar">
                                                            <div class="h-object-fit">
                                                                <img src="{{ $trade->user->avatar }}" alt=""/>
                                                            </div>
                                                        </div>
                                                        <div class="c-last-sales__item-info">
                                                            <div class="c-last-sales__item-user">
                                                                <a href="/user-profile/{{ $trade->owner_id }}">{{ $trade->user->name }}</a>
                                                            </div>
                                                            <div class="c-last-sales__item-date">
                                                                <span>20.02.2017, 20:00</span>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="c-last-sales__item-body">
                                                        <div class="c-last-sales__item-game">
                                                                <a href="/game/{{$trade->game->id}}">{{$trade->game->name}} {{$trade->game->region}}</a>
                                                        </div>
                                                        <div class="c-last-sales__item-totals">
                                                            
                                                            <div class="row">
                                                                
                                                                <div class="col-sm-12 border-right">
                                                                    <div class="c-last-sales__item-totals-item">
																																			<div class="c-last-sales__item-totals-key">
																																					<span>{{ $trade->availability }}</span>
																																			</div>
                                                                        <div class="c-last-sales__item-totals-val">
                                                                            <span>
                                                                                {{--@lang(session("langId"), "index", "currency", 43200)--}}
                                                                                @lang(session("langId"), 'index', 'price', 43200)
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-12">
                                                                    <div class="c-last-sales__item-totals-item">
																																			<div class="c-last-sales__item-totals-key">
																																					<span>{{ comission($comissions[2], $trade->price) }}</span>
																																			</div>
                                                                        <div class="c-last-sales__item-totals-val">
                                                                            <span>
                                                                                {{--@lang(session("langId"), "index", "currency", 43200)--}}
                                                                                @lang(session("langId"), 'index', 'sales', 43200)
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                           
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>      
                                        @endif
                                    @endforeach
                                @endif
                            @endforeach

                            {{--

                                totalCommission: function totalCommission(item, lot_price) {
                                    var price = undefined;
                                    price = lot_price;
                                    var amount = price * 100 / parseFloat(item.coefficient);
                                    var commisionPrice = amount / this.commissionSum(item);
                                    if (isNaN(commisionPrice)) return 0;
                                    return this.roundDown(commisionPrice, 3);
                                },

                            --}}

                            {{--@foreach($last_trades as $trade)
                                <div class="col-md-8 col-sm-12 col-xs-24">
                                <div class="c-last-sales__item">
                                    <div class="c-last-sales__item-header">
                                        <div class="c-last-sales__item-avatar">
                                            <div class="h-object-fit"><img src="{{$trade->owner->avatar}}"
                                                                           alt=""/></div>
                                        </div>
                                        <div class="c-last-sales__item-info">
                                            <div class="c-last-sales__item-user"><a href="/user-profile/{{$trade->owner->id}}">{{ $trade->owner->name }}</a></div>
                                            <div class="c-last-sales__item-date"><span>{{ date('d.m.Y, H:i', strtotime($trade->created_at)) }}</span></div>
                                        </div>
                                    </div>
                                    <div class="c-last-sales__item-body">
                                        <div class="c-last-sales__item-game">@if(!empty($trade->lot) && !empty($trade->lot->game))
                                                <a href="/game/{{$trade->lot->game->id}}">{{ $trade->lot->game->name }}</a>@endif
                                        </div>
                                        <div class="c-last-sales__item-totals">
                                            <div class="c-last-sales__item-totals-item">
                                                <div class="c-last-sales__item-totals-val"><span>{{ number_format($trade->price,2,'.',' ') }}
                                                        @lang(session("langId"), "index", "currency", 43200)</span></div>
                                                <div class="c-last-sales__item-totals-key"><span>Цена</span></div>
                                            </div>
                                            <div class="c-last-sales__item-totals-item">
                                                <div class="c-last-sales__item-totals-val">
                                                    <span>
                                                        @if($trade->get_availability)
                                                            {{ (int)$trade->get_availability }}
                                                        @else
                                                            @if(isset($trade->lot->tag))
                                                                {{ $trade->lot->tag->name }}
                                                            @endif
                                                        @endif
                                                    </span>
                                                </div>
                                                <div class="c-last-sales__item-totals-key"><span>@lang(session("langId"), "index", "saled", 43200)</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach--}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @if(!empty($featured_game) && $featured_game->count())
        <div class="l-section-bordered">
            <div class="container">
                <div class="l-section-bordered__ttl">
                    <h2 class="h2">@lang(session("langId"), "index", "featured_games", 43200)</h2>
                </div>
                <div class="l-section-bordered__content">
                    <div class="c-fav-games__list">
                        <div class="row">
                            @foreach($featured_game as $f_game)
                                <div class="col-lg-8 col-sm-12 col-xs-12 col-xx-24">
                                    <div class="c-games-list__item">
                                        <div class="c-games-list__item-header"><a href="/game/{{$f_game->id}}"
                                                                                  class="c-games-list__item-ttl">{{ $f_game->name }}</a>
                                            
                                        </div>
                                        <div class="c-games-list__item-tags">
                                            <ul class="h-list">
                                                @foreach($f_game->currency as $currency)
                                                    <li><a href="/game/{{ $f_game->id }}#tab-game-chat-{{$currency->name}}">#@lang(session("langId"), 'currency', $currency->name, 43200)</a></li>
                                                @endforeach
                                                @foreach($f_game->tags as $tag)
                                                    <li><a href="/game/{{ $f_game->id }}#tab-game-chat-{{$tag->name}}">#@lang(session("langId"), 'tags', $tag->name, 43200)</a></li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endif
        <div class="c-games-list is-hidden js-games-list">
            <div class="container" id="search-game">
            </div>
            <div class="container" id="all-game">
                @include('_partial._main_search')
            </div>

        </div>

        <div class="c-advantages">
            <div class="container">
                <div class="c-advantages__list">
                    <div class="row">
                        <div class="col-sm-4 col-xs-12 col-xx-24">
                            <div class="c-advantages__item"><a href="#"
                                                               title="@lang(session("langId"), "index", "we_safe_deal", 43200)"
                                                               data-toggle="tooltip">
                                    <div class="c-advantages__item-icon">
																		<svg width="64" height="64" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
																				<g clip-path="url(#clip0)">
																				<path d="M56.2351 12.9581L32.1811 0.140902C31.8242 -0.0495519 31.3965 -0.046879 31.0424 0.147585L7.65395 12.9648C7.27037 13.1753 7.03247 13.5776 7.03247 14.0153V30.7579C7.0465 44.5207 15.2006 56.9717 27.8107 62.4855L31.0571 63.9002C31.3605 64.0325 31.7059 64.0332 32.01 63.9015L35.6681 62.3218C48.512 56.9276 56.8679 44.3563 56.8692 30.4257V14.0153C56.8692 13.5729 56.6253 13.1659 56.2351 12.9581ZM54.4742 30.4257C54.4715 43.396 46.6897 55.0992 34.7305 60.1185L34.7225 60.1225L31.5369 61.4978L28.7689 60.2903C17.031 55.158 9.44021 43.5691 9.42684 30.7579V14.7243L31.6258 2.558L54.4742 14.733V30.4257Z" fill="white"/>
																				<path d="M22.7907 29.9815C22.361 29.4783 21.6052 29.4189 21.102 29.8486C20.5988 30.2776 20.5394 31.0341 20.9691 31.5366L27.2948 38.9442C27.7171 39.4388 28.4569 39.5062 28.9608 39.0959L43.6932 27.11C44.2064 26.693 44.284 25.9386 43.8663 25.4254C43.4493 24.9128 42.6948 24.8346 42.1816 25.2523L28.3567 36.4991L22.7907 29.9815Z" fill="white"/>
																				</g>
																				<defs>
																				<clipPath id="clip0">
																				<rect width="64" height="64" fill="white"/>
																				</clipPath>
																				</defs>
																				</svg>
                                    </div>
                                    <div class="c-advantages__item-txt"><span>@lang(session("langId"), 'index', 'safe_deal', 43200)</span></div>
                                </a></div>
                        </div>
                        <div class="col-sm-4 col-xs-12 col-xx-24">
                            <div class="c-advantages__item"><a href="#"
                                                               title="@lang(session("langId"), "index", "we_work_24_7", 43200)"
                                                               data-toggle="tooltip">
                                    <div class="c-advantages__item-icon">
																		<svg width="64" height="64" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
																		<g clip-path="url(#clip0)">
																		<path d="M9.59999 21.3334H14.9333V19.2001H10.6667V17.0667H13.8667C14.4557 17.0667 14.9333 16.5891 14.9333 16.0001V11.7334C14.9333 11.1444 14.4557 10.6667 13.8667 10.6667H9.59999C9.01093 10.6667 8.53333 11.1444 8.53333 11.7334V13.8667H10.6667V12.8001H12.8V14.9334H9.59999C9.01093 14.9334 8.53333 15.411 8.53333 16.0001V20.2667C8.53333 20.8558 9.01093 21.3334 9.59999 21.3334Z" fill="white"/>
																		<path d="M18.1333 17.0667H21.3333V21.3334H23.4666V10.6667H21.3333V14.9334H19.2V10.6667H17.0667V16.0001C17.0667 16.5891 17.5443 17.0667 18.1333 17.0667Z" fill="white"/>
																		<path d="M34.1333 4.2666C33.025 4.26712 31.9177 4.32754 30.8161 4.44785L31.0505 6.56973C42.7479 5.26921 53.9901 11.4994 59.0885 22.1067C64.187 32.7145 62.0292 45.3853 53.7073 53.7072C45.3854 62.0291 32.7146 64.1869 22.1068 59.0885C11.4995 53.99 5.26927 42.7478 6.56979 31.0505L4.44791 30.8161C4.3276 31.9176 4.26718 33.0249 4.26666 34.1333C4.26666 50.6281 17.6385 63.9999 34.1333 63.9999C50.6281 63.9999 64 50.6281 64 34.1333C64 17.6385 50.6281 4.2666 34.1333 4.2666Z" fill="white"/>
																		<path d="M8.55676 33.022C8.54166 33.3866 8.53333 33.761 8.53333 34.1334C8.53333 48.272 19.9948 59.7334 34.1333 59.7334C48.2719 59.7334 59.7333 48.272 59.7333 34.1334C59.7333 19.9949 48.2719 8.53345 34.1333 8.53345C33.7609 8.53345 33.3865 8.54178 33.0219 8.55688L33.1115 10.6902C33.4505 10.6746 33.7911 10.6668 34.1333 10.6668C47.0937 10.6668 57.6 21.173 57.6 34.1334C57.6 47.0939 47.0937 57.6001 34.1333 57.6001C21.1729 57.6001 10.6667 47.0939 10.6667 34.1334C10.6667 33.7913 10.674 33.4506 10.6891 33.1116L8.55676 33.022Z" fill="white"/>
																		<path d="M20.2667 33.0666V35.2H30.674L33.3792 37.9052C33.7958 38.3213 34.4708 38.3213 34.8875 37.9052L37.9052 34.8875C38.3214 34.4708 38.3214 33.7958 37.9052 33.3791L35.2 30.6739V18.1333H33.0667V30.6739L30.674 33.0666H20.2667ZM34.1333 32.6239L35.6427 34.1333L34.1333 35.6427L32.624 34.1333L34.1333 32.6239Z" fill="white"/>
																		<path d="M16 32C24.8365 32 32 24.8365 32 16C32 7.16354 24.8365 0 16 0C7.16354 0 0 7.16354 0 16C0.00989584 24.8323 7.16771 31.9901 16 32ZM16 2.13333C23.6583 2.13333 29.8667 8.34167 29.8667 16C29.8667 23.6583 23.6583 29.8667 16 29.8667C8.34167 29.8667 2.13333 23.6583 2.13333 16C2.14219 8.34531 8.34531 2.14219 16 2.13333Z" fill="white"/>
																		</g>
																		<defs>
																		<clipPath id="clip0">
																		<rect width="64" height="63.9999" fill="white"/>
																		</clipPath>
																		</defs>
																		</svg>

                                    </div>
                                    <div class="c-advantages__item-txt"><span>@lang(session("langId"), 'index', 'work_24_7', 43200)</span></div>
                                </a></div>
                        </div>
                        <div class="col-sm-4 col-xs-12 col-xx-24">
                            <div class="c-advantages__item"><a href="#"
                                                               title="@lang(session("langId"), "index", "we_fast_service", 43200)"
                                                               data-toggle="tooltip">
                                    <div class="c-advantages__item-icon">
																		<svg width="61" height="64" viewBox="0 0 61 64" fill="none" xmlns="http://www.w3.org/2000/svg">
																			<g clip-path="url(#clip0)">
																			<path d="M31.8304 40.5215C32.9408 40.4351 33.9531 39.8687 34.6101 38.9652L44.5973 25.1583C44.9035 24.7349 44.8576 24.1503 44.4864 23.7791C44.1152 23.409 43.5307 23.3631 43.1072 23.6682L29.2981 33.6586C28.3979 34.3135 27.8315 35.3258 27.7451 36.4362C27.6587 37.5466 28.0608 38.6335 28.8469 39.4197C29.5627 40.1364 30.528 40.5332 31.5317 40.5332C31.6309 40.5332 31.7301 40.529 31.8304 40.5215ZM29.872 36.6026C29.9093 36.1151 30.1589 35.6703 30.5515 35.3844L38.9749 29.2906L32.8832 37.7119C32.5952 38.1076 32.1504 38.3562 31.6629 38.3946C31.1776 38.4266 30.7008 38.258 30.3541 37.9114C30.0107 37.5668 29.8336 37.089 29.872 36.6026Z" fill="white"/>
																			<path d="M55.7237 20.8683C55.7131 20.8459 55.7131 20.8224 55.7013 20.8C55.6885 20.7787 55.6683 20.7669 55.6544 20.7467C54.576 18.8971 53.3003 17.1765 51.8517 15.6171L54.1429 13.3269L55.6512 14.8352L60.176 10.3093L55.6512 5.78453L51.1253 10.3093L52.6347 11.8187L50.3435 14.1088C48.784 12.6603 47.0645 11.3835 45.2139 10.3051C45.1936 10.2912 45.1819 10.2709 45.1605 10.2581C45.1381 10.2453 45.1147 10.2464 45.0923 10.2347C41.7931 8.33387 38.0864 7.06773 34.1344 6.60373V5.33333H35.7344C37.2053 5.33333 38.4011 4.1376 38.4011 2.66667C38.4011 1.19573 37.2043 0 35.7333 0H26.1333C24.6624 0 23.4667 1.19573 23.4667 2.66667C23.4667 4.1376 24.6624 5.33333 26.1333 5.33333H27.7333V6.5664C26.5813 6.68907 25.4315 6.8768 24.2944 7.13707C23.7205 7.26827 23.3611 7.84107 23.4933 8.41493C23.6245 8.9888 24.1973 9.34933 24.7712 9.216C25.7525 8.99093 26.7435 8.82133 27.7365 8.7072L28.8811 8.61867C29.2309 8.592 29.5531 8.5728 29.8667 8.55787V10.6667C29.8667 11.2565 30.3435 11.7333 30.9333 11.7333C31.5232 11.7333 32 11.2565 32 10.6667V8.56533C36.0117 8.74987 39.792 9.8272 43.1531 11.6L42.1013 13.4208C41.8069 13.9317 41.9819 14.5835 42.4917 14.8779C42.6592 14.9749 42.8427 15.0208 43.024 15.0208C43.3931 15.0208 43.7515 14.8299 43.9488 14.4875L44.9973 12.6709C48.3349 14.7883 51.1701 17.6235 53.2875 20.9611L51.4709 22.0096C50.9621 22.304 50.7872 22.9557 51.0827 23.4667C51.2811 23.8091 51.6384 24 52.0075 24C52.1888 24 52.3723 23.9541 52.5397 23.8571L54.3605 22.8053C56.1579 26.2144 57.2384 30.0565 57.3995 34.1323H55.2928C54.7029 34.1323 54.2261 34.6091 54.2261 35.1989C54.2261 35.7888 54.7029 36.2656 55.2928 36.2656H57.3995C57.2384 40.3413 56.1579 44.1835 54.3605 47.5925L52.5397 46.5408C52.0299 46.2464 51.3771 46.4192 51.0827 46.9312C50.7883 47.4421 50.9632 48.0939 51.4731 48.3883L53.2896 49.4368C51.1723 52.7744 48.3371 55.6096 44.9995 57.7269L43.9509 55.9104C43.6555 55.3984 43.0016 55.2245 42.4939 55.52C41.9829 55.8144 41.808 56.4672 42.1035 56.9771L43.1552 58.7979C39.7941 60.5707 36.0139 61.648 32.0021 61.8325V59.7333C32.0021 59.1435 31.5253 58.6667 30.9355 58.6667C30.3456 58.6667 29.8688 59.1435 29.8688 59.7333V61.8411C28.1653 61.7824 26.4565 61.5691 24.7744 61.1829C24.2005 61.0453 23.6277 61.4101 23.4965 61.984C23.3643 62.5579 23.7237 63.1307 24.2976 63.2619C26.4267 63.7525 28.6016 64 30.7595 64C30.8117 64 30.8619 63.9968 30.9141 63.9957C30.9216 63.9957 30.9269 64 30.9333 64C30.9419 64 30.9493 63.9947 30.9579 63.9947C36.0853 63.9595 40.896 62.5749 45.0581 60.1835C45.0912 60.1685 45.1264 60.1611 45.1584 60.1419C45.1797 60.1291 45.1915 60.1088 45.2117 60.0949C49.52 57.584 53.12 53.9883 55.6363 49.6832C55.6565 49.6544 55.6821 49.632 55.7003 49.6C55.7131 49.5776 55.712 49.5541 55.7227 49.5317C58.1589 45.3077 59.5595 40.416 59.5595 35.2C59.5595 29.984 58.1589 25.0923 55.7237 20.8683ZM55.6501 8.80107L57.1584 10.3093L55.6501 11.8187L54.1408 10.3093L55.6501 8.80107ZM29.8667 6.4224V3.2H26.1333C25.84 3.2 25.6 2.96 25.6 2.66667C25.6 2.37333 25.84 2.13333 26.1333 2.13333H35.7333C36.0267 2.13333 36.2667 2.37333 36.2667 2.66667C36.2667 2.96 36.0267 3.2 35.7333 3.2H32V6.4224C31.6288 6.40747 31.2747 6.4 30.9333 6.4C30.9035 6.4 30.8693 6.40213 30.8395 6.40213C30.8128 6.40213 30.7861 6.4 30.7595 6.4C30.5845 6.4 30.4096 6.41173 30.2347 6.41493C30.1109 6.41813 29.9947 6.41707 29.8667 6.4224Z" fill="white"/>
																			<path d="M21.3333 14.9333H16C15.4101 14.9333 14.9333 15.4101 14.9333 16C14.9333 16.5899 15.4101 17.0667 16 17.0667H21.3333C21.9232 17.0667 22.4 16.5899 22.4 16C22.4 15.4101 21.9232 14.9333 21.3333 14.9333Z" fill="white"/>
																			<path d="M21.3333 22.3999H10.6666C10.0768 22.3999 9.59998 22.8767 9.59998 23.4666C9.59998 24.0564 10.0768 24.5332 10.6666 24.5332H21.3333C21.9232 24.5332 22.4 24.0564 22.4 23.4666C22.4 22.8767 21.9232 22.3999 21.3333 22.3999Z" fill="white"/>
																			<path d="M21.3333 29.8667H5.33327C4.7434 29.8667 4.2666 30.3435 4.2666 30.9334C4.2666 31.5232 4.7434 32 5.33327 32H21.3333C21.9231 32 22.3999 31.5232 22.3999 30.9334C22.3999 30.3435 21.9231 29.8667 21.3333 29.8667Z" fill="white"/>
																			<path d="M21.3333 37.3333H1.06667C0.4768 37.3333 0 37.8101 0 38.3999C0 38.9898 0.4768 39.4666 1.06667 39.4666H21.3333C21.9232 39.4666 22.4 38.9898 22.4 38.3999C22.4 37.8101 21.9232 37.3333 21.3333 37.3333Z" fill="white"/>
																			<path d="M21.3334 44.8H7.46669C6.87682 44.8 6.40002 45.2768 6.40002 45.8667C6.40002 46.4566 6.87682 46.9334 7.46669 46.9334H21.3334C21.9232 46.9334 22.4 46.4566 22.4 45.8667C22.4 45.2768 21.9232 44.8 21.3334 44.8Z" fill="white"/>
																			<path d="M21.3334 52.2666H13.8667C13.2768 52.2666 12.8 52.7434 12.8 53.3333C12.8 53.9231 13.2768 54.3999 13.8667 54.3999H21.3334C21.9232 54.3999 22.4 53.9231 22.4 53.3333C22.4 52.7434 21.9232 52.2666 21.3334 52.2666Z" fill="white"/>
																			</g>
																			<defs>
																			<clipPath id="clip0">
																			<rect width="60.176" height="64" fill="white"/>
																			</clipPath>
																			</defs>
																			</svg>

                                    </div>
                                    <div class="c-advantages__item-txt"><span>@lang(session("langId"), 'index', 'fast_service', 43200)</span></div>
                                </a></div>
                        </div>
                        <div class="col-sm-4 col-xs-12 col-xx-24">
                            <div class="c-advantages__item"><a href="#"
                                                               title="@lang(session("langId"), "index", "we_money_back", 43200)"
                                                               data-toggle="tooltip">
                                    <div class="c-advantages__item-icon">
																		<svg width="64" height="64" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
																			<path d="M58.7465 41.9136C57.9485 41.2463 56.8942 40.9693 55.8775 41.1447L44.9231 43.5496L34.52 44.8328L28.4537 38.8093C28.2523 38.6082 27.9788 38.496 27.6923 38.496H16.9231C16.9231 37.9057 16.4417 37.4266 15.8462 37.4266H11.5385H4V39.5653H10.4615V54.536H4V56.6746H11.5385H15.8462C16.4417 56.6746 16.9231 56.1956 16.9231 55.6053H19.8997L31.4131 61.322C31.9117 61.569 32.4502 61.693 32.9886 61.692C33.6003 61.692 34.2131 61.5326 34.7612 61.215L58.2554 47.6067C59.3312 46.9822 60 45.8252 60 44.588C60 43.5539 59.5423 42.5787 58.7465 41.9136ZM14.7692 54.536H12.6154V39.5653H14.7692V54.536ZM57.1688 45.76L33.6757 59.3672C33.2772 59.5982 32.7915 59.6142 32.3769 59.4089L20.6363 53.58C20.4866 53.5051 20.3208 53.4666 20.1538 53.4666H16.9231V40.6346H27.2465L35.7315 49.0588C36.1031 49.4288 36.3077 49.9197 36.3077 50.4415C36.3077 51.5205 35.4246 52.3973 34.3391 52.3973C33.8211 52.3973 33.3138 52.1888 32.9466 51.8241L27.3768 46.2946L25.854 47.8067L31.4238 53.3362C32.2025 54.1104 33.2363 54.536 34.3391 54.536C36.6114 54.536 38.4615 52.6999 38.4615 50.4415C38.4615 49.3486 38.0329 48.321 37.2543 47.5468L36.3831 46.6817L56.2458 43.2513C56.6465 43.1818 57.0503 43.2919 57.3594 43.5496C57.6685 43.8084 57.8462 44.187 57.8462 44.588C57.8462 45.0681 57.5866 45.5172 57.1688 45.76Z" fill="white"/>
																			<path d="M40.8958 11.0457L30.1262 22.8077L31.7206 24.2471L42.4903 12.4851L40.8958 11.0457Z" fill="white"/>
																			<path d="M32.0001 17.644C33.7813 17.644 35.2308 16.2047 35.2308 14.436C35.2308 12.6674 33.7813 11.228 32.0001 11.228C30.2188 11.228 28.7693 12.6674 28.7693 14.436C28.7693 16.2047 30.2188 17.644 32.0001 17.644ZM32.0001 13.3667C32.5945 13.3667 33.077 13.8468 33.077 14.436C33.077 15.0252 32.5945 15.5054 32.0001 15.5054C31.4056 15.5054 30.9231 15.0252 30.9231 14.436C30.9231 13.8468 31.4056 13.3667 32.0001 13.3667Z" fill="white"/>
																			<path d="M37.3845 20.852C37.3845 22.6207 38.8341 24.06 40.6153 24.06C42.3965 24.06 43.8461 22.6207 43.8461 20.852C43.8461 19.0834 42.3965 17.644 40.6153 17.644C38.8341 17.644 37.3845 19.0834 37.3845 20.852ZM41.6922 20.852C41.6922 21.4412 41.2098 21.9214 40.6153 21.9214C40.0208 21.9214 39.5384 21.4412 39.5384 20.852C39.5384 20.2628 40.0208 19.7827 40.6153 19.7827C41.2098 19.7827 41.6922 20.2628 41.6922 20.852Z" fill="white"/>
																			<path d="M35.5259 40.301C35.7305 40.5138 36.0127 40.6347 36.3078 40.6347C36.6028 40.6347 36.885 40.5138 37.0896 40.301L54.1675 22.4346C59.0589 17.3168 59.0589 8.98989 54.1675 3.87313C51.7799 1.37516 48.6019 0 45.2182 0C41.8518 0 38.6899 1.36019 36.3078 3.83249C33.9256 1.36019 30.7638 0 27.3973 0C24.0136 0 20.8356 1.37516 18.4481 3.87313C13.5567 8.99096 13.5567 17.3179 18.4481 22.4346L35.5259 40.301ZM20.0107 5.3456C21.9868 3.27751 24.6102 2.13867 27.3973 2.13867C30.1855 2.13867 32.8078 3.27751 34.7839 5.3456L35.5259 6.123C35.9341 6.54753 36.6804 6.54753 37.0885 6.123L37.8305 5.3456C39.8078 3.27751 42.4312 2.13867 45.2182 2.13867C48.0053 2.13867 50.6276 3.27751 52.6038 5.3456C56.7198 9.65074 56.7198 16.657 52.6038 20.9621L36.3078 38.0116L20.0107 20.9621C15.8947 16.657 15.8947 9.65074 20.0107 5.3456Z" fill="white"/>
																			</svg>

                                    </div>
                                    <div class="c-advantages__item-txt"><span>@lang(session("langId"), 'index', 'money_back_guarantee', 43200)</span></div>
                                </a></div>
                        </div>
                        <div class="col-sm-4 col-xs-12 col-xx-24">
                            <div class="c-advantages__item"><a href="#"
                                                               title="@lang(session("langId"), "index", "we_money_back", 43200)"
                                                               data-toggle="tooltip">
                                    <div class="c-advantages__item-icon">
																				<svg width="64" height="64" viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
																					<g clip-path="url(#clip0)">
																					<path d="M31.9412 24.8141C27.6677 24.8141 24.2029 28.279 24.2029 32.5524C24.2029 36.8264 27.6677 40.2907 31.9412 40.2907C36.2151 40.2907 39.6794 36.8264 39.6794 32.5524C39.6746 28.2811 36.213 24.819 31.9412 24.8141ZM31.9412 38.0798C28.8887 38.0798 26.4138 35.6054 26.4138 32.5524C26.4138 29.5 28.8887 27.0251 31.9412 27.0251C34.9942 27.0251 37.4685 29.5 37.4685 32.5524C37.4653 35.6038 34.9925 38.0765 31.9412 38.0798Z" fill="white"/>
																					<path d="M8.72632 21.4979H10.9373V19.2869H7.62085C7.01036 19.2869 6.51538 19.7819 6.51538 20.3924V23.7088H8.72632V21.4979Z" fill="white"/>
																					<path d="M8.72632 41.3962H6.51538V44.7126C6.51538 45.3237 7.01036 45.8181 7.62085 45.8181H10.9373V43.6072H8.72632V41.3962Z" fill="white"/>
																					<path d="M2.09351 15.9705V49.1346C2.09351 49.7456 2.58848 50.2401 3.19897 50.2401H60.6833C61.2944 50.2401 61.7888 49.7456 61.7888 49.1346V15.9705C61.7888 15.36 61.2944 14.8651 60.6833 14.8651H3.19897C2.58848 14.8651 2.09351 15.36 2.09351 15.9705ZM4.30444 17.076H59.5779V48.0291H4.30444V17.076Z" fill="white"/>
																					<path d="M56.2615 27.0252C52.6001 27.022 49.6324 24.0543 49.6287 20.3924C49.6287 19.7819 49.1342 19.2869 48.5232 19.2869H15.3591C14.7486 19.2869 14.2537 19.7819 14.2537 20.3924C14.2504 24.0543 11.2827 27.022 7.62085 27.0252C7.01036 27.0252 6.51538 27.5202 6.51538 28.1307V36.9744C6.51538 37.5855 7.01036 38.0799 7.62085 38.0799C11.2827 38.0837 14.2504 41.0514 14.2537 44.7127C14.2537 45.3237 14.7486 45.8182 15.3591 45.8182H48.5232C49.1342 45.8182 49.6287 45.3237 49.6287 44.7127C49.6324 41.0514 52.6001 38.0837 56.2615 38.0799C56.8725 38.0799 57.3669 37.5855 57.3669 36.9744V28.1307C57.3669 27.5202 56.8725 27.0252 56.2615 27.0252ZM55.156 35.9375C51.1514 36.4492 47.998 39.6026 47.4863 43.6072H16.396C15.8843 39.6026 12.7315 36.4492 8.72632 35.9375V29.1676C12.7315 28.6559 15.8843 25.503 16.396 21.4979H47.4863C47.998 25.503 51.1514 28.6559 55.156 29.1676V35.9375Z" fill="white"/>
																					<path d="M56.2615 19.2869H52.9451V21.4979H55.156V23.7088H57.3669V20.3924C57.3669 19.7819 56.8725 19.2869 56.2615 19.2869Z" fill="white"/>
																					<path d="M55.156 43.6072H52.9451V45.8181H56.2615C56.8725 45.8181 57.3669 45.3237 57.3669 44.7126V41.3962H55.156V43.6072Z" fill="white"/>
																					<path d="M17.0173 6.6992L18.1228 8.61164C25.6414 4.27613 34.7599 3.72448 42.7465 7.12131L38.0801 9.4537L39.0684 11.4325L45.7012 8.11613C45.9646 7.98658 46.1654 7.75663 46.2593 7.47865C46.3533 7.20012 46.3328 6.89568 46.2021 6.63281L42.8857 0L40.9069 0.988336L42.7859 4.74682C34.3459 1.45093 24.8652 2.16883 17.0173 6.6992Z" fill="white"/>
																					<path d="M45.7596 57.3008L44.6541 55.3883C37.136 59.7233 28.0181 60.2755 20.0321 56.8787L24.6984 54.5457L23.7101 52.5669L17.0773 55.8833C16.5305 56.1564 16.3087 56.8209 16.5823 57.3672L19.8987 64L21.877 63.0116L19.998 59.2532C28.4364 62.5469 37.9144 61.829 45.7596 57.3008Z" fill="white"/>
																					</g>
																					<defs>
																					<clipPath id="clip0">
																					<rect width="64" height="64" fill="white"/>
																					</clipPath>
																					</defs>
																					</svg>
                                    </div>
                                    <div class="c-advantages__item-txt"><span>@lang(session("langId"), 'index', 'money_back_guarantee', 43200)</span></div>
                                </a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

@endsection

@section('scripts')
    @parent
    <script src="{{ asset('js/search.js') }}"></script>
@endsection