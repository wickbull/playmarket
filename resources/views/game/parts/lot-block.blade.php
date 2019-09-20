@foreach($lots as $lot)
    @if($lot->game_id == $game['id'] && $lot->active == 1)
        <div class="c-games-chat__item" id="chat_lot_user_{{$lot->user->id}}">
            <div class="panel">
                <div id="{{$lot->id}}" class="panel-heading @if($lot->status == 0) has-deal @endif">
                    <a role="button" href="#" class="panel-heading-trig collapsed"></a>
                    <div class="c-games-chat__item-header">
                        <div class="c-games-chat__item-header-bottom t-row">
                            <div data-th="Продавец" class="c-games-chat__item-header-saler t-c"><div
                                        class="c-games-chat__item-header-saler-avatar">
                                    <div class="h-object-fit"><img
                                                src="{{ $lot->user->avatar }}"
                                                alt=""/></div>
                                </div>
                                <div class="c-games-chat__item-header-saler-info">
                                    <div class="c-games-chat__item-header-saler-info-top"><a href="{{ route('user-profile' , $lot->user->id) }}"
                                                                                             class="c-games-chat__item-header-saler-name">{{ $lot->user->name }}</a>
                                        @if($lot->user->isOnline())<span class="c-chat__online">online</span>@else <span class="c-chat__offline">offline</span> @endif
                                    </div>
                                    <div class="c-games-chat__item-header-saler-info-bottom"><span>на сайте с {{ date('d m Y', strtotime($lot->user->created_at)) }}, 13 отзывов</span>
                                    </div>
                                </div>
                            </div>
                            <div data-th="Описание" class="c-games-chat__item-header-descr t-c">
                                <noindex><span class="c-games-chat__item-header-descr-short">{{ str_limit($lot->description, 150) }}</span></noindex>
                                <span class="c-games-chat__item-header-descr-full">{{ $lot->description }}</span>
                            </div>
                            {{--<div data-th="Сторона"--}}
                            {{--class="c-games-chat__item-header-side t-c text-center">--}}
                            {{--<span>{{ $lot->subtags['name'] }}</span>--}}
                            {{--</div>--}}
                            @if($tag->price_per_unit != 0)
                                <div data-th="Наличие"
                                     class="c-games-chat__item-header-stock t-c text-center">
                                    <span>{{ $lot->availability }}</span></div>
                            @endif
                            <div data-th="Цена за 1 кк"
                                 class="c-games-chat__item-header-price t-c text-center">
                                <span>{{ $lot->price }} &#8381;</span></div>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="panel-collapse collapse">
                    <div class="c-games-chat__item-body">
                        <div class="row">
                            <div class="col-sm-12 col-xs-24">
                                <div class="c-games-chat__item-game">
                                    <ul class="h-list">
                                        <li><span class="key">Игра</span><span class="value">{{ $lot->game->name }}</span>
                                        </li>
                                        <li><span class="key">Категория</span><span class="value"><a
                                                        href="">{{ $lot->tag->name }}</a></span>
                                        </li>
                                        @if(isset($lot->server))<li><span class="key">Сервер</span><span class="value">{{ $lot->server->name }}{{isset($lot->server->side)?'('.$lot->server->side.')':''}}</span>@endif
                                        </li>
                                        @foreach($lot->subtags as $subtag)
                                            <li>
                                                <span class="key">{{ $subtag->subtag->name }}</span>
                                                <span class="value">{{ $subtag->name }}</span>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                                <div class="c-games-chat__item-order ">
                                    <form class="js-form_check " action="{{ route('create-trade', $lot->id) }}" method="post">
                                        {{ csrf_field() }}
                                        <div class="c-games-chat__item-order-ttl"><span>Оформление заказа</span>
                                        </div>
                                        <div class="c-games-chat__item-order-inputs">
                                            <div class="form-group">
                                                <div class="form-group__ttl">Способ оплаты</div>
                                                <div class="select-wrap">
                                                    <select title="Выбрать" name="pay_method"
                                                            class="selectpicker">
                                                        <option value="1">lorem</option>
                                                        <option value="2">Ipsum</option>
                                                        <option value="3">Dolor</option>
                                                        <option value="4">Sit amet</option>
                                                        <option value="5">Consectetur</option>
                                                    </select>
                                                </div>
                                            </div>
                                            @if(isset($lot->availability))
                                                <div class="form-group get-price">
                                                    <div class="input-wrap">
                                                        <input id="availability-{{$lot->id}}-price" disabled class="form-control hidden" value="{{$lot->price}}">
                                                        <input id="availability-{{$lot->id}}-count" disabled class="form-control hidden" value="{{$lot->availability}}">
                                                    </div>
                                                    <div class="form-group__ttl">Количество</div>
                                                    <div class="input-wrap">
                                                        <input id="availability-{{$lot->id}}" type="text" name="availability"
                                                               placeholder="Название"
                                                               required="required"
                                                               class="form-control"/>
                                                    </div>
                                                    <div class="form-group__ttl">Заплочу</div>
                                                    <div class="input-wrap">
                                                        <input name="total-price" id="availability-{{$lot->id}}-total" disabled class="form-control" value="">
                                                    </div>
                                                </div>
                                            @endif
                                            <div class="form-group">
                                                <div class="form-group__ttl">Имя персонажа</div>
                                                <div class="input-wrap">
                                                    <input type="text" name="character_name"
                                                           placeholder="Название" value=""
                                                           required="required"
                                                           class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="c-games-chat__item-order-footer">
                                            @if(Auth::guest() || Auth::user()->confirmed_rules == 0 || Auth::user()->confirmed === 0)
                                                <div class="btn btn_blue btn_upper disabled">
                                                    купить
                                                </div>
                                            @else
                                                <button type="submit" class="btn btn_blue btn_upper create-trade-proposition">
                                                    купить
                                                </button>
                                            @endif
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-sm-12 col-xs-24">
                                <div class="c-games-chat__item-tabs">
                                    <div class="c-games-chat__item-tabs-saler"><span
                                                class="c-games-chat__item-tabs-saler-name">Sines</span><span
                                                class="c-chat__online">online</span><a href="#"
                                                                                       class="l-chat-block__msg"><i
                                                    class="ico ico-envelope"></i><span>1 новое сообщение</span></a>
                                    </div>
                                    <div role="tablist"
                                         class="c-tab-nav c-games-chat__item-tabs-nav xs-full xx-full">
                                        <button type="button" class="c-tab-nav__trig visible-xs"><span>Чат с продавцом</span>
                                        </button>
                                        <ul class="c-tab-nav__drop h-list minimized">
                                            <li role="presentation" class="active"><a
                                                        href="#saler-chat-1"
                                                        aria-controls="saler-chat-1-0"
                                                        role="tab"
                                                        data-toggle="tab"><span>Чат с продавцом</span></a>
                                            </li>
                                            <li role="presentation"><a href="#saler-feedbacks-1-0"
                                                                       aria-controls="saler-feedbacks-1-0"
                                                                       role="tab"
                                                                       data-toggle="tab"><span>Отзывы о продавце</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab-content">
                                        <div role="tabpanel" id="saler-chat-1"
                                             class="tab-pane fade active in">
                                            <div class="saler-chat" id="chat-box-1">
                                                <div class="saler-chat__list  chat-body-1">
                                                    <div class="chat-container-1">
                                                        <div class="chat-content">
                                                            <input type="hidden" name="chat_buddy_id-1" id="chat_buddy_id-1"/>
                                                            <div class="chat_body__massage custom_scrollbar chat-box-body-{{$lot->id}}">
                                                                <div>Выберите собеседника</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="saler-chat__form">
                                                    <form class="js-form_check">
                                                        <div class="form-group">
                                                            <div class="input-wrap chat-textarea-1">
                                                                <textarea placeholder="Введите сообщение" required="required" class="form-control no-resize"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="saler-feedbacks__form-footer">
                                                            <button type="button" class="btn btn_blue btn_upper js-send-msg-1">Отправить</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div role="tabpanel" id="saler-feedbacks-1-0"
                                             class="tab-pane fade">
                                            <div class="saler-feedbacks">
                                                <div class="saler-feedbacks__list js-custom-scroll">
                                                    <div class="saler-feedbacks__item">
                                                        <div class="saler-feedbacks__item-avatar feedback__bad">
                                                            <div class="saler-feedbacks__item-avatar-ico"></div>
                                                        </div>
                                                        <div class="saler-feedbacks__item-info">
                                                            <div class="saler-feedbacks__item-ttl">
                                                                <span>в этом месяце, EVE , 500 &#8381;</span>
                                                            </div>
                                                            <div class="saler-feedbacks__item-txt">
                                                                <span>В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя для распечатки образцов.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="saler-feedbacks__item">
                                                        <div class="saler-feedbacks__item-avatar feedback__good">
                                                            <div class="saler-feedbacks__item-avatar-ico"></div>
                                                        </div>
                                                        <div class="saler-feedbacks__item-info">
                                                            <div class="saler-feedbacks__item-ttl">
                                                                <span>4 месяца назад, Lineage 2 (Free), 70 &#8381;</span>
                                                            </div>
                                                            <div class="saler-feedbacks__item-txt">
                                                                <span>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="saler-feedbacks__item">
                                                        <div class="saler-feedbacks__item-avatar">
                                                        </div>
                                                        <div class="saler-feedbacks__item-info">
                                                            <div class="saler-feedbacks__item-ttl">
                                                                <span>4 месяца назад, Lineage 2 (Free), 70 &#8381;</span>
                                                            </div>
                                                            <div class="saler-feedbacks__item-txt">
                                                                <span>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="saler-feedbacks__item">
                                                        <div class="saler-feedbacks__item-avatar feedback__bad">
                                                            <div class="h-object-fit"><img
                                                                        src="/default-avatar.svg"
                                                                        alt=""/></div>
                                                            <div class="saler-feedbacks__item-avatar-ico"></div>
                                                        </div>
                                                        <div class="saler-feedbacks__item-info">
                                                            <div class="saler-feedbacks__item-ttl">
                                                                <span>в этом месяце, EVE , 500 &#8381;</span>
                                                            </div>
                                                            <div class="saler-feedbacks__item-txt">
                                                                <span>В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя для распечатки образцов.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="saler-feedbacks__item">
                                                        <div class="saler-feedbacks__item-avatar feedback__good">
                                                            <div class="h-object-fit"><img
                                                                        src="/default-avatar.svg"
                                                                        alt=""/></div>
                                                            <div class="saler-feedbacks__item-avatar-ico"></div>
                                                        </div>
                                                        <div class="saler-feedbacks__item-info">
                                                            <div class="saler-feedbacks__item-ttl">
                                                                <span>4 месяца назад, Lineage 2 (Free), 70 &#8381;</span>
                                                            </div>
                                                            <div class="saler-feedbacks__item-txt">
                                                                <span>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="saler-feedbacks__item">
                                                        <div class="saler-feedbacks__item-avatar">
                                                            <div class="h-object-fit"><img
                                                                        src="/default-avatar.svg"
                                                                        alt=""/></div>
                                                        </div>
                                                        <div class="saler-feedbacks__item-info">
                                                            <div class="saler-feedbacks__item-ttl">
                                                                <span>4 месяца назад, Lineage 2 (Free), 70 &#8381;</span>
                                                            </div>
                                                            <div class="saler-feedbacks__item-txt">
                                                                <span>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться.</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="saler-feedbacks__form">
                                                    <form class="js-form_check">
                                                        <div class="form-group">
                                                            <div class="input-wrap">
                                                                            <textarea placeholder="Написать отзыв"
                                                                                      required="required"
                                                                                      class="form-control no-resize"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="saler-feedbacks__form-radios">
                                                            <div class="form-group">
                                                                <label class="radio-label label_good">
                                                                    <input type="radio"
                                                                           name="good_bad-1-0"
                                                                           checked="checked"
                                                                           value="Позитивный"
                                                                           class="hidden-input"/><span
                                                                            class="check-icon"></span><span
                                                                            class="check-value">Позитивный</span>
                                                                </label>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="radio-label label_bad">
                                                                    <input type="radio"
                                                                           name="good_bad-1-0"
                                                                           value="Негативный"
                                                                           class="hidden-input"/><span
                                                                            class="check-icon"></span><span
                                                                            class="check-value">Негативный</span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="saler-feedbacks__form-footer">
                                                            <button
                                                                    class="btn btn_blue btn_upper">
                                                                Отправить
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
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