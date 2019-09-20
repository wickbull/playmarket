@extends('layouts.app')

@section('content')
    <div class="c-my-purchases">
        <div class="container">
            <div class="c-my-sales__ttl"><h3 class="h3">Подтверждения заказа</h3></div>
            <div class="c-my-sales__body">
                <div class="row">
                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-ttl"><span>Продавец</span></div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-val"><span>{{$trade->owner->name}}</span></div>
                    </div>
                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-ttl"><span>Игра</span></div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-val"><span>{{$trade->lot->game->name}}</span></div>
                    </div>
                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-ttl"><span>Категория</span></div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-val">
                            <span>@if(!empty($trade->lot->currency)) {{$trade->lot->currency->name}}@elseif(!empty($trade->lot->tag)){{$trade->lot->tag->name}}@endif</span>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-ttl"><span>Сервер</span></div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-val">
                            <span>@if(!empty($trade->lot->server)) {{$trade->lot->server->name}}@endif</span>
                        </div>
                    </div>
                    @if($trade->lot->description != '')
                        <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                            <div class="c-personal-data__item-ttl"><span>Описания</span></div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="c-personal-data__item-val">
                                <span>{{$trade->lot->description}}</span>
                            </div>
                        </div>
                    @endif
                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-ttl"><span>Способ оплаты</span></div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-val">
                            <span>@if(!empty($trade->lot->server)) {{$trade->paymentCurrency->title}}@endif</span>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-ttl"><span>Сумма</span></div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="c-personal-data__item-val"><span>{{$trade->price}}</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">

        @if (config('unitpay.payment_forms')['cards'])
            <div class="form-group ">
                <form action="https://unitpay.ru/pay/{{ $payment_fields['PUB_KEY'] }}/card" method="POST"
                      class="form unitpay-form">
                    <input type="hidden" name="sum" value="{{ $payment_fields['PAYMENT_AMOUNT'] }}">
                    <input type="hidden" name="account" value="{{ $payment_fields['PAYMENT_NO'] }}">
                    <input type="hidden" name="desc" value="{{ $payment_fields['ITEM_NAME'] }}">
                    <input type="hidden" name="currency" value="{{ $payment_fields['CURRENCY'] }}">
                    <input type="hidden" name="locale" value="{{ $payment_fields['LOCALE'] }}">
                    <input type="hidden" name="signature" value="{{ $payment_fields['SIGN'] }}">
                    <input type="hidden" name="hideOtherMethods"
                           value="{{ config('unitpay.hideOtherMethods','false') }}">
                    <button type="submit"
                            class="c-my-sales__filter-submit btn btn_blue btn_upper text-center">Оплатить
                        картой российского банка
                    </button>
                </form>
            </div>
        @endif

        {{--@if (config('unitpay.payment_forms')['yandex'])--}}
        {{--<div class="form-group pull-left">--}}
        {{--<form action="https://unitpay.ru/pay/{{ $payment_fields['PUB_KEY'] }}/yandex" method="POST"--}}
        {{--class="form unitpay-form">--}}
        {{--<input type="hidden" name="sum" value="{{ $payment_fields['PAYMENT_AMOUNT'] }}">--}}
        {{--<input type="hidden" name="account" value="{{ $payment_fields['PAYMENT_NO'] }}">--}}
        {{--<input type="hidden" name="desc" value="{{ $payment_fields['ITEM_NAME'] }}">--}}
        {{--<input type="hidden" name="currency" value="{{ $payment_fields['CURRENCY'] }}">--}}
        {{--<input type="hidden" name="locale" value="{{ $payment_fields['LOCALE'] }}">--}}
        {{--<input type="hidden" name="signature" value="{{ $payment_fields['SIGN'] }}">--}}
        {{--<input type="hidden" name="hideOtherMethods"--}}
        {{--value="{{ config('unitpay.hideOtherMethods','false') }}">--}}
        {{--<button type="submit" class="btn btn_order btn_small">Yandex</button>--}}
        {{--</form>--}}
        {{--</div>--}}
        {{--@endif--}}

        {{--@if (config('unitpay.payment_forms')['qiwi'])--}}
        {{--<div class="form-group">--}}
        {{--<form action="https://unitpay.ru/pay/{{ $payment_fields['PUB_KEY'] }}/qiwi" method="POST"--}}
        {{--class="form unitpay-form">--}}
        {{--<input type="hidden" name="sum" value="{{ $payment_fields['PAYMENT_AMOUNT'] }}">--}}
        {{--<input type="hidden" name="account" value="{{ $payment_fields['PAYMENT_NO'] }}">--}}
        {{--<input type="hidden" name="desc" value="{{ $payment_fields['ITEM_NAME'] }}">--}}
        {{--<input type="hidden" name="currency" value="{{ $payment_fields['CURRENCY'] }}">--}}
        {{--<input type="hidden" name="locale" value="{{ $payment_fields['LOCALE'] }}">--}}
        {{--<input type="hidden" name="signature" value="{{ $payment_fields['SIGN'] }}">--}}
        {{--<input type="hidden" name="hideOtherMethods"--}}
        {{--value="{{ config('unitpay.hideOtherMethods','false') }}">--}}
        {{--<button type="submit" class="btn btn_order btn_small">QIWI</button>--}}
        {{--</form>--}}
        {{--</div>--}}
        {{--@endif--}}

        {{--@if (config('unitpay.payment_forms')['cash'])--}}
        {{--<div class="form-group">--}}
        {{--<form action="https://unitpay.ru/pay/{{ $payment_fields['PUB_KEY'] }}/cash" method="POST"--}}
        {{--class="form unitpay-form">--}}
        {{--<input type="hidden" name="sum" value="{{ $payment_fields['PAYMENT_AMOUNT'] }}">--}}
        {{--<input type="hidden" name="account" value="{{ $payment_fields['PAYMENT_NO'] }}">--}}
        {{--<input type="hidden" name="desc" value="{{ $payment_fields['ITEM_NAME'] }}">--}}
        {{--<input type="hidden" name="currency" value="{{ $payment_fields['CURRENCY'] }}">--}}
        {{--<input type="hidden" name="locale" value="{{ $payment_fields['LOCALE'] }}">--}}
        {{--<input type="hidden" name="signature" value="{{ $payment_fields['SIGN'] }}">--}}
        {{--<input type="hidden" name="hideOtherMethods"--}}
        {{--value="{{ config('unitpay.hideOtherMethods','false') }}">--}}
        {{--<button type="submit" class="btn btn_order">Наличными через Евросеть, Связной.</button>--}}
        {{--</form>--}}
        {{--</div>--}}
        {{--@endif--}}

        {{--@if (config('unitpay.payment_forms')['webmoney'])--}}
        {{--<div class="form-group">--}}
        {{--<form action="https://unitpay.ru/pay/{{ $payment_fields['PUB_KEY'] }}/webmoney" method="POST"--}}
        {{--class="form unitpay-form">--}}
        {{--<input type="hidden" name="sum" value="{{ $payment_fields['PAYMENT_AMOUNT'] }}">--}}
        {{--<input type="hidden" name="account" value="{{ $payment_fields['PAYMENT_NO'] }}">--}}
        {{--<input type="hidden" name="desc" value="{{ $payment_fields['ITEM_NAME'] }}">--}}
        {{--<input type="hidden" name="currency" value="{{ $payment_fields['CURRENCY'] }}">--}}
        {{--<input type="hidden" name="locale" value="{{ $payment_fields['LOCALE'] }}">--}}
        {{--<input type="hidden" name="signature" value="{{ $payment_fields['SIGN'] }}">--}}
        {{--<input type="hidden" name="hideOtherMethods"--}}
        {{--value="{{ config('unitpay.hideOtherMethods','false') }}">--}}
        {{--<button type="submit" class="btn btn_order">WebMoney</button>--}}
        {{--</form>--}}
        {{--</div>--}}
        {{--@endif--}}
    </div>
@endsection

@section('scripts')
    @parent
    <script src="https://widget.unitpay.ru/unitpay.js"></script>
    <script type="text/javascript">
        this.pay = function () {
            var payment = new UnitPay();
            payment.createWidget({
                publicKey: "119561-a829f",
                sum: 1,
                account: "demo",
                signature: "95ef219c8164c91145a4e49a3a0d3b6aa747962a11c1f50fa8aebacfa0563ecd",
                desc: "Описание платежа",
                locale: "ru",
            });
            payment.success(function (params) {
                console.log('Успешный платеж');
            });
            payment.error(function (message, params) {
                console.log(message);
            });
            return false;
        };
    </script>
@endsection
