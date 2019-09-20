@extends('layouts.app')

@section('content')

    <main>
        <div class="c-sell-services">
            <div class="container">
                <form role="form" method="POST"
                      action="{{ route('game-sell-service',['id' => $game->id, 'slug' => $currency->name,'currency_id' =>  $currency->id])}}">
                    {{ csrf_field() }}
                    <div class="c-sell-services__header">
                        <div class="row">
                            <div class="col-lg-6 col-md-8 col-sm-10 col-xs-24">
                                <div class="form-group">
                                    <div class="form-group__ttl">@lang(session("langId"), 'game', 'min_sum', 43200)</div>
                                    <div class="input-wrap">
                                        <input type="text" name="min_order_price"
                                               value="@if(!empty($lots) && isset($lots->first()->min_order)){{number_format($lots->first()->min_order, 2, '.', ' ')}} @else 100.00 @endif"
                                               class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-16 col-sm-14 col-xs-24">
                                <div class="c-sell-services__descr">
                                    <p>
                                        @lang(session("langId"), 'game', 'by_game_currency', 43200)
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="c-sell-services__body">
                        <div class="row">
                            <div class="col-lg-18 col-md-20 col-xs-24">
                                <table class="c-sell-services__table">
                                    <thead>
                                    <tr>
                                        <th>@lang(session("langId"), 'game', 'server', 43200)</th>
                                        {{--@if(count($game->sides))--}}
                                            {{--<th>Сторона</th>--}}
                                        {{--@endif--}}
                                        @if($game->subtags->isNotEmpty())
                                            @foreach($game->subtags as $subtag)
                                                @if($subtag->attach === 1)
                                                    <th class="text-center">{{ $subtag->name }}</th>
                                                @endif
                                            @endforeach
                                        @endif
                                        <th class="text-center">@lang(session("langId"), 'game', 'price_by', 43200) {{ $currency->unity }}</th>
                                        <th class="text-center">@lang(session("langId"), 'game', 'availability', 43200)</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($game->servers as $server)
                                        <tr class="c-sell-services__item">
                                            <td data-th="@lang(session("langId"), 'game', 'server', 43200)" class="c-sell-services__item-server">
                                                <div class="form-group">
                                                    <label class="checkbox-label">
                                                        <input type="checkbox"
                                                               @if(!empty($lots->where('server_id',$server->id)->first()) && $lots->where('server_id',$server->id)->first()->active == '1') checked
                                                               @endif
                                                               name="servers[{{$server->id}}][server-id]"
                                                               value="{{ $server->id }}"
                                                               class="hidden-input"/><span
                                                                class="check-icon"></span><span
                                                                class="check-value">{{ $server->name }} {{isset($server->side)?'('.$server->side.')':''}}</span>
                                                    </label>
                                                </div>
                                            </td>
                                            {{--@if(count($game->sides))--}}
                                                {{--<td>--}}
                                                    {{--<div class="form-group">--}}
                                                        {{--<div class="select-wrap">--}}
                                                            {{--<select title="Выбрать"--}}
                                                                    {{--name="servers[{{$server->id}}][side_id]"--}}
                                                                    {{--class="selectpicker">--}}
                                                                {{--<option value=""></option>--}}
                                                                {{--@foreach($game->sides as $side)--}}
                                                                    {{--<option @if(!empty($lots->where('server_id',$server->id)->first()) && $lots->where('server_id',$server->id)->first()->side_id == $side->id) selected="selected"--}}
                                                                            {{--@endif value="{{$side->id}}">{{ $side->title }}</option>--}}
                                                                {{--@endforeach--}}
                                                            {{--</select>--}}
                                                        {{--</div>--}}
                                                    {{--</div>--}}
                                                {{--</td>--}}
                                            {{--@endif--}}
                                            @if($game->subtags->isNotEmpty())
                                                @foreach($game->subtags as $subtag)
                                                    @if($subtag->attach === 1)
                                                        <td data-th="{{ $subtag->name }}"
                                                            class="c-sell-services__item-side text-center">
                                                            <div class="form-group">
                                                                <div class="select-wrap">
                                                                    <select title="@lang(session("langId"), 'game', 'select', 43200)" type="number"
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
                                            <td data-th="@lang(session("langId"), 'game', 'price_by', 43200) {{ $currency->unity }}"
                                                class="c-sell-services__item-price text-center">
                                                <div class="form-group">
                                                    <div class="input-wrap input-group">
                                                        <input id="server-price-{{$server->id}}" type="number" step=any
                                                               name="servers[{{ $server->id }}][price]"
                                                               @if($lots->where('server_id',$server->id)->count() && !empty($lots->where('server_id',$server->id)->first()->price)) value="{{floatval($lots->where('server_id',$server->id)->first()->price)}}"
                                                               @endif
                                                               {{--                                                               value="{{$lots->where('server_id',$server->id)->first()->price or ''}}"--}}
                                                               class="form-control"/>

                                                    </div>
                                                </div>
                                                <button type="button" data-toggle="modal" data-target="#modal-prices"
                                                        id="{{$server->id}}"
                                                        class="btn-info"><i class="ico ico-info"></i><i
                                                            class="ico ico-info-hover"></i></button>
                                            </td>
                                            <td data-th="Наличие" class="c-sell-services__item-stock text-center">
                                                <div class="form-group">
                                                    <div class="input-wrap input-group">
                                                        <input id="server-stock-{{$server->id}}" type="number"
                                                               name="servers[{{$server->id}}][stock]" form-footer
                                                               {{--placeholder="0 {{preg_replace('/[0-9]+/', '', $currency->unity)}}"--}}
                                                               @if($lots->where('server_id',$server->id)->count())
                                                               value="{{intval($lots->where('server_id',$server->id)->first()->availability)}}"
                                                               @endif
                                                               class="form-control"/>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="c-sell-services__footer">
                        <button type="submit" class="btn btn_blue btn_upper">@lang(session("langId"), 'game', 'save', 43200)</button>
                    </div>
                </form>
            </div>
        </div>
    </main>

@endsection
@include('modals.modal-prices')

@section('scripts')
    <script>

        /*
         * Calculate price with percent
         */
        $(document).on('click', '.btn-info', function (e) {
            e.preventDefault();
            if (!$(this).hasClass('disabled-click')) {
                let id = $(this).attr('id');
                let price = $('#server-price-' + id).val();
                let arr = $('.price-calculate');
                arr.each(function (index, item) {
                    let content = $(this);
                    let value = (parseFloat(content.data('commission')) * price) + parseFloat(price * content.data('coefficient') / 100);
                    if (isNaN(value))
                        content.html('0 &#8381;');
                    else
                        content.find('.price-value').html(value.toFixed(2));
                });
                $('#modal-prices').modal('show');
            }

        });
    </script>
@endsection
