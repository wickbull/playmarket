@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Редактировать под тег
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Редактировать под тег</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('update-sub-tag', $sub_tag['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body" id="box">
                            <div class="col-xs-12 form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Назва</div>
                                <div class="input-wrap">
                                    <input type="name" name="name" value="{{ $sub_tag['name'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('name'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('name') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-xs-12 form-group{{ $errors->has('priority') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Проритет</div>
                                <div class="input-wrap">
                                    <input type="number" name="priority" value="{{ $sub_tag['priority'] }}"
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
                                    {{--<input type="checkbox" name="attach" class="form-check-input" value="1" {{ $sub_tag['attach'] ? 'checked' : '' }}>--}}
                                    {{--@if ($errors->has('attach'))--}}
                                        {{--<span class="help-block">--}}
                                                    {{--<strong>{{ $errors->first('attach') }}</strong>--}}
                                                {{--</span>--}}
                                    {{--@endif--}}
                                {{--</div>--}}
                            {{--</div>--}}
                            <div class="form-group{{ $errors->has('games') ? ' has-error' : '' }} col-md-6">
                                <div class="form-group__ttl">Выбрать игру</div>
                                <div class="input-wrap">
                                    <select class="form-control game-select" data-live-search="true" name="game"
                                            id="game" required="required">
                                        <option value="">Выбрать игру</option>
                                        @foreach($games as $aKey => $game)
                                            <option value="{{ $game->id }}"
                                                    @foreach($sub_tag->games as $g) @if($game->id == $g->id)selected="true"@endif @endforeach>{{ $game->name }}@if(!empty($game->region))
                                                    ({{$game->region}})@endif</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('tag') ? ' has-error' : '' }} col-md-5">
                                <div class="form-group__ttl">Выбрать тег</div>
                                <div class="input-wrap">
                                    <select class="form-control tag-select" data-live-search="true" name="tag" id="tag"
                                            required="required">
                                        <option value="">Выбрать тег</option>
                                        @foreach($tags as $tag)
                                            <option value="{{ $tag->id }}"
                                                    {{-- -_- --}}
                                                    @foreach($sub_tag->tags as $t) @if($tag->id == $t->id)selected="selected"@endif @endforeach>{{ $tag->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('tag') ? ' has-error' : '' }} col-md-6">
                                <div class="form-group__ttl">Выбрать Субтег
                                    {{--@if(!empty($sub_tag->games))--}}
                                        {{--({{$sub_tag->games->first()->name}})@endif--}}
                                </div>
                                <div class="input-wrap">
                                    <select class="form-control sub-tag-select selectpicker" data-live-search="true"
                                            name="attach">
                                        <option value="">Выбрать тег</option>
                                        @foreach($subtags as $tag)
                                            <optgroup
                                                    label="{{$tag->name}}@if(!empty($tag->games))({{$tag->games->first()->name}} @if(!empty($tag->games->first()->region))- {{$tag->games->first()->region}}@endif )@endif">
                                                @foreach($tag->subTagMetadata as $subTag)
                                                    <option data-tokens=" {{$tag->name }} {{$subTag->name}}" @if(isset($sub_tag->attach) && $sub_tag->attach == $subTag->id)selected
                                                            @endif value="{{$subTag->id}}">{{$subTag->name}}
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
                            @if($sub_tag->subTagMetadata)
                                @foreach($sub_tag->subTagMetadata as $metadata)
                                    <div class="col-xs-12">
                                        <i id="remove" data-id="{{$metadata->id}}"
                                           class="icon voyager-x pull-right"></i>
                                        <div class="row">
                                            <div class="form-group col-xs-9">
                                                <input required="required" type="text" id="metadata"
                                                       class="name form-control" name="metadata[]{{$metadata->id}}"
                                                       value="{{ $metadata->name }}"
                                                       placeholder="Название пункта"/></div>
                                            <div class="form-group col-xs-2"><input type="text"
                                                                                    class="name form-control"
                                                                                    name="metadata_priority[]{{$metadata->id}}"
                                                                                    value="{{ $metadata->priority }}"
                                                                                    placeholder="Приоритет"/>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div><!-- panel-body -->
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary">Сохранить</button>
                            <a href="{{route('subtag.index')}}">Назад</a>
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
            $('.sub-tag-select').selectpicker();


            $('#add').click(function () {

                var inp = $('#box');

                var i = $('input').size() + 1;

                $('<div class="col-xs-12">' +
                    '<i id="remove" class="icon voyager-x pull-right"></i>' +
                    '<div class="row"><div class="form-group col-xs-9">' +
                    '<input required="required" type="text" id="metadata" class="name form-control" name="metadata[]' + i + '" placeholder="Название пункта"/></div>' +
                    '<div class="form-group col-xs-2"><input type="text" class="name form-control" name="metadata_priority[]' + i + '" placeholder="Приоритет"/>' +
                    '</div></div></div>').appendTo(inp);

                i++;

            });


            $('body').on('click', '#remove', function () {
                var item = $(this);
                console.log(item);
                if (item.data('id') != undefined)
                    $.ajax({
                        type: 'DELETE',
                        url: '{{route('remove_subtag_metadata')}}',
                        data: {
                            'id': item.data('id'),
                            '_token': '{{csrf_token()}}',
                        },
                        success: function (data) {
                            console.log('Removed');
                        }
                    });
                item.parent('div').remove();
            });

        });

    </script>
@stop