<div class="modal-header">
    <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
    <h3 class="modal-title">@lang(session("langId"), 'modal', 'info_operation', 43200)</h3>
</div>
<div class="modal-body">
    <table class="modal-prices__table">
        <tbody>
        <tr>
            <td>@lang(session("langId"), 'modal', 'operation_number', 43200)</td>
            <td> {{$invoice->id}}</td>
        </tr>
        <tr>
            <td>@lang(session("langId"), 'modal', 'operation_data', 43200)</td>
            <td>{{localeDate($invoice->created_at,'d M Y')}}</td>
        </tr>
        <tr>
            <td>@lang(session("langId"), 'modal', 'description', 43200)</td>
            <td>@if(!empty($invoice->trade)) @lang(session("langId"), 'modal', 'order', 43200)
                #{{$invoice->trade->id}}
                @elseif($invoice->type == 'out')
                    @if(!$invoice->status) @lang(session("langId"), 'modal', 'withdrawal_request', 43200) #{{$invoice->id}}
                    @else @lang(session("langId"), 'modal', 'output', 43200) #{{$invoice->id}}
                    @endif
                @endif</td>
        </tr>
        <tr>
            <td>@lang(session("langId"), 'modal', 'sum', 43200)</td>
            <td> {{number_format($invoice->price,2,'.',' ')}}
                @if(!empty($invoice->currency))
                    @if($invoice->currency->keyword == 'wmu')
                        ₴
                    @elseif($invoice->currency->keyword == 'wmz')
                        $
                    @elseif($invoice->currency->keyword == 'wme')
                        €
                    @else
                        &#8381;
                    @endif
                @else
                    &#8381;
                @endif</td>
        </tr>
        <tr>
            <td>@lang(session("langId"), 'modal', 'transaction_status', 43200)</td>
            <td>@if($invoice->type == 'in')
                    @if(!empty($invoice->trade))
                        @if($invoice->trade->status == '0')
                            @lang(session("langId"), 'modal', 'closed', 43200)
                        @elseif($invoice->trade->status == '1')
                            @lang(session("langId"), 'modal', 'active', 43200)
                        @elseif($invoice->trade->status == '3')
                            @lang(session("langId"), 'modal', 'return', 43200)
                        @endif{{$invoice->trade->is_payed? ', '.lang(session("langId"), 'modal', 'paid', 43200):', '.lang(session("langId"), 'modal', 'not_paid', 43200)}}
                    @endif
                @elseif($invoice->type == 'out')
                    @if(!$invoice->status)<span>@lang(session("langId"), 'modal', 'in_processing', 43200)</span>
                    @else<span>@lang(session("langId"), 'modal', 'processed', 43200)</span>
                    @endif
                @endif</td>
        </tr>
        @if(!empty($invoice->trade))
            <tr>
                <td>@lang(session("langId"), 'modal', 'order_number', 43200)</td>
                <td>
                    <a href="{{route('purchases',['id' => $invoice->trade->id])}}">{{$invoice->trade->id}}</a>
                </td>
            </tr>
        @endif
        <tr>
            <td>
                @lang(session("langId"), 'modal', 'payment_system', 43200)
            </td>
            <td>
                {{!empty($invoice->currency) ? lang(session("langId"), 'balance', $invoice->currency->title, 43200) : $invoice->payment_type}}
            </td>
        </tr>
        <tr>
            <td>@lang(session("langId"), 'modal', 'external_transaction', 43200)</td>
            <td>@if (strpos($invoice->invoice_id, 'payout') !== false)
                    {{preg_replace('/[^0-9]/', '', $invoice->invoice_id)}}
                @else
                    {{$invoice->invoice_id}}
                @endif
            </td>
        </tr>
        </tbody>
    </table>
</div>