@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Заявки на вывод<br>
        @if(\Route::current()->getName() == 'payout.frozen')
            <a href="{{route('payout.index')}}">Платежи</a>
        @else
            <a href="{{route('payout.frozen')}}">Замороженные платежи</a>

        @endif

    </h1>
    @if (Session::has('flash_message_success'))
        <div class="alert alert-success">{{Session::get('flash_message_success') }}</div>
    @elseif(Session::has('flash_message_error'))
        <div class="alert alert-danger">{{Session::get('flash_message_error') }}</div>
    @endif
@stop

@section('content')

    <div class="page-content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <h3 class="panel-title"><strong>Qiwi:</strong> {{$qiwiBalance['qiwi_wallet']}} -
                            <strong>{{$qiwiBalance['balance']}}&#8381;</strong>
                            <button class="btn btn-default"><a
                                        href="{{route('payout.qiwi.history')}}">История платежей</a></button>
                            <br>
                            <strong>Yandex:</strong> {{$yandexBalance['yandex_wallet']}} -
                            <strong>{{$yandexBalance['balance']}}&#8381;</strong>
                            <button class="btn btn-default"><a
                                        href="{{route('payout.yandex.history')}}">История платежей</a></button>
                            <br>
                            <strong>FreeKassa:</strong> {{$freeKassaBalance['yandex_wallet']}} -
                            <strong>{{$freeKassaBalance['balance']}}&#8381;</strong>
                            <button class="btn btn-default"><a
                                        href="{{route('payout.freekassa.history')}}">История платежей</a></button>
                            <br>
                            <strong>Webmoney:</strong> {{$webmoneyBalance['webmoney_wallet']}} -
                            <strong>{{$webmoneyBalance['balance']}}&#8381;</strong>
                            <button class="btn btn-default"><a
                                        href="{{route('payout.webmoney.history')}}">История платежей</a></button>

                        </h3>                        <table id="dataTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Пользователь</th>
                                <th>Инфо</th>
                                <th>Тип</th>
                                <th>Сумма</th>
                                <th>Валюта</th>
                                <th>Статус</th>
                                <th>Дата обработки</th>
                                {{--<th class="actions">Действие</th>--}}
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($payouts as $payout)
                                <tr @if($payout->status)  class="success"
                                    @elseif($payout->frozen) class="warning"
                                    @elseif($payout->user->is_block_payment == 1) class="danger"@endif>
                                    <td>{{ $payout->id }}</td>
                                    <td>@if(!empty($payout->user))Email: <a
                                                href="{{route('user-admin-edit',['id' => $payout->user->id])}}">{{ $payout->user->email }}</a>
                                        <br>
                                        Login: {{$payout->user->name}}<br>
                                        Баланc: {{$payout->user->balance or 0}}₽<br>
                                        {{$payout->user->is_block_payment == 1?'Пользователь заблокирован для вывод средств.':null}}
                                        @endif
                                        <a href="{{route('invoice.user.show',['id' => $payout->user->id])}}"
                                           class="btn-sm btn-danger pull-right">
                                            <i class="voyager-dollar"></i> Платежи
                                        </a>
                                        <a href="{{route('users-trade-admin',['id' => $payout->user->id])}}"
                                           class="btn-sm btn-success pull-right">
                                            <i class="voyager-umbrella"></i> Сделки
                                        </a>

                                    </td>
                                    <td>Кошель: {{$payout->wallet}}
                                    </td>
                                    <td>
                                        {{$payout->currency->title}}
                                    </td>
                                    <td>{{$payout->amount}}
                                        {{$payout->currency->symbol}}
                                    </td>
                                    <td>
                                        {{$payout->currency->symbol}}
                                    </td>
                                    <td>
                                        @if($payout->status)
                                            Обработан
                                        @else
                                            В ожидание
                                        @endif
                                    </td>
                                    <td>
                                        @if(!empty($payout->confirm_date))
                                            {{$payout->confirm_date->format('d-m-Y G:i')}}
                                        @else
                                            @if($payout->frozen != '1')
                                                <form action="{{route('payout.updateFrozen',['payout' => $payout['id']])}}"
                                                      method="POST">
                                                    {{csrf_field()}}
                                                    {{method_field('PUT')}}
                                                    <button class="btn btn-sm btn-warning">Заморозить</button>
                                                </form>
                                            @endif
                                            <form action="{{route('payout.update',['payout' => $payout['id']])}}"
                                                  method="POST">
                                                {{csrf_field()}}
                                                {{method_field('PUT')}}
                                                <button {{!empty($payout->user)&&$payout->user->is_block_payment == 1?'disabled':null}}class="btn btn-sm btn-success">
                                                    Обработать
                                                </button>
                                            </form>
                                            @if($payout->frozen == '1')
                                                <form action="{{route('payout.destroy',['payout' => $payout['id']])}}"
                                                      method="POST">
                                                    {{csrf_field()}}
                                                    {{method_field('DELETE')}}
                                                    <button class="btn btn-sm btn-danger">Удалить</button>
                                                </form>
                                            @endif
                                        @endif
                                    </td>


                                    {{--<td>{{ $payout->invoice_id }}</td>--}}
                                    {{--<td>{{$payout->user->name}}</td>--}}
                                    {{--<td> @if(!empty($invoice->trade) &&!empty($invoice->trade->lot))<a--}}
                                    {{--href="{{route('edit-lot',['id' => $invoice->trade->lot->id])}}">Лот</a>--}}
                                    {{--<br>@endif--}}
                                    {{--@if(!empty($invoice->trade))<a--}}
                                    {{--href="{{route('trade-by-id-admin',['id' => $invoice->trade->id])}}">Сделка</a>@endif--}}
                                    {{--</td>--}}
                                    {{--<td>{{$invoice->price}}</td>--}}
                                    {{--<td>@if(!empty($invoice->currency))<a--}}
                                    {{--href="{{route('edit-commission',['id' => $invoice->currency->id])}}">{{$invoice->currency->title}}</a>--}}
                                    {{--<br>@endif--}}
                                    {{--{{$invoice->payment_type}}--}}
                                    {{--</td>--}}
                                    {{--<td>@if($invoice->status == '1')Оплачено@else Не оплачено @endif</td>--}}
                                    {{--<td>@if($invoice->payment_date != ''){{ localeDate($invoice->payment_date, 'd.m.Y h:i A') }}@else--}}
                                    {{--- @endif</td>--}}
                                    {{--<td class="no-sort no-click">--}}
                                    {{--</td>--}}
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        {{ $payouts->render() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

@stop

@section('javascript')
@stop