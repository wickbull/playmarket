@extends('voyager::master')



@section('css')
    <style>
        .panel .mce-panel {
            border-left-color: #fff;
            border-right-color: #fff;
        }

        .panel .mce-toolbar,
        .panel .mce-statusbar {
            padding-left: 20px;
        }

        .panel .mce-edit-area,
        .panel .mce-edit-area iframe,
        .panel .mce-edit-area iframe html {
            padding: 0 10px;
            min-height: 350px;
        }

        .mce-content-body {
            color: #555;
            font-size: 14px;
        }

        .panel.is-fullscreen .mce-statusbar {
            position: absolute;
            bottom: 0;
            width: 100%;
            z-index: 200000;
        }

        .panel.is-fullscreen .mce-tinymce {
            height:100%;
        }

        .panel.is-fullscreen .mce-edit-area,
        .panel.is-fullscreen .mce-edit-area iframe,
        .panel.is-fullscreen .mce-edit-area iframe html {
            height: 100%;
            position: absolute;
            width: 99%;
            overflow-y: scroll;
            overflow-x: hidden;
            min-height: 100%;
        }
    </style>
@stop

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-lock"></i> {{$lang->name}}
    </h1>
    {{--@include('voyager::multilingual.language-selector')--}}
@stop

@section('content')
    <div class="page-content container-fluid">

        


            
            
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="icon wb-book">Управление структурой</i></h3>
                        <div class="panel-actions">
                            <a class="panel-action voyager-resize-full" data-toggle="panel-fullscreen" aria-hidden="true"></a>
                        </div>
                    </div>

                    <div class="panel-body">

                        <form action="structure/add-structure" method="POST">
                            {!! csrf_field() !!}
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="index" placeholder="Создать структуру" value="">
                                </div>
                            </div>
                            
                            <div class="col-md-1 pull-right">
                                <button type="submit" class="btn btn-primary pull-right">
                                    <i class="icon wb-plus-circle"></i> Создать структуру
                                </button>
                            </div>
                        </form>

                    </div>
                    
                    <div class="panel-body">

                        <div class="col-md-12">
                            <div class="panel panel-bordered">
                                <div class="panel-body">
                                    <div id="dataTable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                                        
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <table id="dataTable" class="table table-hover dataTable no-footer" role="grid" aria-describedby="dataTable_info">
                                                    
                                                    <thead>
                                                        <tr role="row">
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="name: activate to sort column ascending" style="width: 312px;">Структура</th>
                                                            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="name: activate to sort column ascending" style="width: 312px;">Перевод</th>
                                                            <th class="actions sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Actions: activate to sort column ascending" style="width: 1326px;">Действие</th>
                                                        </tr>
                                                    </thead>
                                                    
                                                    <tbody>
                                                        
                                                        @foreach($lang->structure as $value)
                                                            <tr role="row" class="odd">
                                                                <td>
                                                                    {{$value->name}}
                                                                    
                                                                </td>
                                                                <td>
                                                                    {{@$value->langTranslate->where('lang_id', $id)->first()->name}}
                                                                </td>
                                                                <td class="no-sort no-click">
                                                                    <a href="structure/{{ $value->id }}/delete-structure" class="btn-sm btn-danger pull-right delete">
                                                                        <i class="voyager-edit"></i> Удалить
                                                                    </a>
                                                                    <a href="structure/{{ $value->id }}/edit-structure" class="btn-sm btn-primary pull-right edit">
                                                                        <i class="voyager-edit"></i> Редактировать
                                                                    </a>
                                                                    <a href="structure/{{ $value->id }}/translate" class="btn-sm btn-success pull-right add">
                                                                        <i class="voyager-edit"></i> Добавить или изменить перевод
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        @endforeach

                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        {{--@if(!!$lang->langStructure->count())
                            <div class="com-md-12">
                                @foreach($lang->langStructure()->orderBy('page')->get() as $structure)
                                    <div class="col-md-12">
                                        <form action="/admin/lang/edit-map-lang/{{$lang->id}}">
                                            {!! csrf_field() !!}
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="key" placeholder="КЛЮЧ" value="{{$structure->key}}">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="value" placeholder="ТЕКСТ" value="{{$structure->value}}">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="page" placeholder="МЕСТО" value="{{$structure->page}}">
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                            <!-- <div class="col-md-1 pull-right"> -->
                                                <button type="submit" class="btn btn-primary pull-right">
                                                    <i class="icon wb-plus-circle"></i> Update
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                        
                                @endforeach
                            </div>

                        @elseif(!!$structure->count())--}}
                        {{--
                            <div class="com-md-12">
                                @foreach($structure as $struct)
                                    <div class="col-md-12">
                                        <form action="/admin/lang/edit-map-lang/{{$lang->id}}">
                                            {!! csrf_field() !!}
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="key" placeholder="КЛЮЧ" value="{{$struct->key}}">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="value" placeholder="ТЕКСТ" value="">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="page" placeholder="МЕСТО" value="{{$struct->page}}">
                                                </div>
                                            </div>
                                            <div class="col-md-1">
                                                <button type="submit" class="btn btn-primary pull-right">
                                                <!-- <button type="submit" class="btn btn-primary pull-right"> -->
                                                    <i class="icon wb-plus-circle"></i> Update
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                @endforeach
                            </div>

                        @endif--}}
                        
                    </div>

                    <hr>

                    

                </div>
            </div>
        </div>

        
        
    </div>
@stop

@section('javascript')
    <script>
        $('document').ready(function () {
            $('#slug').slugify();

            // $('.side-body').multilingual({"editing": true});
        });
    </script>
    
    <script src="{{ voyager_asset('lib/js/tinymce/tinymce.min.js') }}"></script>
    <script src="{{ voyager_asset('js/voyager_tinymce.js') }}"></script>
    <script src="{{ voyager_asset('js/slugify.js') }}"></script>
@stop
