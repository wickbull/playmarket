@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Все чаты
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
                                <th>Учатсники чата</th>
                                <th>Количество сообщений</th>
                                <th class="actions">Действие</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($chats as $data)
                                <tr>
                                    <td>{{$data->id}}</td>
                                    <td>@foreach($data->dialogParticipants as $item)
                                            <a target="_blank" href="{{route('user-profile',['id' => $item->users->id])}}">{{$item->users->name}}</a>
                                            <a target="_blank" href="{{route('user-admin-edit',['id' => $item->users->id])}}"
                                               class="btn btn-default">Редактировать</a><br>
                                        @endforeach</td>
                                    <td>
                                        {{$data->messages_count}}
                                    </td>
                                    <td>
                                        <a href="{{route('chat-by-id-admin',['id' => $data->id])}}"
                                           class="btn btn-default">Просмотр чата</a></td>
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