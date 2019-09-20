@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Платежи
        {{--<a href="{{ route('add-game') }}" class="btn btn-success">--}}
            {{--<i class="voyager-plus"></i> Добавить игру--}}
        {{--</a>--}}
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
                        <table id="dataTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>InvoiceID</th>
                                <th>Пользователь</th>
                                <th>Тип</th>
                                <th>Инфо</th>
                                <th>Цена</th>
                                <th>Валюта</th>
                                <th>Статус</th>
                                <th>Дата оплаты</th>
                                <th class="actions">Действие</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($invoices as $invoice)
                                <tr>
                                    <td>{{ $invoice->id }}</td>
                                    <td>{{ $invoice->invoice_id }}</td>
                                    <td>{{$invoice->user->name}} (Баланс: {{$invoice->user->balance}})<a
                                                href="{{route('users-trade-admin',['id' => $invoice->user->id])}}"
                                                class="btn-sm btn-success pull-right">
                                            <i class="voyager-umbrella"></i> Сделки
                                        </a></td>
                                    <td>{{$invoice->type == 'in'?'Ввод':'Вывод'}}</td>
                                    <td> @if(!empty($invoice->trade) &&!empty($invoice->trade->lot))<a
                                                href="{{route('edit-lot',['id' => $invoice->trade->lot->id])}}">Лот</a>
                                        <br>@endif
                                        @if(!empty($invoice->trade))<a
                                                href="{{route('trade-by-id-admin',['id' => $invoice->trade->id])}}">Сделка</a>@endif
                                    </td>
                                    <td>{{$invoice->price}}</td>
                                    <td>@if(!empty($invoice->currency))<a
                                                href="{{route('edit-commission',['id' => $invoice->currency->id])}}">{{$invoice->currency->title}}</a>
                                        <br>@endif
                                        {{$invoice->payment_type}}
                                    </td>
                                    @if($invoice->status == '1')
                                        <td class="success">Оплачено</td>
                                    @else
                                        <td class="warning">Не оплачено</td>
                                    @endif
                                    <td>@if($invoice->payment_date != ''){{ localeDate($invoice->payment_date, 'd.m.Y h:i A') }}@else
                                            - @endif</td>
                                    <td>
                                        @if($invoice->payment_type == 'qiwi' && $invoice->status == '0' && $invoice->type == 'in')

                                            <form action="{{route('check.qiwi.payment')}}" method="POST">
                                                {{csrf_field()}}
                                                <input type="hidden" name="orderID" value="{{$invoice->invoice_id}}">
                                                <button type="submit" class="btn btn_blue-white btn_nowrap status-btn">
                                                    Подтвердить
                                                </button>
                                            </form>
                                        @endif
                                    </td>

                                    {{--<td class="no-sort no-click">--}}
                                    {{--</td>--}}
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        {{ $invoices->render() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

@stop

@section('javascript')
@stop