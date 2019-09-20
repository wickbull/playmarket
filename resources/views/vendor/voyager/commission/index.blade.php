@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Список валюты (Коммисси)
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
                                <th>Назва</th>
                                <th>Статус</th>
                                <th>Коефициент</th>
                                <th>Комисия</th>
                                <td>Возможность вывода</td>
                                <th class="actions">Действия</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($commission as $data)
                                <tr>
                                    <td>{{ucwords($data->title)}}</td>
                                    <td>@if($data->is_active)
                                            Активировано
                                        @else
                                            Деактивировано
                                        @endif</td>
                                    <td>{{ $data->coefficient or '0'}}</td>
                                    <td>Сайт: {{ $data->site or '0'}}%,<br>
                                        Платежка: {{$data->payment or '0'}}%,<br>
                                        Ввод: {{$data->withdrawal or '0'}}%,<br>
                                        Другое: {{$data->other or '0'}}%,<br>
                                        <b>СУММА: {{$data->site+$data->payment+$data->withdrawal+$data->other}}%</b><br>
                                        <b>Вывод с Баланса: {{$data->output_commission}}%</b>
                                    </td>
                                    <td>
                                        @if($data->can_withdrawal == '1')
                                            Да
                                        @else
                                            Нет
                                        @endif
                                    </td>
                                    <td class="no-sort no-click">
                                        <div class="btn-sm btn-danger pull-right delete" data-id="{{ $data->id }}"
                                             id="delete-{{ $data->id }}">
                                            <i class="voyager-trash"></i> Удалить
                                        </div>
                                        <a href="{{route('edit-commission',['id' => $data->id])}}"
                                           class="btn-sm btn-primary pull-right edit">
                                            <i class="voyager-edit"></i> Редактировать
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <div class="panel-footer">
                        {{ $commission->render() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{--<div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">--}}
        {{--<div class="modal-dialog">--}}
            {{--<div class="modal-content">--}}
                {{--<div class="modal-header">--}}
                    {{--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--}}
                                {{--aria-hidden="true">&times;</span></button>--}}
                    {{--<h4 class="modal-title"><i class="voyager-trash"></i> Are you sure you want to delete?</h4>--}}
                {{--</div>--}}
                {{--<div class="modal-footer">--}}
                    {{--<form action="/admin/delete-currency" id="delete_form" method="POST">--}}
                        {{--{{ method_field("DELETE") }}--}}
                        {{--{{ csrf_field() }}--}}
                        {{--<input type="submit" class="btn btn-danger pull-right delete-confirm"--}}
                               {{--value="Yes, Delete This">--}}
                    {{--</form>--}}
                    {{--<button type="button" class="btn btn-default pull-right" data-dismiss="modal">Cancel</button>--}}
                {{--</div>--}}
            {{--</div><!-- /.modal-content -->--}}
        {{--</div><!-- /.modal-dialog -->--}}
    {{--</div><!-- /.modal -->--}}

@stop

@section('javascript')
    <script>
        $(document).ready(function () {
            $('#dataTable').DataTable({"bPaginate": false});;
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