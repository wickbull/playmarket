@foreach($sales as $sale)
    <tr class="c-my-sales__item @if($sale->status == 1) opened @else closed @endif"
        @if($sale->status == 3)style="opacity: 0.6;" @endif data-id="{{$sale->id}}">
        <td data-th="Заказ" class="c-my-sales__item-order">
            <div class="c-my-sales__item-number"><a href="#" class="show-info">{{ $sale->id }}</a></div>
            <div class="c-my-sales__item-date">
                <span>{{ localeDate($sale->created_at,'d M H:i') }}</span></div>
        </td>
        <td data-th="@lang(session("langId"), 'sales', 'description', 43200)" class="c-my-sales__item-descr">
            <span>
                @if(!empty($sale->lot))
                    {{ $sale->lot->game->name }}
                    {{ $sale->lot->game->region}},
                    @if(isset($sale->lot->server)){{ $sale->lot->server->name }}{{isset($sale->lot->server->side)?
                    '('.$sale->lot->server->side.')':''}},@endif
                    {{ isset($sale->lot->tag->name) ?$sale->lot->tag->name :$sale->lot->currency->name}},
                    {{ $sale->get_availability}}
                    @if(!empty($sale->lot->currency)){{$sale->lot->currency->unity}} @else @lang(session("langId"), 'purchases', 'count', 43200).@endif
                    @if(!empty($sale->lot->description)),
                    <br>{{str_limit($sale->lot->description,100)}}
                    @endif
                @else
                    @lang(session("langId"), 'sales', 'lot_deleted', 43200)
                @endif
            </span>
        </td>
        <td data-th="@lang(session("langId"), 'sales', 'seller', 43200)" class="c-my-sales__item-buyer text-center">
            <span><a target="_blank"
                     href="{{route('user-profile',['id' => $sale->buyer->id])}}">{{ $sale->buyer->name }}</a> </span>
        </td>
        <td data-th="@lang(session("langId"), 'sales', 'status', 43200)" class="c-my-sales__item-status text-center">
            @if($sale->status == 1)
                <span>@lang(session("langId"), 'sales', 'opened', 43200)</span>
            @elseif($sale->is_payed == 0 && $sale->status == 1)
                <span>@lang(session("langId"), 'sales', 'waiting_for_payment', 43200)</span>
            @elseif($sale->status == 3)
                <span>@lang(session("langId"), 'sales', 'return', 43200)</span>
            @else
                <span>@lang(session("langId"), 'sales', 'closed', 43200)</span>
        @endif
        <td data-th="@lang(session("langId"), 'sales', 'summ', 43200)" class="c-my-sales__item-price-td text-center">
            <div class="c-my-sales__item-price">
                <span>
                    {{ number_format($sale->amount_clear,2,'.',' ') }}
                </span>
            </div>
            {{-- Внутренний баланс --}}
            <div class="c-my-sales__item-pay-method"><span>@lang(session("langId"), 'sales', $sale->paymentCurrency->title, 43200)</span></div>
        </td>
    </tr>

@endforeach