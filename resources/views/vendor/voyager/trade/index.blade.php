@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Сделки @if(isset($user) && !empty($user))Пользователя: {{$user->name}}({{$user->email}})@endif
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
                                <th>Владелец</th>
                                <th>Покупатель</th>
                                <th>Цены<br>(Пользователь получит)</th>
                                <th>Игра</th>
                                <th>Сервер</th>
                                <th>Тег</th>
                                <th>Статус</th>
                                <th>Дата создания</th>
                                <th class="actions">Действие</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($trades as $item)
                                <tr>
                                    <td>{{ $item->id }}</td>
                                    <td><a target="_blank"
                                           href="{{route('user-profile',['id' => $item->owner->id])}}">{{$item->owner->name}}</a>
                                        (Баланс: {{$item->owner->balance}})
                                        <br>
                                        <a href="{{route('invoice.user.show',['id' => $item->owner->id])}}"
                                           class="btn-sm btn-default">
                                            <i class="voyager-dollar"></i> Платежи
                                        </a>
                                        <a href="{{route('users-trade-admin',['id' => $item->owner->id])}}"
                                           class="btn-sm btn-success">
                                            <i class="voyager-umbrella"></i> Сделки
                                        </a>
                                        <a target="_blank"
                                           href="{{route('user-admin-edit',['id' => $item->owner->id])}}"
                                           class="btn btn-default">Редактировать</a></td>
                                    <td><a target="_blank"
                                           href="{{route('user-profile',['id' => $item->buyer->id])}}">{{$item->buyer->name}}</a>
                                        (Баланс: {{$item->buyer->balance}})
                                        <br>
                                        <a href="{{route('invoice.user.show',['id' => $item->buyer->id])}}"
                                           class="btn-sm btn-default">
                                            <i class="voyager-dollar"></i> Платежи
                                        </a>
                                        <a href="{{route('users-trade-admin',['id' => $item->buyer->id])}}"
                                           class="btn-sm btn-success">
                                            <i class="voyager-umbrella"></i> Сделки
                                        </a>
                                        <a target="_blank"
                                           href="{{route('user-admin-edit',['id' => $item->buyer->id])}}"
                                           class="btn btn-default">Редактировать</a></td>
                                    <td>{{$item->price}} {{$item->paymentCurrency->symbol}}
                                        <br>({{isset($item->amount_clear)?$item->amount_clear:null}} &#8381;)
                                    </td>
                                    <td>@if(!empty($item->lot)){{$item->lot->game->name}}@if(!empty($item->lot->game->region))
                                            ({{$item->lot->game->region}})@endif @endif</td>
                                    <td>@if(!empty($item->lot)){{$item->lot->server->name}} @endif</td>
                                    <td>@if(!empty($item->lot)){{isset($item->lot->tag->name) ? $item->lot->tag->name : $item->lot->currency->name}} @endif</td>
                                    <td>
                                        @if($item->status == 1)
                                            <span>Открытый</span>
                                        @elseif($item->is_payed == 0 && $item->status == 1)
                                            <span style="color:blue;">Ожидание оплаты</span>
                                        @elseif($item->status == 3)
                                            <span style="color:red;">Возврат</span>
                                        @else
                                            <span style="color:green;">Закрыт</span>
                                        @endif
                                    </td>
                                    <td>{{ localeDate($item->created_at, 'd.m.Y h:i A') }}</td>
                                    <td class="no-sort no-click">
                                        <div class="btn-sm btn-danger pull-right delete" data-id="{{ $item->id }}"
                                             id="delete-{{ $item->id }}">
                                            <i class="voyager-trash"></i> Удалить
                                        </div>
                                        <a href="{{route('trade-by-id-admin',['id' => $item->id])}}"
                                           class="btn-sm btn-primary pull-right edit">
                                            <i class="voyager-edit"></i> Ред.
                                        </a>
                                        @if(!empty($item->lot)) <a href="{{route('edit-lot',['id' => $item->lot->id])}}"
                                                                   class="btn-sm btn-success pull-right edit">
                                            <i class="voyager-edit"></i>Лот
                                        </a> @endif
                                        <a href="{{route('chat-by-user-id-admin',['first_user_id' => $item->owner->id,'second_user_id' => $item->buyer->id])}}"
                                           class="btn-sm btn-default pull-right edit">
                                            <i class="voyager-edit"></i>Чат
                                        </a>

                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        {{ $trades->render() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i> Вы уверены, что хотите удалить?</h4>
                </div>
                <div class="modal-footer">
                    <form action="/admin/delete-lot" id="delete_form" method="POST">
                        {{ method_field("DELETE") }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm"
                               value="Да, удалить это">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Отмена</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
@stop

@section('javascript')
    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable({"bPaginate": false,"order": []},);
        });
        $('td').on('click', '.delete', function (e) {
            var form = $('#delete_form')[0];

            form.action = parseActionUrl(form.action, $(this).data('id'));

            $('#delete_modal').modal('show');
        });

        function parseActionUrl(action, id) {
            return action.match(/\/[0-9]+$/)
                ? action.replace(/([0-9]+$)/, id)
                : action + '/' + id;
        }

        $('div.alert').delay(3000).slideUp(300);
    </script>
@stop