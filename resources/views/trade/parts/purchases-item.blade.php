<tr class="c-my-sales__item @if($purchase->status == 1) opened @else closed @endif" data-id="{{$purchase->id}}">
    <td data-th="Заказ" class="c-my-sales__item-order">
        <div class="c-my-sales__item-number"><a href="#" class="show-info">{{ $purchase->id }}</a></div>
        <div class="c-my-sales__item-date">
            <span>{{ localeDate($purchase->created_at,'d M H:i') }}</span></div>
    </td>
    <td data-th="Описание" class="c-my-sales__item-descr">
                                    <span>
                                        @if(!empty($purchase->lot))
                                            {{ $purchase->lot->game->name }}
                                            {{ $purchase->lot->game->region}},
                                            @if(isset($purchase->lot->server)){{ $purchase->lot->server->name }}{{isset($purchase->lot->server->side)?'('.$purchase->lot->server->side.')':''}},@endif
                                            {{ isset($purchase->lot->tag->name) ?$purchase->lot->tag->name :$purchase->lot->currency->name}},
                                            {{ !empty($purchase->lot->currency)?$purchase->get_availability:intval($purchase->get_availability)}}
                                            @if(!empty($purchase->lot->currency)){{$purchase->lot->currency->unity}} @else @lang(session("langId"), 'purchases', 'count', 43200).@endif
                                        @if(!empty($purchase->lot->description))
                                            <br>{{str_limit($purchase->lot->description,100)}}
                                            @endif
                                        @else
                                            @lang(session("langId"), 'purchases', 'lot_deleted', 43200)
                                        @endif
                                    </span>
    </td>
    <td data-th="Продавец" class="c-my-sales__item-buyer text-center">
        <span><a target="_blank"
                 href="{{route('user-profile',['id' => $purchase->owner->id])}}">{{ $purchase->owner->name }}</a></span>
    </td>
    <td data-th="Сумма" class="c-my-sales__item-price-td text-center">
        <div class="c-my-sales__item-price"><span>
                          {{ number_format($purchase->price,2,'.',' ') }}</span></div>
        <div class="c-my-sales__item-pay-method">

            <span>{{lang(session("langId"), 'purchases', $purchase->paymentCurrency->title, 43200)}}</span></div>
    </td>
    <td data-th="Статус" class="c-my-sales__item-btn text-center">

        @if($purchase->status == 1)
            <button id="{{ $purchase->id }}" type="button"
                    class="btn btn_orange-white btn_nowrap status-btn" data-toggle="modal"
                    data-target="#update_modal">@lang(session("langId"), 'purchases', 'confirm_order', 43200)
            </button>
        @elseif($purchase->status == 3)
            <span>@lang(session("langId"), 'purchases', 'back', 43200)</span>
        @else
            <span>@lang(session("langId"), 'purchases', 'close', 43200)</span>
        @endif
    </td>

</tr>