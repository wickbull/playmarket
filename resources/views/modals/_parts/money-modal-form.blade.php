<form action="{{route('user_withdraw')}}" method="POST">
    {{csrf_field()}}
    <div class="row">
        <div class="col-xs-24">
            <div class="form-group">
                <div class="form-group__ttl">@lang(session('langId'), 'modal', 'output_method', 43200)</div>
                <div class="select-wrap">
                    <select data-none-selected-text="{{lang(session('langId'), 'modal', 'choose', 43200)}}" name="currency_id" class="selectpicker"
                            required="required"
                            id="currency-select">
                        <option selected disabled value="">@lang(session('langId'), 'modal', 'choose', 43200)</option>
                        @foreach($commissions->where('can_withdrawal','1') as $commission)
                            <option data-commission="{{$commission->output_commission}}"
                                    value="{{$commission->id}}">{{$commission->title}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="commission-value"></div>
            </div>

        </div>
        <div class="col-xs-24">
            <div class="form-group">
                <div class="form-group__ttl">@lang(session('langId'), 'modal', 'wallet', 43200)</div>
                <div class="select-wrap">
                    <select name="wallet" class="selectpicker" id="wallet-choose"
                            data-none-selected-text="{{lang(session('langId'), 'modal', 'choose', 43200)}}"
                            required="required">
                        <option selected disabled value="">@lang(session('langId'), 'modal', 'choose', 43200)</option>
                        @foreach($user->wallets->where('currency_id',2) as $wallet)
                            <option value="{{$wallet->wallet_id}}">{{$wallet->wallet_id}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
        <div class="col-xs-24">
            <div class="form-group">
                <div class="form-group__ttl">@lang(session('langId'), 'modal', 'sum', 43200)</div>
                <div class="input-wrap">
                    <input id="payment_sum" name="price" placeholder="00.00 ₽" type="number" step="any"
                           max="{{$user->balance}}"
                           required="required"
                           class="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-xs-24">
            <div class="form-group">
                <div class="form-group__ttl">@lang(session('langId'), 'modal', 'to_receive', 43200)</div>
                <div class="input-wrap">
                    <input id="payment_sum_total" disabled="disabled" type="number" step="any"
                           required="required"
                           name="price" placeholder="00.00 ₽" class="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-footer">
        <div class="row">
            <div class="col-xs-12">
                <button type="submit" class="btn btn_blue btn_upper btn_block">@lang(session('langId'), 'modal', 'withdraw', 43200)</button>
            </div>
            <div class="col-xs-12">
                <button type="button" data-dismiss="modal"
                        class="btn btn_blue-white btn_upper btn_block">@lang(session('langId'), 'modal', 'cancel', 43200)
                </button>
            </div>
        </div>
    </div>
</form>