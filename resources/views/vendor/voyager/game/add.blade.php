@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Добавить игру
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Добавить новую игру</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('save-game') }}"
                          method="POST" enctype="multipart/form-data">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">
                            <div class="col-md-6 form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Назва</div>
                                <div class="input-wrap">
                                    <input type="name" name="name" value="{{ old('name') }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('name'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('name') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-md-6 form-group{{ $errors->has('region') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Пример региона (RU, EU, Free)</div>
                                <div class="input-wrap">
                                    <input type="name" name="region" value="{{ old('region') }}"
                                           class="form-control"/>
                                    @if ($errors->has('region'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('region') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('tags') ? ' has-error' : '' }} col-md-5">
                                <div class="form-group__ttl">Теги</div>
                                <div class="input-wrap">
                                    <select multiple="multiple" data-live-search="true" class="selectpicker" name="tags[]" id="tags">
                                        @foreach($tags as $aKey => $tag)
                                                <option value="{{$tag->id}}"
                                                >{{$tag->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('currency') ? ' has-error' : '' }} col-md-4">
                                <div class="form-group__ttl">Валюта</div>
                                <div class="input-wrap">
                                    <select  data-live-search="true" class="selectpicker1" name="currency[]" id="currency" multiple>
                                        @foreach($currency as $cur)
                                            <option value="{{ $cur->id }}">{{$cur->name}} @if(!empty($cur->unity))
                                                    ({{$cur->unity}})@endif</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 form-group{{ $errors->has('region') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Сервера</div>
                                <div class="input-wrap server-input">
                                    <input type="text" name="servers[]" placeholder="Сервер" value="" class="form-control"/>
                                    <input type="text" placeholder="Сторона(необязательное)" name="side[]" class="form-control"/><br>
                                </div>
                                <a href="#" class="btn btn-primary btn-sm add-more">Добавить ещё</a>

                                @if ($errors->has('servers'))
                                    <span class="help-block">
                                                    <strong>{{ $errors->first('servers') }}</strong>
                                                </span>
                                @endif
                            </div>
                            <div class="col-md-12 form-group{{ $errors->has('description') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Описания игры</div>
                                <div class="input-wrap">
                                    <textarea type="text" name="description" class="form-control richTextBox">{!! old('description') !!}</textarea>
                                    @if ($errors->has('description'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('description') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                        </div><!-- panel-body -->
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary">Сохранить</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@stop

@section('javascript')

    <script src="{{ voyager_asset('lib/js/tinymce/tinymce.min.js') }}"></script>
    <script src="{{ voyager_asset('js/voyager_tinymce.js') }}"></script>
    <script src="{{ voyager_asset('js/slugify.js') }}"></script>

    <script>
        $(document).ready(function() {
            $('.selectpicker').select2();
            $('.selectpicker1').select2();
        });

        $(document).on('click', '.add-more', function (e) {
            e.preventDefault();

            var index = $('input[name=servers]').length;

            $('<input>').attr({
                type: 'text',
                placeholder: 'Сервер',
                name: 'servers[]',
                class: 'form-control'
            }).appendTo('.server-input');
            $('<input>').attr({
                type: 'text',
                placeholder: 'Сторона(необязательное)',
                name: 'side[]',
                class: 'form-control'
            }).appendTo('.server-input');
            $("<a />", {
                class : "remove-input",
                href : "#",
                text : "Удалить"
            }).appendTo('.server-input')
        });
        $(document).on('click', '.remove-input', function (e) {
            e.preventDefault();
            $(this).prev().remove();
            $(this).prev().remove();
            $(this).remove();
        })
    </script>

@stop