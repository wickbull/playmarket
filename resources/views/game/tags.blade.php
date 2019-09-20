@foreach($game->tags as $tag)
    <div role="tabpanel" id="game-chat-{{$tag->name}}"
         class="tab-pane fade @if($game->currency->isEmpty() && $loop->first) active in @endif">
        <div class="c-games-chat__items">
            <div class="c-games-chat__buttons">
                <div class="row">
                    @if(Auth::guest() || Auth::user()->confirmed_rules == 0 || Auth::user()->confirmed === 0)
                        <div class="col-xs-14 col-xx-24">
                            <button type="button"
                                    class="btn btn_blue-white btn_upper btn_auto-height c-games-chat__btn-abs">
                                Продать
                                {{ $tag->name}}
                            </button>
                        </div>
                    @else
                        <div class="col-xs-14 col-xx-24">
                            <button data-toggle="modal" data-target="#modal-add-proposition-{{ $tag->id }}"
                                    type="button"
                                    class="btn btn_blue-white btn_upper btn_auto-height c-games-chat__btn-abs">
                                Продать
                                {{ $tag->name}}
                            </button>
                        </div>
                    @endif
                    <div class="col-xs-10 col-xx-24">
                        <button type="button" data-target-block=".c-games-chat__items-filter"
                                data-show-text="Показать фильтр" data-hide-text="Скрыть фильтр"
                                class="c-games-chat__items-filter-trig btn btn_blue btn_auto-height button-toggle visible-xs"></button>
                    </div>
                </div>
            </div>
            <div class="c-games-chat__items-filter minimized">
                <form class="filter" id="{{$tag->id}}">
                    <div class="row">
                        @if($game->servers->isNotEmpty())
                            <div class="col-lg-6 col-md-3_10 col-sm-12 col-xs-12 col-xx-24">
                                <div class="form-group">
                                    <div class="form-group__ttl">Сервер</div>
                                    <div class="select-wrap">
                                        <select id="server-{{$tag->id}}" title="Выбрать" name="server" class="selectpicker">
                                            <option value="{{$tag->id}}">Выбрать</option>
                                            @foreach($game->servers as $server)
                                                <option value="{{$tag->id . '-' .$server->id}}">{{$server->name}}{{isset($server->side)?'('.$server->side.')':''}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                        @endif
                        @if($game->subtags->isNotEmpty())
                            @foreach($game->subtags as $subtag)
                                @if($subtag->getOriginal()['pivot_tag_id'] == $tag->id && $subtag->subTagMetadata->isNotEmpty())
                                    <div class="col-lg-6 col-md-3_10 col-sm-12 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">{{$subtag->name}}</div>
                                            <div class="select-wrap">
                                                <select title="Выбрать" name="side" class="selectpicker">
                                                    <option value="{{$tag->id}}">Выбрать</option>
                                                    @foreach($subtag->subTagMetadata as $metadata)
                                                        <option value="{{$tag->id . '-' .$subtag->id .'-' .$metadata->id}}">{{$metadata->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            @endforeach
                        @endif
                    </div>

                </form>
            </div>
            <div class="c-games-chat__item-header-top hidden-xs">
                <div class="t-c">Продавец</div>
                <div class="t-c">Описание</div>
                {{--<div class="t-c text-center">Сторона</div>--}}
                @if($tag->price_per_unit != 0)
                    <div class="t-c text-center">Наличие</div>
                @endif
                <div class="t-c text-center">Цена</div>
            </div>
            <div class="c-games-chat__items-list collapse-group items-list-{{$tag->id}} ">
                @if($tag->lots->isNotEmpty())
                    @include('game.parts.lot-block', [
                        'lots' => $tag->lots
                    ])
                @endif
            </div>
        </div>
    </div>

    <div id="modal-add-proposition-{{ $tag->id }}" tabindex="-1" role="dialog"
         class="modal-add-proposition modal fade modal_centered">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                    <h3 class="modal-title">Добавление предложения</h3>
                </div>
                <div class="modal-body">
                    <form class="js-form_check" method="POST"
                          action="{{ URL::to('/game/'.$game['id'].'/sell-proposition/'.$tag->id) }}">
                        {{ csrf_field() }}
                        <div class="row">
                            @if($game->servers->isNotEmpty())
                                <div class="col-xs-12 col-xx-24">
                                    <div class="form-group{{ $errors->has('server_id') ? ' has-error' : '' }}">
                                        <div class="form-group__ttl">Сервер</div>
                                        <div class="select-wrap">
                                            <select title="Выбрать" name="server_id" class="selectpicker">
                                                <option></option>
                                                @foreach($game->servers as $server)
                                                    <option value="{{$server->id}}">{{$server->name}}{{isset($server->side)?'('.$server->side.')':''}}</option>
                                                @endforeach
                                            </select>
                                            @if ($errors->has('server_id'))
                                                <span class="help-block">
                                                    <strong>{{ $errors->first('server_id') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            @endif
                            @foreach($game->subtags as $subtag)
                                @if($subtag->getOriginal()['pivot_tag_id'] === $tag->id)
                                    <div class="col-xs-12 col-xx-24">
                                        <div class="form-group{{ $errors->has('subtags') ? ' has-error' : '' }}">
                                            @if($subtag->subTagMetadata->isNotEmpty())
                                                <div class="form-group__ttl">{{ $subtag->name }}</div>
                                                <div class="select-wrap">
                                                    <select title="Выбрать" name="subtags[{{ $subtag->id }}]"
                                                            class="selectpicker">
                                                        <option></option>
                                                        @foreach($subtag->subTagMetadata as $metadata)
                                                            <option value="{{$metadata->name}}">{{$metadata->name}}</option>
                                                        @endforeach
                                                    </select>
                                                    @if ($errors->has('subtags'))
                                                        <span class="help-block">
                                                            <strong>{{ $errors->first('subtags') }}</strong>
                                                        </span>
                                                    @endif
                                                </div>
                                            @else
                                                <div class="form-group__ttl">{{ $subtag->name }}</div>
                                                <div class="input-wrap">
                                                    <input type="text" name="subtags[{{ $subtag->id }}]"
                                                           placeholder="Название" value=""
                                                           required="required"
                                                           class="form-control"/>
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                @endif
                            @endforeach
                            <div class="col-xs-12 col-xx-24">
                                <div class="form-group">
                                    <div class="form-group__ttl">Цена</div>
                                    <div class="input-wrap">
                                        <input type="number" name="price" placeholder="00.00 ₽" value=""
                                               required="required"
                                               class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            @if($tag->price_per_unit != 0)
                                <div class="col-xs-12 col-xx-24">
                                    <div class="form-group">
                                        <div class="form-group__ttl">Наличие</div>
                                        <div class="input-wrap">
                                            <input type="number" name="availability" placeholder="0" value=""
                                                   required="required"
                                                   class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="col-xs-24">
                                <div class="form-group{{ $errors->has('description') ? ' has-error' : '' }}">
                                    <div class="form-group__ttl">Описание</div>
                                    <div class="input-wrap">
                                        <textarea name="description" required="required"
                                                  class="form-control"></textarea>
                                        @if ($errors->has('description'))
                                            <span class="help-block">
                                                <strong>{{ $errors->first('description') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-24">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        <input type="checkbox" name="active" required="required" checked="checked"
                                               value="1" class="hidden-input"/><span
                                                class="check-icon"></span><span
                                                class="check-value">Активное</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-footer text-center">
                            <button type="submit" class="btn btn_blue btn_upper">сохранить</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endforeach

@section('scripts')
    @parent
    <script>
        $(document).ready(function () {

            $(".get-price").on('click', 'input', function (e) {
                var idDiv = e.target.id;
                $('#' + idDiv + '').keyup(function (event) {
                    var a = parseInt(this.value);
                    var price = $('#' + idDiv + '-price').val();
                    var count = $('#' + idDiv + '-count').val();
                    console.log(count);
                    if (a <= count) {
                        $('#' + idDiv + '-total').val(a * price);
                        $('.create-trade-proposition').removeAttr('disabled');
                    } else {
                        $('#' + idDiv + '-total').val('Не верное количество');
                        $('.create-trade-proposition').attr('disabled', 'disabled');
                    }
                });
            });

            bindPriceInput();
            bindTotalPriceInput();
        });

        function bindPriceInput() {
            $('body').on('click', '#currency-price', function (event) {
                var idDiv = event.target.id;
//                console.log(event.target);

                $('#' + idDiv + '').keyup(function (event) {
                    var price = $('#hidden-currency-price').val();
                    var order = $('#hidden-min-order').val();
                    var currency = $('#hidden-availability-currency').val();

                    var a = parseInt(this.value);
                    console.log(a);
//                    var price = $('#'+idDiv+'-price').val();
//                    var count = $('#'+idDiv+'-count').val();
//                    console.log(count);
                    if (a <= price) {
                        $('#currency-total-price').val(a / price + 'kk');
//                        $('.create-trade-proposition').removeAttr('disabled');
                    } else {
//                        $('#currency-total-price').val('Не верное количество');
//                        $('.create-trade-proposition').attr('disabled','disabled');
                    }
                });
            });
        }

        function bindTotalPriceInput() {
            $('body').on('click', '#currency-total-price', function (event) {
                var idDiv = event.target.id;
                $('#' + idDiv + '').keyup(function (event) {
                    var currency = $('#hidden-availability-currency').val();
                    var a = parseInt(this.value);
//                    var price = $('#'+idDiv+'-price').val();
//                    var count = $('#'+idDiv+'-count').val();
//                    console.log(count);
                    if (a <= currency) {
                        $('#currency-price').val(a / currency);
                        $('.create-trade-proposition').removeAttr('disabled');
                    } else {
                        $('#currency-price').val('Не верное количество');
                        $('.create-trade-proposition').attr('disabled', 'disabled');
                    }
                });
            });
        }


    </script>
    {{--<script src="{{ asset('js/lot-chat.js') }}"></script>--}}
@endsection

