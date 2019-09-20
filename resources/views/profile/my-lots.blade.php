<div class="c-my-lots">
    <div class="c-my-sales__ttl">
        <h3 class="h3">@lang(session("langId"), 'head_menu', 'my_lots', 43200)</h3>
    </div>
    <div class="c-my-sales__filter">
        <form class="profile-lot-filter-form">
            <div class="row">
                <div class="col-lg-18 col-xs-24">
                    <div class="row">
                        {{--<div class="col-sm-8 col-xs-12 col-xx-24">--}}
                            {{--<div class="form-group">--}}
                                {{--<div class="form-group__ttl">Номер</div>--}}
                                {{--<div class="input-wrap">--}}
                                    {{--<input id="lot-number" type="number" name="my_sales_number" value=""--}}
                                           {{--class="form-control"/>--}}
                                {{--</div>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                        <div class="col-sm-8 col-xs-12 col-xx-24">
                            <div class="form-group">
                                <div class="form-group__ttl">@lang(session("langId"), 'my_lots', 'game', 43200)</div>
                                <div class="select-wrap">
                                    <select id="game" title="@lang(session("langId"), 'my_lots', 'choose', 43200)" name="game_id"
                                            class="selectpicker">
                                        <option value="">@lang(session("langId"), 'my_lots', 'choose', 43200)</option>
                                        @foreach($games as $game)
                                            <option value="{{$game['game']['id']}}">{{$game['game']['name']}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8 col-xs-12 col-xx-24">
                            <div class="form-group">
                                <div class="form-group__ttl">@lang(session("langId"), 'my_lots', 'server', 43200)</div>
                                <div class="select-wrap">
                                    <select id="server" title="@lang(session("langId"), 'my_lots', 'choose', 43200)" name="server_id"
                                            class="selectpicker">
                                        <option value="">@lang(session("langId"), 'my_lots', 'choose', 43200)</option>
                                        @foreach($servers as $server)
                                            <option value="{{$server['server']['id']}}">{{$server['server']['name']}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8 col-xs-12 col-xx-24">
                            <div class="form-group">
                                <div class="form-group__ttl">@lang(session("langId"), 'my_lots', 'section', 43200)</div>
                                <div class="select-wrap">
                                    <select id="tag" title="@lang(session("langId"), 'my_lots', 'choose', 43200)" name="tag_id"
                                            class="selectpicker">
                                        <option value="">@lang(session("langId"), 'my_lots', 'choose', 43200)</option>
                                        @foreach($tags as $tag)
                                            <option value="{{$tag['tag']['id']}}">{{$tag['tag']['name']}}</option>
                                        @endforeach
                                        <option value="currency">@lang(session("langId"), 'my_lots', 'currency', 43200)</option>

                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-8 col-xs-12 col-xx-24">
                            <div class="form-group">
                                <div class="form-group__ttl">@lang(session("langId"), 'my_lots', 'status', 43200)</div>
                                <div class="select-wrap">
                                    <select id="active" title="@lang(session("langId"), 'my_lots', 'choose', 43200)" name="status_id"
                                            class="selectpicker">
                                        <option value="">@lang(session("langId"), 'my_lots', 'choose', 43200)</option>
                                        <option value="1">@lang(session("langId"), 'my_lots', 'active', 43200)</option>
                                        <option value="0">@lang(session("langId"), 'my_lots', 'not_active', 43200)</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        {{--<div class="col-sm-8 col-xs-12 col-xx-24">--}}
                        {{--<div class="form-group">--}}
                        {{--<div class="form-group__ttl">Валюта</div>--}}
                        {{--<div class="select-wrap">--}}
                        {{--<select id="currency" title="Выбрать" name="my_sales_currency"--}}
                        {{--class="selectpicker">--}}
                        {{--<option value="">Выбрать</option>--}}
                        {{--@foreach($currencies as $currency)--}}
                        {{--<option value="{{$currency['currency']['id']}}">{{$currency['currency']['name']}}</option>--}}
                        {{--@endforeach--}}
                        {{--</select>--}}
                        {{--</div>--}}
                        {{--</div>--}}
                        {{--</div>--}}
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="c-my-sales__body">
        <table class="c-my-sales__table">
            <thead>
            <tr>
                <th>@lang(session("langId"), 'my_lots', 'lot', 43200)</th>
                <th>@lang(session("langId"), 'my_lots', 'gsp', 43200)</th>
                <th class="text-center">@lang(session("langId"), 'my_lots', 'status', 43200)</th>
                <th class="text-center">@lang(session("langId"), 'my_lots', 'price', 43200)</th>
                <th class="text-center">@lang(session("langId"), 'my_lots', 'amount', 43200)</th>
                <th></th>
            </tr>
            </thead>
            <tbody id="lots-block">
            @include('profile.parts.list-lots',['lots' => $user->lots])
            </tbody>
        </table>
    </div>
</div>
