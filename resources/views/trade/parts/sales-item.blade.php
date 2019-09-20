<tr class="c-my-sales__item @if($purchase->status == 1) opened @else closed @endif" data-id="{{$purchase->id}}">
    <td data-th="Заказ" class="c-my-sales__item-order">
        <div class="c-my-sales__item-number"><a href="#">{{ $purchase->id }}</a></div>
        <div class="c-my-sales__item-date">
            <span>{{ localeDate($purchase->created_at,'d M H:i') }}</span></div>
    </td>
    <td data-th="Описание" class="c-my-sales__item-descr">
                                    <span>
                                        @if(!empty($purchase->lot))
                                            {{ $purchase->lot->game->name }}
                                            {{ $purchase->lot->game->region}},
                                            @if(isset($purchase->lot->server)){{ $purchase->lot->server->name }}
                                            {{isset($purchase->lot->server->side)?'('.$purchase->lot->server->side.')':''}},@endif
                                            {{ isset($purchase->lot->tag->name) ?$purchase->lot->tag->name :$purchase->lot->currency->name}},
                                            {{ !empty($purchase->lot->currency)?$purchase->get_availability:intval($purchase->get_availability)}}
                                            @if(!empty($purchase->lot->currency)){{$purchase->lot->currency->unity}} @else шт.@endif
                                            @if(!empty($purchase->lot->description))
                                            <br>{{str_limit($purchase->lot->description,100)}}
                                            @endif
                                        @else
                                            Лот был удален
                                        @endif

                                    </span>
    </td>
    <td data-th="Продавец" class="c-my-sales__item-buyer text-center">
        <span>{{ $purchase->owner->name }}</span></td>
    <td data-th="Сумма" class="c-my-sales__item-price-td text-center">
        <div class="c-my-sales__item-price"><span>
                          {{ number_format($purchase->price,2,'.',' ') }}</span></div>
        <div class="c-my-sales__item-pay-method">
            <span>{{$purchase->paymentCurrency->title or 'Валюта'}}</span></div>
    </td>
    <td data-th="Статус" class="c-my-sales__item-btn text-center">

        @if($purchase->status == 1)
            <button id="{{ $purchase->id }}" type="button"
                    class="btn btn_orange-white btn_nowrap status-btn" data-toggle="modal"
                    data-target="#update_modal">Подтвердить заказ
            </button>
        @elseif($purchase->status == 3)
            <span>Возврат</span>
        @else
            <span>Закрыт</span>
        @endif
    </td>

</tr>