@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Редактировать настройки чата
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Редактировать настройки</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('chat-setting-update', $setting['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Название</div>
                                <div class="input-wrap">
                                    <input type="text" name="title" value="{{ $setting['title'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('title'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                    @endif
                                </div>
                                <div class="form-group__ttl">Значение</div>
                                <div class="input-wrap">
                                    <input type="number" name="value" value="{{ $setting['value'] }}"
                                           class="form-control"/>
                                    @if ($errors->has('value'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('value') }}</strong>
                                                </span>
                                    @endif
                                </div>
                                <div class="form-group__ttl">Статус</div>
                                <label class="checkbox-label">
                                    <input type="checkbox" name="is_active"
                                           @if($setting->is_active === 1) checked="checked" @endif
                                           value="1" class="hidden-input"/><span
                                            class="check-icon"></span><span
                                            class="check-value">Активное</span>
                                </label>
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