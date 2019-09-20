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
                    <form action="{{route('payment-qiwi-submit',['transactionId' => $transactionId] )}}" method="POST">
                        <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group" style="padding-top: 15px;">
                                <label><strong>Номер телефона</strong></label>
                                <input type="text" name="phone" value="{{old('phone')}}" required
                                       class="form-control"
                                       placeholder="С кодом страны +7 или +380">
                            </div>
                            {{csrf_field()}}
                            <button type="submit"
                                    class="c-my-sales__filter-submit btn btn_blue btn_upper text-center">
                                Оплатить
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
