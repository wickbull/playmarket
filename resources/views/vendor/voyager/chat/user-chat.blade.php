@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Чаты пользователя - {{$user->name}}
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
                                <th>Имя совбеседника</th>
                                <th>Email</th>
                                <th class="actions">Действие</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($chats as $data)
                                <tr>
                                    <td>{{$data->name}}</td>
                                    <td>{{$data->email}}</td>
                                    <td>
                                        <a href="{{route('chat-by-id-admin',['id' => $data->participants->first()->dialog_id])}}"
                                           class="btn btn-default">Читать чат</a></td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    @if($chats instanceof \Illuminate\Pagination\LengthAwarePaginator )
                        <div class="panel-footer">
                            {{ $chats->render() }}
                        </div>
                    @endif
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