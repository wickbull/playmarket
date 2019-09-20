@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Webmoney история
        <a href="{{route('payout.index')}}">Назад</a>
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
                        <div class="panel-heading">
                            {{--<h3 class="panel-title"><strong>Qiwi:</strong> {{$qiwiBalance['qiwi_wallet']}} ---}}
                            {{--<strong>{{$qiwiBalance['balance']}}&#8381;</strong>--}}
                            {{--</h3>--}}
                        </div>
                        <table id="dataTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID транзакции</th>
                                <th>Номер кошелька получателя</th>
                                <th>Номер кошелька отправителя</th>
                                <th>Сумма</th>
                                <th>Invoice ID</th>
                                <th>Order ID</th>
                                <td>Описание</td>
                                <td>Дата</td>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($history as $data)
                                <tr>
                                    <td>{{$data->getTransactionId()}}</td>
                                    <td>{{$data->getPayeePurse()}}</td>
                                    <td>{{$data->getPayerPurse()}}</td>
                                    <td>{{$data->getAmount()}}&#8381;</td>
                                    <td>{{$data->getInvoiceId()}}</td>
                                    <td>{{$data->getOrderId()}}</td>
                                    <td>{{$data->getDescription()}}</td>
                                    <td>{{$data->getCreateDateTime()->format('Y-m-d H:i:s')}}</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

@stop

@section('javascript')
    <script>

        $('div.alert').delay(3000).slideUp(300);
    </script>
@stop