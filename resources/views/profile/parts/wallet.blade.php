<div class="c-balance">
    <div class="c-balance__purses">
        <div class="c-balance__purses-ttl"><span>@lang(session("langId"), 'balance', 'wallets', 43200)</span></div>
        <div class="c-balance__purses-body">
            <form action="{{route('my-wallet-save')}}" method="POST">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-lg-12 col-md-16 col-xs-24">
                        <div class="c-balance__purses-list">
                            <div class="current__wallet">
                                @if(count($wallets))
                                    @foreach($wallets as $wallet)
                                        <div class="c-balance__purses-item">
                                            <div class="row">
                                                <div class="col-sm-9 col-xs-9 col-xx-24">
                                                    <div class="form-group">
                                                        <div class="select-wrap">
                                                            <select
                                                                    name="currency_id[]"
                                                                    class="selectpicker">
                                                                @foreach($commissions->where('can_withdrawal','1') as $item)
                                                                    <option @if($wallet->currency_id == $item->id) selected
                                                                            @endif value="{{$item->id}}">{{$item->title}}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-11 col-xs-9 col-xx-24">
                                                    <div class="form-group">
                                                        <div class="input-wrap">
                                                            <input type="text" name="wallet_id[]" min="2" max="25"
                                                                   value="{{$wallet->wallet_id}}"
                                                                   class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 col-xs-6 col-xx-24">
                                                    <div class="c-balance__purses-item-action">
                                                        <button type="button" data-action-type="remove"
                                                                class="purse-action-btn button-remove">
                                                            <span>@lang(session("langId"), 'balance', 'delete', 43200)</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="c-balance__purses-item">
                                        <div class="row">
                                            <div class="col-sm-9 col-xs-9 col-xx-24">
                                                <div class="form-group">
                                                    <div class="select-wrap">
                                                        <select
                                                                name="currency_id[]"
                                                                class="selectpicker">
                                                            @foreach($commissions->where('can_withdrawal','1') as $item)
                                                                <option value="{{$item->id}}">{{$item->title}}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-11 col-xs-9 col-xx-24">
                                                <div class="form-group">
                                                    <div class="input-wrap">
                                                        <input type="text" name="wallet_id[]" min="2" max="25"
                                                               value=""
                                                               class="form-control"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 col-xs-6 col-xx-24">
                                                <div class="c-balance__purses-item-action">
                                                    <button type="button" data-action-type="remove"
                                                            class="purse-action-btn button-remove">
                                                        <span>@lang(session("langId"), 'balance', 'delete', 43200)</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            </div>
                            <div class="c-balance__purses-item">
                                <div class="row">
                                    <div class="col-sm-offset-20 col-sm-4 col-xs-offset-18 col-xs-6 col-xx-24">
                                        <div class="form-group">
                                        <div class="c-balance__purses-item-action">
                                            <button type="button" data-action-type="add"
                                                    class="purse-action-btn button-add">
                                                <span>@lang(session("langId"), 'balance', 'add', 43200)</span>
                                            </button>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-9 col-xs-9 col-xx-24">
                                <button type="submit"
                                        class="btn btn_blue btn_upper btn_block text-center button">
                                    @lang(session("langId"), 'balance', 'save', 43200)
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="c-balance__money">
        <div class="c-balance__money-ttl"><span>@lang(session("langId"), 'balance', 'balance', 43200)</span></div>
        <div class="c-balance__money-list">
            <div class="row">
                <div class="col-sm-8 col-xs-12 col-xx-24">
                    <div class="c-balance__money-item-price">
                        <strong>  @if($user->balance > 0){{number_format($user->balance,2,'.',' ')}}@else
                                0 @endif</strong> RUB
                    </div>
                    @if($user->balance > 0)
                        <button id="payout-money" type="button"
                                class="btn btn_blue-white btn_upper button">@lang(session("langId"), 'balance', 'bring_out', 43200)
                        </button>
                    @endif
                </div>
                {{--<div class="c-balance__money-item">--}}
                {{--<div class="c-balance__money-item-header"><i--}}
                {{--class="ico ico-webmoney"></i><span>WebMoney WMR</span>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-body">--}}
                {{--<div class="c-balance__money-item-body-td">--}}
                {{--<div class="c-balance__money-item-price"><span--}}
                {{--class="value">--}}
                {{--{{$user->balance}}--}}
                {{--&#8381;</span><span class="txt">Цена</span></div>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-body-td">--}}
                {{--<div class="form-group">--}}
                {{--<label class="checkbox-label">--}}
                {{--<input type="checkbox" name="admission"--}}
                {{--checked="checked" value="Прием"--}}
                {{--class="hidden-input"/><span--}}
                {{--class="check-icon"></span><span--}}
                {{--class="check-value">Прием</span>--}}
                {{--</label>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-footer">--}}
                {{--<button type="button" class="btn btn_blue-white btn_upper">--}}
                {{--вывести--}}
                {{--</button>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--<div class="col-sm-8 col-xs-12 col-xx-24">--}}
                {{--<div class="c-balance__money-item">--}}
                {{--<div class="c-balance__money-item-header"><i--}}
                {{--class="ico ico-qiwi"></i><span>Qiwi</span>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-body">--}}
                {{--<div class="c-balance__money-item-body-td">--}}
                {{--<div class="c-balance__money-item-price"><span--}}
                {{--class="value">--}}
                {{--{{$user->balance}}--}}
                {{--&#8381;</span><span class="txt">Цена</span></div>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-body-td">--}}
                {{--<div class="form-group">--}}
                {{--<label class="checkbox-label">--}}
                {{--<input type="checkbox" name="admission"--}}
                {{--checked="checked" value="Прием"--}}
                {{--class="hidden-input"/><span--}}
                {{--class="check-icon"></span><span--}}
                {{--class="check-value">Прием</span>--}}
                {{--</label>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-footer">--}}
                {{--<button type="button" class="btn btn_blue-white btn_upper">--}}
                {{--вывести--}}
                {{--</button>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--<div class="col-sm-8 col-xs-12 col-xx-24">--}}
                {{--<div class="c-balance__money-item">--}}
                {{--<div class="c-balance__money-item-header"><i--}}
                {{--class="ico ico-yandexmoney"></i><span>Яндекс.Деньги</span>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-body">--}}
                {{--<div class="c-balance__money-item-body-td">--}}
                {{--<div class="c-balance__money-item-price"><span--}}
                {{--class="value">--}}
                {{--{{$user->balance}}--}}

                {{--&#8381;</span><span class="txt">Цена</span></div>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-body-td">--}}
                {{--<div class="form-group">--}}
                {{--<label class="checkbox-label">--}}
                {{--<input type="checkbox" name="admission"--}}
                {{--checked="checked" value="Прием"--}}
                {{--class="hidden-input"/><span--}}
                {{--class="check-icon"></span><span--}}
                {{--class="check-value">Прием</span>--}}
                {{--</label>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--<div class="c-balance__money-item-footer">--}}
                {{--<button type="button" class="btn btn_blue-white btn_upper">--}}
                {{--вывести--}}
                {{--</button>--}}
                {{--</div>--}}
                {{--</div>--}}
                {{--</div>--}}
            </div>
        </div>
    </div>
    <div class="c-balance__operations">
        <div class="row">
            <div class="col-lg-24 col-md-24 col-xs-24">
                <div class="c-balance__operations-ttl"><span>@lang(session("langId"), 'balance', 'operations', 43200)</span></div>
                <div class="c-balance__operations-body">
                    <table class="c-balance__operations-table">
                        <thead>
                        <tr>
                            <th>@lang(session("langId"), 'balance', 'date', 43200)</th>
                            <th>@lang(session("langId"), 'balance', 'description', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'balance', 'currency', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'balance', 'summ', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'balance', 'status', 43200)</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($invoices as $invoice)
                            <tr class="c-balance__operations-item" data-id="{{$invoice->id}}">
                            <td data-th="Дата" class="c-balance__operations-item-date">
                                <div class="c-balance__operations-item-date-1">
                                    <span>{{$invoice->payment_date != ''?localeDate($invoice->payment_date,'d M Y'):localeDate($invoice->created_at,'d M Y')}}</span>
                                </div>
                                
                            </td>
                            <td data-th="Описание" class="c-balance__operations-item-descr">
                                @if(!empty($invoice['trade']))
                                    <span>@lang(session("langId"), 'balance', 'order', 43200) #{{$invoice->trade->id}}</span>
                                @elseif($invoice->type == 'out')
                                    @if(!$invoice->status)<span>@lang(session("langId"), 'balance', 'withdrawal_request', 43200) #{{$invoice->id}}</span>
                                    @else<span>@lang(session("langId"), 'balance', 'output', 43200) #{{$invoice->id}}</span>
                                    @endif
                                @endif
                            </td>
                            <td data-th="Валюта"
                                class="c-balance__operations-item-currency text-center">
                                <span>{{!empty($invoice->currency)?lang(session("langId"), 'balance', $invoice->currency->title, 43200):$invoice->payment_type}}</span>
                            </td>
                                <td data-th="Сумма"
                                    class="c-balance__operations-item-price text-center"><span>
                                      {{number_format($invoice->price,2,'.',' ')}}
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
                                    @endif
                                      </span></td>
                                <td data-th="Статус"
                                    class="c-balance__operations-item-price text-center">
                                    @if(!empty($invoice['trade']))
                                        @if($invoice->trade->status == '1')
                                                @lang(session("langId"), 'balance', 'active_deal', 43200)
                                            @else
                                                @lang(session("langId"), 'balance', 'closed_deal', 43200)
                                            @endif
                                    @elseif($invoice->type == 'out')
                                        @if(!$invoice->status)<span>@lang(session("langId"), 'balance', 'in_processing', 43200)</span>
                                        @else<span></span>@lang(session("langId"), 'balance', 'processed', 43200)</span>
                                        @endif
                                    @endif
                                    @if($invoice->type == 'out' && !$invoice->status)
                                        <form action="{{route('user_withdraw.delete',['invoice' => $invoice->id])}}"
                                              method="POST">
                                            {{method_field('DELETE')}}
                                            {{csrf_field()}}
                                            <button type="submit" class="btn btn_blue-white btn_nowrap status-btn">
                                                @lang(session("langId"), 'balance', 'cancel_withdrawal', 43200)
                                            </button>
                                        </form>
                                    @endif
                                </td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
