@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Добавить под тег
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Добавить новый под тег</h3>
                    </div>
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('save-sub-tag') }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body" id="box">
                            <div class="col-xs-12 form-group{{ $errors->has('sub_tag_name') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Название</div>
                                <div class="input-wrap">
                                    <input type="name" name="sub_tag_name" value="{{ old('sub_tag_name') }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('sub_tag_name'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('sub_tag_name') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-xs-12 form-group{{ $errors->has('priority') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Проритет</div>
                                <div class="input-wrap">
                                    <input type="number" name="priority" value="{{ old('priority') }}"
                                           class="form-control"/>
                                    @if ($errors->has('priority'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('priority') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            {{--<div class="col-xs-12 form-group{{ $errors->has('attach') ? ' has-error' : '' }}">--}}
                                {{--<div class="form-group__ttl">Добавить к игровой валюте</div>--}}
                                {{--<div class="input-wrap">--}}
                                    {{--<input type="checkbox" name="attach" class="form-check-input" value="1">--}}
                                    {{--@if ($errors->has('attach'))--}}
                                        {{--<span class="help-block">--}}
                                                    {{--<strong>{{ $errors->first('attach') }}</strong>--}}
                                                {{--</span>--}}
                                    {{--@endif--}}
                                {{--</div>--}}
                            {{--</div>--}}
                            <div class="form-group{{ $errors->has('game') ? ' has-error' : '' }} col-md-6">
                                <div class="form-group__ttl">Выбрать Игру</div>
                                <div class="input-wrap">
                                    <select class="form-control game-select" data-live-search="true" name="game"
                                            id="game" required="required">
                                        <option value="">Выбрать игру</option>
                                        @foreach($games as $aKey => $game)
                                            <option value="{{$game->id}}"
                                            >{{$game->name}} @if(!empty($game->region))({{$game->region}})@endif</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('tag') ? ' has-error' : '' }} col-md-6">
                                <div class="form-group__ttl">Выбрать тег</div>
                                <div class="input-wrap">
                                    <select class="form-control tag-select" data-live-search="true" name="tag" id="tag"
                                            required="required">
                                        <option value="">Выбрать тег</option>
                                        @foreach($tags as $aKey => $tag)
                                            <option value="{{$tag->id}}"
                                            >{{$tag->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('tag') ? ' has-error' : '' }} col-md-6">
                                <div class="form-group__ttl">Выбрать Субтег</div>
                                <div class="input-wrap">
                                    <select class="form-control sub-tag-select selectpicker" data-live-search="true" name="attach">
                                        <option value="">Выбрать тег</option>
                                        @foreach($subtags as $tag)
                                            <optgroup label="{{$tag->name}}({{$tag->games->first()->name}} @if(!empty($tag->games->first()->region))- {{$tag->games->first()->region}} @endif )">
                                                @foreach($tag->subTagMetadata as $subTag)
                                                    <option data-tokens="{{$tag->name }} {{$subTag->name}}"
                                                            value="{{$subTag->id}}">{{$subTag->name}}
                                                    </option>
                                                @endforeach
                                            </optgroup>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="btn btn-success pull-right" id="add">Добавить поля</div>
                            </div>
                        </div>
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
    <script>

        $(document).ready(function () {

            $('.tag-select').select2();
            $('.game-select').select2();
            $('.sub-tag-select').select2();

            $('#add').click(function () {

                var inp = $('#box');

                var i = $('input').size() + 1;

                $('<div class="col-xs-12">' +
                    '<i id="remove" class="icon voyager-x pull-right"></i>' +
                    '<div class="row"><div class="form-group col-xs-9">' +
                    '<input required="required" type="text" id="metadata" class="name form-control" name="metadata[]' + i + '" placeholder="Название пункта"/></div>' +
                    '<div class="form-group col-xs-2"><input  type="text" class="name form-control" name="metadata_priority[]' + i + '" placeholder="Приоритет"/>' +
                    '</div></div></div>').appendTo(inp);

                i++;

            });


            $('body').on('click', '#remove', function () {
                $(this).parent('div').remove();
            });

        });

    </script>
@stop