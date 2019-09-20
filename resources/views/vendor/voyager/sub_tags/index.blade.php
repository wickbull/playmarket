@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Список под тегов
        <a href="{{ route('add-sub-tag') }}" class="btn btn-success">
            <i class="voyager-plus"></i> Добавить под тег
        </a>
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
                                <th>Игра</th>
                                <th>Тег</th>

                                <th>Создано</th>
                                <th class="actions">Действие</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($sub_tags as $data)
                                <tr>
                                    <td>{{ucwords($data->name)}} @if(!empty($data->attachTagMetadata))
                                            ({{$data->attachTagMetadata->name}}) @endif
                                        <br>
                                        Приоритет:{{$data->priority}}
                                    </td>
                                    @foreach($data->games as $game)
                                        <td>{{ $game->name }}@if(!empty($game->region))({{$game->region}})@endif</td>
                                    @endforeach
                                    @foreach($data->tags as $tag)
                                        <td>{{ $tag->name }}</td>
                                    @endforeach
                                    <td>{{ \Carbon\Carbon::parse($data->created_at)->format('F jS, Y h:i A') }}</td>
                                    <td class="no-sort no-click">
                                        <div class="btn-sm btn-danger pull-right delete" data-id="{{ $data->id }}"
                                             id="delete-{{ $data->id }}">
                                            <i class="voyager-trash"></i> Удалить
                                        </div>
                                        <a href="/admin/edit-sub-tag/{{$data->id}}"
                                           class="btn-sm btn-primary pull-right edit">
                                            <i class="voyager-edit"></i> Редактировать
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    @if($sub_tags instanceof \Illuminate\Pagination\LengthAwarePaginator )
                        <div class="panel-footer">
                            {{ $sub_tags->render() }}
                        </div>
                    @endif
                    {{--<div class="panel-footer">--}}
{{--                        {{ $sub_tags->render() }}--}}
                    {{--</div>--}}
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
                    <form action="/admin/delete-sub-tag" id="delete_form" method="POST">
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
            $('#dataTable').DataTable({"bPaginate": false});
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