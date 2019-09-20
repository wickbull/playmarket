<div class="modal-header">
    <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
    <h3 class="modal-title">@lang(session("langId"), 'modal', 'info_operation', 43200) #{{$trade->id}}</h3>
</div>
<div class="modal-body">
    <table class="modal-prices__table">
        <tbody>
        <tr>
            <td>{{auth()->id() == $trade->owner_id ? lang(session("langId"), 'modal', 'buyer', 43200) : lang(session("langId"), 'modal', 'seller', 43200)}}</td>
            <td>
                <a href="{{route('user-profile',['id' => auth()->id() == $trade->owner_id?$trade->buyer_id:$trade->owner_id])}}">
                    {{auth()->id() == $trade->owner_id?$trade->buyer->name:$trade->owner->name}}</a> @if(auth()->id() == $trade->owner_id?$trade->buyer->isOnline():$trade->owner->isOnline())<span
                        class="c-chat__online">online</span>@else <span class="c-chat__offline">offline</span> @endif
            </td>
        </tr>
        <tr>
            <td>@lang(session("langId"), 'modal', 'sum', 43200)</td>
            <td> {{number_format(auth()->id() == $trade->owner_id?$trade->amount_clear:$trade->price,2,'.',' ')}}
                @if(!empty($trade->currency))
                    @if($trade->currency->keyword == 'wmu')
                        ₴
                    @elseif($trade->currency->keyword == 'wmz')
                        $
                    @elseif($trade->currency->keyword == 'wme')
                        €
                    @else
                        &#8381;
                    @endif
                @else
                    &#8381;
                @endif</td>
        </tr>
        @if(!empty($trade->lot))
            <tr>
                <td>@lang(session("langId"), 'modal', 'game', 43200)</td>
                <td> {{ $trade->lot->game->name }}
                    {{!empty($trade->lot->game->region)?"({$trade->lot->game->region})":null}}
                </td>
            </tr>
            <tr>
                <td>@lang(session("langId"), 'modal', 'server', 43200)</td>
                <td> @if(isset($trade->lot->server))
                        {{ $trade->lot->server->name }}{{isset($trade->lot->server->side)?
                                            '('.$trade->lot->server->side.')':''}}@endif</td>
            </tr>
            <tr>
                <td>{{isset($trade->lot->tag->name)? lang(session("langId"), 'modal', 'type', 43200) : lang(session("langId"), 'modal', 'currency', 43200) }}</td>
                <td>{{ isset($trade->lot->tag->name) ?$trade->lot->tag->name :$trade->lot->currency->name}}</td>
            </tr>
            <tr>
                <td>@lang(session("langId"), 'modal', 'amount', 43200)</td>
                <td> {{ $trade->get_availability}} @if(!empty($trade->lot->currency)){{$trade->lot->currency->unity}} @else
                        @lang(session("langId"), 'modal', 'count', 43200).@endif</td>
            </tr>
        @endif
        <tr>
            <td>@lang(session("langId"), 'modal', 'characters_name', 43200)
            </td>
            <td>
                {{$trade->character_name}}
            </td>
        </tr>
        

        @if(!empty($trade->lot->description))
            <tr>
                <td>@lang(session("langId"), 'modal', 'description', 43200)
                </td>
                <td class="col-md-16 col-sm-12 col-xs-12">
                    {{$trade->lot->description}}
                </td>
            </tr>
        @endif
        <tr>
            <td>@lang(session("langId"), 'modal', 'transaction_status', 43200)</td>
            <td>
                @if($trade->status == 1)
                    <span>@lang(session("langId"), 'modal', 'open', 43200)</span>
                @elseif($trade->is_payed == 0 && $trade->status == 1)
                    <span>@lang(session("langId"), 'modal', 'waiting_for_payment', 43200)</span>
                @elseif($trade->status == 3)
                    @lang(session("langId"), 'modal', 'return', 43200)
                @else
                    <span>@lang(session("langId"), 'modal', 'closed', 43200)</span>
            @endif
        </tr>
        <tr>
            <td>@lang(session("langId"), 'modal', 'open', 43200)</td>
            <td>{{localeDate($trade->created_at,'d M Y')}}</td>
        </tr>
        @if(!empty($trade->closed_at))
            <tr>
                <td>@lang(session("langId"), 'modal', 'closed', 43200)</td>
                <td>{{localeDate($trade->closed_at,'d M Y')}}</td>
            </tr>
        @endif

        @if(!empty($trade->sendTo->name))
        <tr>
            <td>@lang(session("langId"), 'modal', 'additional_options', 43200)
            </td>
            <td>
                {{$trade->sendTo->name}}
            </td>
        </tr>
        @endif
        </tbody>
    </table>
</div>