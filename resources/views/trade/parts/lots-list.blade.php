<tr class="c-my-sales__item @if($sale->active == 1) opened @else closed @endif">
    <td data-th="Заказ" class="c-my-sales__item-order">
        <div class="c-my-sales__item-number"><a href="#">{{ $sale->id }}</a></div>
        <div class="c-my-sales__item-date">
            <span>{{ localeDate($sale->created_at,'d M  H:i') }}</span></div>
    </td>
    <td data-th="Описание" class="c-my-sales__item-buyer text-center">
        <span>{{ $sale->description }}</span>
    </td>
    <td data-th="Сервер" class="c-my-sales__item-descr">
                                    <span>
                                        {{ $sale->game->name }}
                                        {{ $sale->game->region . "," }}
                                        @if($sale->server){{ $sale->server->name }}{{isset($sale->server->side)?'('.$sale->server->side.')':''}}@endif
                                    </span>
    </td>
    @if($sale->active == 1)
        <td data-th="Статус" class="c-my-sales__item-status text-center">
            <span>Активирован</span>
        </td>
    @else
        <td data-th="Статус" class="c-my-sales__item-btn text-center"><span>Деактивирован</span>
        </td>
    @endif
    <td data-th="Сумма" class="c-my-sales__item-price-td text-center">
        <div class="c-my-sales__item-price">
                                        <span>
                                            {{ number_format($sale->price,2,'.',' ') }}
                                        </span>
        </div>
        <div class="c-my-sales__item-pay-method"><span>{{$sale->availability}} шт.</span></div>
    </td>
</tr>