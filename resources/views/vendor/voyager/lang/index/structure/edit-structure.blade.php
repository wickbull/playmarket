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
                        <h3 class="panel-title"><i class="icon wb-book">Редактирование структуры</i></h3>
                        <div class="panel-actions">
                            <a class="panel-action voyager-resize-full" data-toggle="panel-fullscreen" aria-hidden="true"></a>
                        </div>
                    </div>

                    <div class="panel-body">

                        <form action="submit-edit-structure" method="POST">
                            {!! csrf_field() !!}

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="name">Название</label>
                                    <input type="text" name="name" class="form-control" id="name" value="{{$lang->name}}">
                                </div>
                                <button type="submit" class="btn btn-primary pull-right">
                                    <i class="icon wb-plus-circle"></i> Изменить
                                </button>
                            </div>
                            
                        </form>

                    </div>
                    
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
