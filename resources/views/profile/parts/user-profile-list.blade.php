@foreach($lots as $lot)
    <tr class="c-my-sales__item @if(intval($lot->active) == 1) opened @else closed @endif">
        <td data-th="Лот" class="c-my-sales__item-descr">
            {{--<a href="{{route('game',['id' => $lot->game->id])}}?lot_id={{$lot->id}}">--}}
            {{ $lot->game->name}}
            {{ $lot->game->region}}@if(isset($lot->server)),
            {{ $lot->server->name}},
            @else,
            @endif
            @if(isset($lot->side))({{ $lot->side->title}})@endif
            {{ isset($lot->tag->name) ?$lot->tag->name :$lot->currency->name}}
            {{--</a>--}}
        </td>
        <td data-th="Наличие" class="c-my-sales__item-price-td text-center">
            <div class="c-my-sales__item-price"><span>
                                            {{intval($lot->availability)}} @if(!empty($lot->currency)){{$lot->currency->unity}} @else шт.@endif</span>
            </div>
        </td>
        <td data-th="Сумма" class="c-my-sales__item-price-td text-center">
            <div class="c-my-sales__item-price"><span>{{number_format($lot->price,2,'.',' ')}} &#8381;</span></div>
        </td>
    </tr>
@endforeach