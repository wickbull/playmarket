@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Редактировать сервер
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Редактировать сервер</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('update-server', $server['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Название сервера</div>
                                <div class="input-wrap">
                                    <input type="name" name="name" value="{{ $server['name'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('name'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('name') }}</strong>
                                                </span>
                                    @endif
                                </div>
                                <div class="form-group__ttl">Сторона (Необязательное)</div>
                                <div class="input-wrap">
                                    <input type="text" name="side" value="{{ $server['side'] }}" class="form-control"/>
                                    @if ($errors->has('side'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('side') }}</strong>
                                                </span>
                                    @endif
                                </div>
                                <div class="form-group__ttl">Игра</div>
                                <div class="input-wrap">
                                    <select name="game_id"
                                            required="required" class="form-control">
                                        @foreach($games as $item)
                                            <option @if($server['game_id'] == $item->id) selected
                                                    @endif value="{{$item->id}}">{{$item->name}}@if(!empty($item->region))({{$item->region}})@endif</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('game_id'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('game_id') }}</strong>
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

@stop