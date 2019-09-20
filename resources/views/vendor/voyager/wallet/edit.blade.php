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
                        <h3 class="panel-title">Редактировать кошельок</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('update-payment-setting', $data['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Назва</div>
                                <div class="input-wrap">
                                    <input name="title" value="{{ $data['title'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('title'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xs-12 form-group{{ $errors->has('is_active') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Активировать кошелек (рабочим будет последний
                                    активированый)
                                </div>
                                <div class="input-wrap">
                                    <input type="checkbox" name="is_active" class="form-check-input"
                                           value="1" {{ $data['is_active'] ? 'checked' : '' }}>
                                    @if ($errors->has('is_active'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('is_active') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('wallet_key') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">кошелек</div>
                                <div class="input-wrap">
                                    <input name="wallet_key" value="{{ $data['wallet_key'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('wallet_key'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('wallet_key') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>

                            <legend>Настройки</legend>
                            <div class="form-group{{ $errors->has('secret_key') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">SECRET KEY (если пустое поле, то берем стандартное)</div>
                                <div class="input-wrap">
                                    <input name="secret_key" value="{{ $data->secret_key or  old('secret_key') }}"
                                           class="form-control"/>
                                    @if ($errors->has('secret_key'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('secret_key') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('api_key') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">API KEY (если пустое поле, то берем стандартное)</div>
                                <div class="input-wrap">
                                    <input name="api_key"
                                           value="{{ $data->api_key or old('api_key') }}"
                                           class="form-control"/>
                                    @if ($errors->has('api_key'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('api_key') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('withdrawal') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Вывод средств</div>
                                <div class="input-wrap">
                                    <input name="withdrawal"
                                           value="{{ $data->withdrawal or old('withdrawal') }}"
                                           class="form-control"/>
                                    @if ($errors->has('withdrawal'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('withdrawal') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('other') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Другое</div>
                                <div class="input-wrap">
                                    <input name="other" value="{{ $data->other or old('other') }}"
                                           class="form-control"/>
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