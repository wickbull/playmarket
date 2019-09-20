@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Freekassa история
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
                            <h3 class="panel-title"><strong>FreeKassa:</strong>
                            </h3>
                        </div>
                        <table id="dataTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID транзакции</th>
                                <th>ID FreeKassa(INTID)</th>
                                <th>Дата</th>
                                <th>Статус</th>
                                <th>Тип транзакции</th>
                                <td>Сумма</td>
                                <td>Инфо</td>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($history->item as $data)
                                <tr>
                                    <td>{{$data->id}}</td>
                                    <td>{{$data->intid}}</td>
                                    <td>{{\Carbon\Carbon::parse($data->date)->format('d.m.Y G:i:s')}}</td>
                                    <td>{{$data->status}}</td>
                                    <td>@if($data->cur_id == '94')VISA/MASTERCARD RUB (комиссия
                                        4.00%)@elseif($data->cur_id == '82')Мобильный Платеж Мегафон (комиссия 1.00%)
                                        @elseif($data->cur_id == '84')    Мобильный Платеж МТС (комиссия 1.00%)
                                        @elseif($data->cur_id == '132')    Мобильный Платеж Tele2 (комиссия 1.00%)
                                        @elseif($data->cur_id == '83')    Мобильный Платеж Билайн (комиссия
                                            1.00%)
                                        @else {{$data->cur_id}} (<a
                                                    href="https://www.free-kassa.ru/docs/api.php#result_sign"
                                            >Проверить</a>)
                                        @endif</td>
                                    <td>{{$data->amount}}&#8381;</td>
                                    <td>{{$data->description}}</td>
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