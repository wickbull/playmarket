@foreach($game->currency as $currency)
    <div role="tabpanel" id="game-chat-{{$currency->name}}" class="tab-pane fade active in">
        <div class="c-games-chat__adena">
            <div class="c-games-chat__buttons">
                <div class="row">
                    @if(Auth::guest() || Auth::user()->confirmed_rules == 0 || Auth::user()->confirmed === 0)
                        <div class="col-xs-24">
                            <a href="#" type="button"
                               class="btn btn_blue-white btn_upper btn_auto-height c-games-chat__btn-abs">
                                Продать игровую валюту
                            </a>
                        </div>
                    @else
                        <div class="col-xs-24">
                            <a href="{{ URL::to('/game/'.$game['id'].'/sell-service/'.$currency->name.'-'.$currency->id) }}"
                               type="button"
                               class="btn btn_blue-white btn_upper btn_auto-height c-games-chat__btn-abs">
                                Продать игровую валюту
                            </a>
                        </div>
                    @endif
                </div>
            </div>
            <div class="row">
                <div class="col-sm-14 col-xs-24 col-md-6_10 col-lg-12">
                    <div class="c-games-chat__adena-left">
                        <div class="c-games-chat__adena-filter">
                            <div class="row">
                                <div class="col-md-16 col-sm-13 col-xs-14 col-xx-24">
                                    <div class="form-group">
                                        <div class="form-group__ttl"><b>{{ $game->name }}</b> - Сервер:</div>
                                        <div class="select-wrap">
                                            <select id="server-search" title="Выбрать" name="server"
                                                    class="selectpicker">
                                                <option value="">Выбрать</option>
                                                @foreach($game->servers as $server)
                                                    <option value="{{$server->id}}">{{$server->name}}{{isset($server->side)?'('.$server->side.')':''}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    @if($game->subtags->isNotEmpty())
                                        @foreach($game->subtags as $subtag)
                                            @if($subtag->attach === 1)
                                                <div class="form-group">
                                                    <div class="form-group__ttl">{{$subtag->name}}</div>
                                                    <div class="select-wrap">
                                                        <select title="Выбрать" name="side" class="selectpicker">
                                                            @foreach($subtag->subTagMetadata as $metadata)
                                                                <option value="{{$metadata->id}}">{{$metadata->name}}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                            @endif
                                        @endforeach
                                    @endif
                                </div>
                                <div class="col-md-8 col-sm-11 col-xs-10 col-xx-24">
                                    <div class="form-group dib">
                                        <label class="checkbox-label">
                                            <input id="salers" type="checkbox" name="salers"
                                                   value="1"
                                                   class="hidden-input"/><span class="check-icon"></span><span
                                                    class="check-value">Продавцы</span>
                                        </label>
                                    </div>
                                    <span class="c-chat__online">online</span>
                                </div>
                            </div>
                        </div>
                        <div class="c-games-chat__adena-list-wrap">
                            <div class="c-games-chat__adena-list-ttl">
                                <div class="t-c c-games-chat__adena-list-saler"><span>Продавец</span></div>
                                {{--<div class="t-c c-games-chat__adena-list-side text-center"><span>Cторона</span></div>--}}
                                <div class="t-c c-games-chat__adena-list-stock text-center"><span>Наличие</span></div>
                                <div class="t-c c-games-chat__adena-list-price text-center">
                                    <span>Цена за {{$currency->unity}}</span>
                                </div>
                            </div>
                            <div class="c-games-chat__adena-list js-custom-scroll" id="server-adena-list">
                                {{--@foreach($users as $user)--}}
                                {{--<div class="c-games-chat__adena-item has-deal" id="chat_user_{{$user -> id}}">--}}
                                {{--<div data-th="Продавец" class="t-c c-games-chat__adena-list-saler">--}}
                                {{--<div class="c-chat__avatar"><a href="#" class="h-object-fit"><img src="s/images/tmp_file/avatars/avatar-07.jpg" alt=""/></a>--}}
                                {{--</div>--}}
                                {{--<div class="c-games-chat__adena-item-info">--}}
                                {{--<div class="c-games-chat__adena-item-top">
																	<a href="#" class="c-chat__name">Goofis</a><span class="c-chat__online">online</span>--}}
                                {{--</div>--}}
                                {{--<div class="c-games-chat__adena-item-bottom">--}}
                                {{--<div class="c-games-chat__adena-item-i"><span>на сайте 7 месяцев, 13 отзывов</span></div>--}}
                                {{--</div>--}}
                                {{--</div>--}}
                                {{--</div>--}}
                                {{--<div data-th="Cторона" class="t-c c-games-chat__adena-list-side text-center"><span>Лорем</span></div>--}}
                                {{--<div data-th="Наличие" class="t-c c-games-chat__adena-list-stock text-center"><span>900 кк</span></div>--}}
                                {{--<div data-th="Цена за 1 кк" class="t-c c-games-chat__adena-list-price text-center"><span>65.49</span>--}}
                                {{--&#8381;--}}
                                {{--</div>--}}
                                {{--</div>--}}
                                {{--@endforeach--}}
                                @if($currency->lots->isNotEmpty())
                                    @foreach($currency->lots as $lot)
                                        @if($lot->game_id == $game['id'] && $lot->active == 1)
                                            @include('game.parts.chat-list')
                                        @endif
                                    @endforeach
                                @endif
                            </div>
                            <div class="c-games-chat__adena-list js-custom-scroll" id="adena-list"
                                 style="display: none;">
                            </div>
                        </div>
                    </div>
                    <div class="c-games-chat__adena-form">
                        {{--<form class="js-form_check" id="lot-form" >--}}

                        {{--</form>--}}
                        <form class="js-form_check" id="lot-form">

                        </form>

                    </div>
                </div>
                <div class="col-sm-10 col-xs-24 col-md-4_10 col-lg-12">
                    <div class="c-games-chat__item-tabs ">
                        <div class="c-games-chat__item-tabs-saler"><span
                                    class="c-games-chat__item-tabs-saler-name">Пользователь</span><span
                                    class="c-chat__online">online</span>
                            {{--<a href="#"--}}
                            {{--class="l-chat-block__msg"><i--}}
                            {{--class="ico ico-envelope"></i><span>1 новое сообщение</span></a>--}}
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
                                <div class="saler-chat" id="chat-box">
                                    <div class="saler-chat__list  chat-body">
                                        <div class="chat-container">
                                            <div class="chat-content">
                                                <input type="hidden" name="chat_buddy_id" id="chat_buddy_id"/>
                                                <div class="chat_body__massage custom_scrollbar chat-box-body">
                                                    <div>Выберите собеседника</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="saler-chat__form">
                                        <form class="js-form_check">
                                            <div class="form-group">
                                                <div class="input-wrap chat-textarea">
                                                    <textarea placeholder="Введите сообщение" required="required"
                                                              class="form-control no-resize"></textarea>
                                                </div>
                                            </div>
                                            <div class="saler-feedbacks__form-footer">
                                                <button type="button"
                                                        class="btn btn_blue btn_upper @if(Auth::user() && Auth::user()->id ) js-send-msg @endif">
                                                    Отправить
                                                </button>
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
@endforeach

@section('scripts')

    <script>
        $('#server-search,#salers').change(function () {
            var value = $('#server-search').val();
            var status = $('#salers').is(":checked");

            $.ajax({
                type: 'GET',
                url: '/search-server',
                data: {
                    'server_id': value,
                    'currency_id': '{{$currency->id or ''}}',
                    'is_online': status
                },
                success: function (data) {
                    console.log(data);
                    $('#server-adena-list').html(data);
                }
            });
        });
    </script>
    @parent
    <script>
        //        $('#salers').change(function () {
        //            var online = $(this).prop('checked');
        //            var value = $(this).val();
        //            var server_id = value.slice(-1);
        //            var currency_id = value.charAt(0);
        //            console.log(value);
        //            if (value.length > 0) {
        //                $.ajax({
        //                    type: 'GET',
        //                    url: '/search-server',
        //                    data: {
        //                        'server_id': server_id,
        //                        'currency_id': currency_id,
        //                        'online': online
        //                    },
        //                    success: function (data) {
        //
        //                        $('#lot-form').html('');
        //                        $('#server-adena-list').hide();
        //                        $('#adena-list').show();
        //                        $('#adena-list .c-games-chat__adena-item').remove();
        //                        var main_div = document.getElementById("adena-list");
        //
        //                        var list_item;
        //                        var list_saler;
        //                        var chat_avatar;
        //                        var item_info;
        //                        var item_top;
        //                        var item_bottom;
        //                        var item_i;
        //                        var list_stock;
        //                        var list_price;
        //
        //                        data.forEach(function (item) {
        //
        //                            if (item.user.created_at) {
        //                                var date = new Date(item.user.created_at);
        //                                var year = date.getFullYear();
        //                                var mounth = date.getMonth();
        //                                var day = date.getDate();
        //                            }
        //
        //                            list_item = document.createElement('div');
        //                            list_saler = document.createElement('div');
        //                            chat_avatar = document.createElement('div');
        //                            item_info = document.createElement('div');
        //                            item_top = document.createElement('div');
        //                            item_bottom = document.createElement('div');
        //                            item_i = document.createElement('div');
        //                            list_stock = document.createElement('div');
        //                            list_price = document.createElement('div');
        //
        //                            list_item.classList.add('c-games-chat__adena-item');
        //                            list_saler.classList.add('c-games-chat__adena-list-saler');
        //                            list_saler.classList.add('t-c');
        //                            chat_avatar.classList.add('c-chat__avatar');
        //                            item_info.classList.add('c-games-chat__adena-item-info');
        //                            item_top.classList.add('c-games-chat__adena-item-top');
        //                            item_bottom.classList.add('c-games-chat__adena-item-bottom');
        //                            item_i.classList.add('c-games-chat__adena-item-i');
        //                            list_stock.classList.add('c-games-chat__adena-list-stock');
        //                            list_stock.classList.add('t-c');
        //                            list_stock.classList.add('text-center');
        //                            list_price.classList.add('c-games-chat__adena-list-price');
        //                            list_price.classList.add('t-c');
        //                            list_price.classList.add('text-center');
        //
        //                            $(list_price).attr('data-id', item.id + '-currency-price');
        //                            $(list_item).attr('data-id', item.id);
        //
        //                            console.log($(list_price).attr('data-id'));
        //
        //                            // list_group.append(list_group_list);
        //                            $('<a href="#" class="h-object-fit"><img src="' + item.user.avatar + '" alt=""/></a>').appendTo(chat_avatar);
        //                            $('<a href="/user-profile/' + item.user.id + '" class="c-chat__name">' + item.user.name + '</a>').appendTo(item_top);
        //                            $('<span>на сайте с ' + day + '/' + mounth + '/' + year + ', 13 отзывов</span>').appendTo(item_i);
        //                            $('<span>' + item.availability + '</span>').appendTo(list_stock);
        //                            $('<span>' + item.price + '</span>').appendTo(list_price);
        //
        //                            // $('.c-games-chat__adena-list-price').attr('id', item.id+'-currency-price');
        //                            item_bottom.append(item_i);
        //
        //                            item_info.append(item_top);
        //                            item_info.append(item_bottom);
        //                            list_saler.append(chat_avatar);
        //                            list_saler.append(item_info);
        //
        //                            list_item.append(list_saler);
        //                            list_item.append(list_stock);
        //                            list_item.append(list_price);
        //
        //                            main_div.append(list_item);
        //                            $(main_div).appendTo('#adena-list .c-games-chat__adena-list');
        //
        //                            $("#adena-list .c-games-chat__adena-item").click(function (e) {
        //                                var id = $(this).attr("data-id");
        //                                // console.log($(this).attr("data-id"));
        //                                if (id.length > 0) {
        //                                    $("#lot-form").attr("action", "/create-trade/" + id);
        //                                    $("#lot-form").attr("method", "post");
        ////                console.log(id);
        //                                    e.preventDefault();
        //                                    $.ajax({
        //                                        type: "get",
        //                                        url: "/get-lot-form/" + id,
        //                                        data: {},
        //                                        success: function (data) {
        //                                            $("#lot-form").html(data);
        //                                            $('.selectpicker').selectpicker('refresh');
        ////                        $("#lot-chat").html(data);
        //                                        },
        //                                        error: function (result) {
        //                                            //                alert('error');
        //                                        }
        //                                    });
        //                                    $.ajax({
        //                                        type: "get",
        //                                        url: "/get-lot-chat/" + id,
        //                                        data: {},
        //                                        success: function (data) {
        ////                        $("#lot-form").html(data);
        ////                        $("#lot-chat").html(data);
        //                                        },
        //                                        error: function (result) {
        //                                            //                alert('error');
        //                                        }
        //                                    });
        //                                }
        //                            });
        //                        })
        //                    }
        //                });
        //            } else {
        //                $('#server-adena-list').show();
        //                $('#adena-list').hide();
        //                $('#lot-form').html('');
        //            }
        //
        //
        //        });
    </script>

@endsection


<div id="modal-sell-services" tabindex="-1" role="dialog" class="modal-sell-services modal fade modal_centered">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                <h3 class="modal-title">Продать игровую валюту</h3>
            </div>
            <div class="modal-body">
                <form class="js-form_check">
                    <div class="row">
                        <div class="col-sm-12 col-xs-24">
                            <div class="form-group">
                                <div class="form-group__ttl">Минимальная сумма заказа</div>
                                <div class="input-wrap">
                                    <input type="text" name="min_order_price" value="100.00" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="c-sell-services__table">
                        <thead>
                        <tr>
                            <th>Сервер</th>
                            <th class="text-center">Цена за 1 кк</th>
                            <th class="text-center">Наличие</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($game->servers as $server)
                            <tr class="c-sell-services__item">
                                <td data-th="Сервер" class="c-sell-services__item-server">
                                    <div class="form-group">
                                        <label class="checkbox-label">
                                            <input type="checkbox" name="sell-services__item-server-0"
                                                   value="server_{{ $server->id }}" class="hidden-input"/><span
                                                    class="check-icon"></span><span
                                                    class="check-value">{{ $server->name }}{{isset($server->side)?'('.$server->side.')':''}}</span>
                                        </label>
                                    </div>
                                </td>
                                <td data-th="Цена за 1 кк" class="c-sell-services__item-price text-center">
                                    <div class="form-group">
                                        <div class="input-wrap">
                                            <input type="text" name="sell-services__item-price-0" placeholder="00.00 ₽"
                                                   value="" class="form-control"/>
                                        </div>
                                    </div>
                                    <button type="button" data-toggle="modal" class="btn-info"><i
                                                class="ico ico-info"></i><i class="ico ico-info-hover"></i></button>
                                </td>
                                <td data-th="Наличие" class="c-sell-services__item-stock text-center">
                                    <div class="form-group">
                                        <div class="input-wrap">
                                            <input type="text" name="sell-services__item-stock-0" placeholder="00.00 KK"
                                                   value="" class="form-control"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    <div class="form-footer">
                        <button type="submit" class="btn btn_blue btn_upper">сохранить</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


