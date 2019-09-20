@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Edit currency
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Редактировать сторону</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('update-side', $server_side['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Назва</div>
                                <div class="input-wrap">
                                    <input name="title" value="{{ $server_side['title'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('title'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('other') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Другое</div>
                                <div class="input-wrap">
                                    <select name="game_id" class="form-control">
                                        @foreach($games as $item)
                                            <option @if($server_side['game_id'] == $item->id) selected="selected"
                                                    @endif value="{{$item->id}}">{{$item->name}}@if(!empty($item->region))({{$item->region}})@endif</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('other'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('other') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                        </div><!-- panel-body -->
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary">Подтвердить</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@stop

@section('javascript')

@stop