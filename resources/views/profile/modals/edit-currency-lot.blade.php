<form class="js-form_check" id="modal-form" method="POST" action="{{route('edit-currency-sell-proposition', $lot->id)}}">
    {{ csrf_field() }}
    <div class="row">
        <div class="col-lg-24 col-md-24 col-xs-24">
            <table class="c-sell-services__table">
                <thead>
                <tr>
                    <th>@lang(session("langId"), 'modal', 'server', 43200)</th>
                    @if($game->subtags->isNotEmpty())
                        @foreach($game->subtags as $subtag)
                            @if($subtag->attach === 1)
                                <th class="text-center">{{ $subtag->name }}</th>
                            @endif
                        @endforeach
                    @endif
                    <th class="text-center">@lang(session("langId"), 'modal', 'price_for', 43200) {{ $currency->unity }}</th>
                    <th class="text-center">@lang(session("langId"), 'modal', 'availability', 43200)</th>
                </tr>
                </thead>
                <tbody>
                @foreach($game->servers as $server)
                    @if($lot->server_id == $server->id)
                    <tr class="c-sell-services__item">
                        <td data-th="{{lang(session("langId"), 'modal', 'server', 43200)}}" class="c-sell-services__item-server">
                            <div class="form-group">
                                <label class="checkbox-label">
                                    <input @if($lot->server_id == $server->id && $lot->active == 1) checked="checked" @endif type="checkbox" name="servers[{{$server->id}}][server-id]" value="{{ $server->id }}"
                                           class="hidden-input"/><span
                                            class="check-icon"></span>
                                    <span class="check-value">{{ $server->name }}</span>
                                </label>
                            </div>
                        </td>

                        @if($game->subtags->isNotEmpty())
                            @foreach($game->subtags as $subtag)
                                @if($subtag->attach === 1)
                                    <td data-th="{{ $subtag->name }}"
                                        class="c-sell-services__item-side text-center">
                                        <div class="form-group">
                                            <div class="select-wrap">
                                                <select title="{{lang(session("langId"), 'modal', 'choose', 43200)}}"
                                                        name="servers[{{$server->id}}][sub-tag-{{$subtag->id}}]"
                                                        class="selectpicker">
                                                    <option value=""></option>
                                                    @foreach($subtag->subTagMetadata as $metadata)
                                                        <option value="{{$metadata->id}}">{{ $metadata->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </td>
                                @endif
                            @endforeach
                        @endif
                        <td data-th="Цена за {{ $currency->unity }}"
                            class="c-sell-services__item-price text-center">
                            <div class="form-group">
                                <div class="input-wrap input-group">
                                    <input id="server-price-{{$server->id}}" type="number" step="any" name="servers[{{ $server->id }}][price]"
                                           {{--placeholder="00.00 ₽"--}}
                                           @if($lot->server_id == $server->id) value="{{floatval($lot->price)}}"
                                           @else value="" @endif class="form-control"/>
                                    <span class="input-group-addon">₽</span>
                                </div>
                            </div>
                            <button type="button" data-toggle="modal" data-target="#modal-prices"
                                    id="{{$server->id}}"
                                    class="btn-info"><i class="ico ico-info"></i><i
                                        class="ico ico-info-hover"></i></button>
                        </td>
                        <td data-th="{{lang(session("langId"), 'modal', 'availability', 43200)}}" class="c-sell-services__item-stock text-center">
                            <div class="form-group">
                                <div class="input-wrap input-group">
                                    <input id="server-stock-{{$server->id}}" type="number" name="servers[{{$server->id}}][stock]"
                                           {{--placeholder="0 {{preg_replace('/[0-9]+/', '', $currency->unity)}}"--}}
                                           @if($lot->server_id == $server->id) value="{{ intval($lot->availability) }}" @else value="" @endif class="form-control"/>
                                    <span class="input-group-addon">{{preg_replace('/[0-9]+/', '', $currency->unity)}}</span>

                                </div>
                            </div>
                        </td>
                    </tr>
                    @endif
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="form-footer text-center">
        <button type="submit" class="btn btn_blue btn_upper">@lang(session("langId"), 'modal', 'save', 43200)</button>
    </div>
</form>