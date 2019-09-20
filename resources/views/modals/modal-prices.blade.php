<div id="modal-prices" tabindex="-1" role="dialog" class="modal-prices modal fade modal_centered">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                <h3 class="modal-title">@lang(session("langId"), 'modal_prices', 'prices_for_buyers', 43200)</h3>
            </div>
            <div class="modal-body">
                <table class="modal-prices__table">
                    <thead>
                    <tr>
                        <th>@lang(session("langId"), 'modal_prices', 'prices_for_buyers', 43200)</th>
                        <th class="text-center">@lang(session("langId"), 'modal_prices', 'price', 43200)</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($commissions as $item)
                        <tr>
                            <td>{{$item->title}}</td>
                            <td class="text-center price-calculate" data-coefficient="{{$item->coefficient}}"
                                data-commission="{{($item->site + $item->payment + $item->withdrawal + $item->other)/100}}">
                                <span class="price-value"></span>
                                {{$item->symbol}}
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>