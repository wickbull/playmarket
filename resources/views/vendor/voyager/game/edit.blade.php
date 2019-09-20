@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Edit game
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Изменить игру</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('update-game', $game['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="col-md-6 form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Назва</div>
                                <div class="input-wrap">
                                    <input type="name" name="name" value="{{ $game['name'] }}"
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
                                    <input type="name" name="region" value="{{ $game['region'] }}"
                                           class="form-control"/>
                                    @if ($errors->has('region'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('region') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('tags') ? ' has-error' : '' }} col-md-4">
                                <div class="form-group__ttl">Теги</div>
                                <div class="input-wrap">
                                    <select multiple="multiple" data-live-search="true" class="selectpicker" name="tags[]" id="tags">
                                        @foreach($tags as $tag)
                                            <option value="{{ $tag->id }}" @foreach($game->tags as $p) @if($tag->id == $p->id)selected="selected"@endif @endforeach>{{$tag->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 form-group{{ $errors->has('region') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Сервера</div>
                                <div class="input-wrap server-input">
                                    @foreach($game->servers as $item)
                                        <input type="text" name="servers[{{$item->id}}]" placeholder="Сервер"
                                               value="{{$item->name}}"
                                               class="form-control"/>
                                        <input type="text" placeholder="Сторона(необязательное)"
                                               name="side[{{$item->id}}]" value="{{$item->side}}"
                                               class="form-control"/>
                                        <a href="#" data-id="{{$item->id}}" class="remove-input">Удалить</a>
                                        @endforeach
                                </div>
                                <a href="#" class="btn btn-primary btn-sm add-more">Добавить ещё</a>

                                @if ($errors->has('servers'))
                                    <span class="help-block">
                                                    <strong>{{ $errors->first('servers') }}</strong>
                                                </span>
                                @endif
                            </div>
                            <div class="form-group{{ $errors->has('currency') ? ' has-error' : '' }} col-md-4">
                                <div class="form-group__ttl">Валюта</div>
                                <div class="input-wrap">
                                    <select data-live-search="true" class="selectpicker1" name="currency[]" id="currency" multiple>
                                        @foreach($currency as $cur)
                                            <option value="{{ $cur->id }}"
                                                    {{-- 0_o --}}
                                                    @foreach($game->currency as $p) @if($cur->id == $p->id)selected="selected"@endif @endforeach>{{$cur->name}}@if(!empty($cur->unity))
                                                    ({{$cur->unity}})@endif</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>


                                
                            





                            <div class="col-md-12 {{ $errors->has('description') ? ' has-error' : '' }}" style="margin-top: 1em;">
                                
                                <div class="col-md-12">
                                    Кастомные параметры
                                </div>
                                
                                <input type="text" id="customParams" name="customParams" hidden="true">

                                <div id="parameters" class="col-md-12" hidden="true">
                                    
                                    <div class="col-md-3">
                                        <div class="form-group" style="margin-top: 5px;">
                                            <input type="text" class="form-control" id="name" placeholder="Название">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <select class="form-control" id="customInput" style="margin-top: 5px;">
                                            <option value="text">Текст</option>
                                            <option value="checkbox">Чекбокс</option>
                                            <option value="min">Купить минимум предметов</option>
                                            <option value="max">Купить максимум предметов</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3"> 
                                        <div class="form-group" style="margin-top: 5px;">
                                            <input type="text" class="form-control" id="param" placeholder="Параметр">
                                        </div>
                                    </div>
                                    <div class="col-md-3"> 
                                        <a href="#" class="btn btn-danger btn-sm" id="delete-param">Удалить</a>
                                    </div>

                                </div>

                                <div class="col-md-12" id="clone">
                                    <!-- gameParams -->
                                    @foreach($game->gameParams as $value)

                                    <div id="parameters" class="col-md-12">
                                    
                                        <div class="col-md-3">
                                            <div class="form-group" style="margin-top: 5px;">
                                                <input type="text" id="id" value="{{$value->id}}" hidden="true">
                                                <input type="text" class="form-control" id="name_{{$value->id}}" value="{{$value->name}}" placeholder="Название">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <select class="form-control customSelect" id="customInput_{{$value->id}}" value="{{$value->custom_input}}" style="margin-top: 5px;">
                                                <option value="text" @if($value->custom_input == 'text') selected="selected" @endif>Текст</option>
                                                <option value="checkbox" @if($value->custom_input == 'checkbox') selected="selected" @endif>Чекбокс</option>
                                                <option value="min" @if($value->custom_input == 'min') selected="selected" @endif>Купить минимум предметов</option>
                                                <option value="max" @if($value->custom_input == 'max') selected="selected" @endif>Купить максимум предметов</option>
                                            </select>
                                        </div>
                                        <div class="col-md-3"> 
                                            <div class="form-group" style="margin-top: 5px;">
                                                <input type="text" class="form-control" id="param_{{$value->id}}" value="{{$value->param}}" placeholder="Параметр" @if($value->custom_input == 'checkbox') disabled="disabled" @endif>
                                            </div>
                                        </div>
                                        <div class="col-md-3"> 
                                            <a href="#" class="btn btn-danger btn-sm" id="delete-param">Удалить</a>
                                        </div>

                                    </div>

                                    @endforeach


                                </div>

                                
                                    
                            </div>
                           

                            <div class="col-md-12" style="margin-bottom: 1em;">
                                <div class="col-md-3">
                                    <a href="#" class="btn btn-primary btn-sm" id="add-param">Добавить ещё</a>
                                </div>
                            </div>

                           

                            
                                





                                <!-- <div class="form-group__ttl">Дополнительные опции игры</div>
                                <div class="input-wrap server-input">
                                    @foreach($game->servers as $item)
                                        <input type="text" name="servers[{{$item->id}}]" placeholder="Сервер"
                                               value="{{$item->name}}"
                                               class="form-control"/>
                                               name="side[{{$item->id}}]" value="{{$item->side}}"
                                               class="form-control"/>
                                        <a href="#" data-id="{{$item->id}}" class="remove-input">Удалить</a>
                                        @endforeach
                                </div>
                                <a href="#" class="btn btn-primary btn-sm add-more">Добавить ещё</a>

                                @if ($errors->has('servers'))
                                    <span class="help-block">
                                                    <strong>{{ $errors->first('servers') }}</strong>
                                                </span>
                                @endif
                            </div> -->







                            <div class="col-md-12 form-group{{ $errors->has('description') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Описания игры</div>
                                <div class="input-wrap">
                                    <textarea type="text" name="description"
                                              class="form-control richTextBox">{!!  $game['description'] !!}</textarea>
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
                class: "remove-input",
                href: "#",
                text: "Удалить"
            }).appendTo('.server-input')
        });
        $(document).on('click', '.remove-input', function (e) {
            e.preventDefault();
            var item = $(this);

            var id = item.data('id');
            if (id != undefined) {
                $.ajax({
                    url: "/admin/delete-server/ajax/" + id,
                    type: "DELETE",
                    data: {
                        '_token': "{{csrf_token()}}"
                    },
                    statusCode: {
                        500: function () {
                            console.log('Сервер недоступен');
                        }
                    },
                    success: function (data) {
                        item.prev().remove();
                        item.prev().remove();
                        item.remove();
                    },
                    error: function (data) {
                        console.log('Не удалось удалить.');
                        var errors = data.responseJSON;
                        console.log(errors);
                    }
                });
            }
            else {
                item.prev().remove();
                item.prev().remove();
                item.remove();
            }
        })

        var i = 0;

        $(document).on('click', '#add-param', function (e) {
            e.preventDefault();
            var array = $('#customParams').attr('value');
            if(array == undefined) {
                var array = [{name:null, custom_input:'text', param:null}];
            } else {
                var array = JSON.parse(array);
                array[i] = {name:null, custom_input:'text', param:null};
            }
            var custom_parameter    = $("#parameters").clone().appendTo($("#clone")).attr('hidden', false);
            var name                = $(custom_parameter).find('#name').attr('id', "name_"+i);
            var custom_input        = $(custom_parameter).find('#customInput').attr('id', "customInput_"+i);
            var param               = $(custom_parameter).find('#param').attr('id', "param_"+i);
            var custom_param        = $('#customParams').attr('value', JSON.stringify(array));
            i++;
        });

        $(function(){
            var select = $('.customSelect');
            for(var key in select) {
                if(isFinite(key)) {
                    var value = $(select[key])
                    if(value.attr('value') == 'min') {
                        $(value.parent().parent().children()[0]).find('.form-control').prop('disabled', true);
                        for(var index in $('.customSelect')) {
                            if(isFinite(index)) {
                                $($('.customSelect option[value=min]')[index]).prop('disabled', true);
                            }
                        }
                        $('#customInput option[value=min]').prop('disabled', true)
                    } else if(value.attr('value') == 'max') {
                        $(value.parent().parent().children()[0]).find('.form-control').prop('disabled', true);
                        for(var index in $('.customSelect')) {
                            if(isFinite(index)) {
                                $($('.customSelect option[value=max]')[index]).prop('disabled', true);
                            }
                        }
                        $('#customInput option[value=max]').prop('disabled', true);
                    } else console.log(NaN);
                }
            }
        })

        $(document).on('change', function(e) {
            
            var input   = e.target.id.split('_');
            var id      = input[1];
            var name    = input[0];
            var value   = e.target.value;
            var object = !!$('#customParams').attr('value') ? JSON.parse($('#customParams').attr('value')) : '';

            if(!!object[id]) {
                if('name' == name) {
                    object[id].name = value;
                    $('#customParams').attr('value', JSON.stringify(object));
                } else if(('customInput' || 'text' || 'min' || 'max') == name) {
                    object[id].custom_input = value;
                    
                    if(value == 'checkbox')
                    { 
                        $('#param_'+id).prop('disabled', true);
                    }

                    if(value == 'text')
                    { 
                        $('#param_'+id).prop('disabled', false);
                    }

                    if(value == 'min')
                    { 
                        $('#param_'+id).prop('disabled', false);
                        $('#name_'+id).prop('disabled', true);
                        object[id].name = $('#customInput_'+id+' option[value=min]').text();
                        $('#name_'+id).val($('#customInput_'+id+' option[value=min]').text());
                    }

                    if(value == 'max')
                    { 
                        $('#param_'+id).prop('disabled', false);
                        $('#name_'+id).prop('disabled', true);
                        object[id].name = $('#customInput_'+id+' option[value=max]').text();
                        $('#name_'+id).val($('#customInput_'+id+' option[value=max]').text());
                    }

                    $('#customParams').attr('value', JSON.stringify(object));
                } else if('param' == name) {
                    object[id].param = value;
                    $('#customParams').attr('value', JSON.stringify(object));
                }
            } else if(object == '' && !!name) {
                

                if($('#customInput_'+id).val() == 'checkbox') 
                { 
                    $('#param_'+id).prop('disabled', true);
                    $('#name_'+id).prop('disabled', false);
                }
                if($('#customInput_'+id).val() == 'text') 
                {
                    $('#param_'+id).prop('disabled', false);
                    $('#name_'+id).prop('disabled', false);
                }
                if($('#customInput_'+id).val() == 'min')
                {
                    $('#customInput option[value=min]').prop('disabled', true);
                    $('#param_'+id).prop('disabled', false);
                    $('#name_'+id).prop('disabled', true);
                    $('#name_'+id).val($('#customInput_'+id+' option[value=min]').text());
                } 
                if($('#customInput_'+id).val() == 'max')
                { 
                    $('#customInput option[value=max]').prop('disabled', true);
                    $('#param_'+id).prop('disabled', false);
                    $('#name_'+id).prop('disabled', true);
                    $('#name_'+id).val($('#customInput_'+id+' option[value=max]').text());
                }

                var data = {
                    id:             $('#name_'+id).parent().find('#id').val(),
                    name:           $('#name_'+id).val(),
                    custom_input:   $('#customInput_'+id).val(),
                    param:          $('#param_'+id).val(),
                }

                $['post']('/admin/edit-param/', data);

            } else {
                console.log('empty params')
            }

        });

        $(document).on('click', '#delete-param', function (e) {
            e.preventDefault();
            var removeParam = $(this).parent().parent();
            var id = $(this).parent().parent().find('#id').attr('value');
            if(!!id) {
                $['get']('/admin/delete-param/' + id, function(response){
                    if(response == 'done')
                        removeParam.remove();
                })
            } else {
                removeParam.remove();
            }
                
        });
            
    </script>
@stop