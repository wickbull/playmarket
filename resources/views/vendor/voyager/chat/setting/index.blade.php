@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Настройки чата
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
                                <th>Название</th>
                                <th>Keyword</th>
                                <th>Значения</th>
                                <th>Активировать</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($chat_settings as $data)
                                <tr>
                                    <td>{{ucwords($data->title)}}</td>
                                    <td>{{$data->keyword}}</td>
                                    <td>@if($data->is_active)
                                            Активировано
                                        @else
                                            Деактивировано
                                        @endif</td>
                                    <td>{{$data->value}}</td>
                                    <td>
                                        <a href="{{route('chat-setting-edit',['id' => $data->id])}}"
                                           class="btn-sm btn-primary pull-right edit">
                                            <i class="voyager-edit"></i> Редактировать
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    @if($chat_settings instanceof \Illuminate\Pagination\LengthAwarePaginator )
                        <div class="panel-footer">
                            {{ $chat_settings->render() }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>


@stop

@section('javascript')
@stop