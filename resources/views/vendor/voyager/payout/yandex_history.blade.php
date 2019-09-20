@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Yandex история
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
                            <h3 class="panel-title"><strong>Yandex:</strong> {{$yandexBalance['yandex_wallet']}} -
                                <strong>{{$yandexBalance['balance']}}&#8381;</strong>
                            </h3>
                        </div>
                        <table id="dataTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID транзакции</th>
                                <th>Дата</th>
                                <th>Статус</th>
                                <th>Тип транзакции</th>
                                <td>Сумма</td>
                                <td>Инфо</td>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($history->operations as $data)
                                <tr>
                                    <td>{{$data->operation_id}}</td>
                                    <td>{{\Carbon\Carbon::parse($data->datetime)->format('d.m.Y G:i:s')}}</td>
                                    <td>{{$data->status}}</td>
                                    <td>{{$data->direction}}</td>
                                    <td>{{$data->amount}}&#8381;</td>
                                    <td>{{$data->title}}</td>
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