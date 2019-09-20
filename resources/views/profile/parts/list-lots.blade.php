@foreach($lots as $lotIndex => $lot)
    @if(!$loop->first && (($lot->tag_id != $lots->get(--$lotIndex)->tag_id)))
        <tr class="c-my-sales__item">
            <td class="empty-row" colspan="6"></td>
        </tr>
    @endif
    <tr class="c-my-sales__item @if(intval($lot->active) == 1) opened @else closed @endif">
        <td data-th="Лот" class="c-my-sales__item-order">
            <div class="c-my-sales__item-number"><a href="#">{{ $lot->id }}</a></div>
            <div class="c-my-sales__item-date">
                <span>{{ localeDate($lot->created_at,'d M  H:i') }}</span></div>
        </td>
        <td data-th="Описание" class="c-my-sales__item-descr">
                    <span>
                        {{ $lot->game->name}}
                        {{ $lot->game->region}}@if(isset($lot->server)),
                        {{ $lot->server->name}},
                        @else,
                        @endif
                        @if(isset($lot->side))({{ $lot->side->title}})@endif
                        {{ isset($lot->tag->name) ?$lot->tag->name :$lot->currency->name}}
                        {{--                        {{ intval($lot->availability) . "," }}--}}
                    </span>
        </td>
        <td data-th="Статус" class="c-my-sales__item-status text-center"><span> @if($lot->active == 1)
                    @lang(session("langId"), 'my_lots', 'active', 43200) @else @lang(session("langId"), 'my_lots', 'not_active', 43200) @endif</span>
        </td>
        <td data-th="Сумма" class="c-my-sales__item-price-td text-center">
            <div class="c-my-sales__item-price"><span>
                                            {{ number_format($lot->price,2,'.',' ') }}&#8381;</span></div>
            {{--<div class="c-my-sales__item-pay-method"><span>Яндекс. Деньги</span>--}}
            {{--</div>--}}
        </td>
        <td data-th="Количество" class="c-my-sales__item-price-td text-center">
            <div class="c-my-sales__item-price"><span>
                                            {{intval($lot->availability)}} @if(!empty($lot->currency)){{$lot->currency->unity}} @else @lang(session("langId"), 'my_lots', 'count', 43200). @endif</span>
            </div>
            {{--<div class="c-my-sales__item-pay-method"><span>Яндекс. Деньги</span>--}}
            {{--</div>--}}
        </td>
        <td class="c-my-sales__item-btn text-center">
            <button data-toggle="modal" data-target="#modal-edit-proposition-{{$lot->id}}" @if(empty($lot->currency)) id="edit-proposition" @else id="edit-currency-proposition" @endif value="{{$lot->id}}" type="button"
                    class="btn btn_orange-white btn_nowrap">@lang(session("langId"), 'my_lots', 'edit', 43200)
            </button>
        </td>
    </tr>

    <div tabindex="-1" role="dialog"
         class="modal-edit-proposition-{{$lot->id}} modal fade modal_centered fade" id="getCodeModal" aria-hidden="true">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                    <h3 class="modal-title">@lang(session("langId"), 'my_lots', 'edit_offers', 43200)</h3>
                </div>
                <div class="modal-body" id="getCode">

                </div>
            </div>
        </div>
    </div>
@endforeach