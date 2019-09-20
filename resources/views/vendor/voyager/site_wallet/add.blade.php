@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Добавить ключ
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Добавить новый ключ</h3>
                    </div>
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('save-site-wallet') }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Название ключа (Для администратора)</div>
                                <div class="input-wrap">
                                    <input type="text" name="title" value="{{ old('title') }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('title'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                    @endif
                                </div>
                                <div class="form-group__ttl">Платежная система</div>
                                <div class="input-wrap">
                                    <select name="keyword"
                                            required="required" class="form-control">
                                            <option value="freekassa">Freekassa</option>
                                        <option value="wmr_out">Webmoney WMR (Вывод)</option>
                                        <option value="wmr">Webmoney WMR</option>
                                        <option value="wme">Webmoney WME</option>
                                        <option value="wmz">Webmoney WMZ</option>
                                        <option value="wmu">Webmoney WMU</option>
                                        <option value="yandex_money">Yandex Money</option>
                                        <option value="qiwi">Qiwi</option>
                                    </select>
                                    @if ($errors->has('game_id'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('game_id') }}</strong>
                                                </span>
                                    @endif
                                </div>
                                <div class="form-group__ttl">Кошельок (Для Webmoney)</div>
                                <div class="input-wrap">
                                    <input type="text" name="wallet_key" value="{{ old('wallet_key') }}" class="form-control"/>
                                    @if ($errors->has('wallet_key'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('wallet_key') }}</strong>
                                                </span>
                                    @endif
                                </div>

                                <div class="form-group__ttl">API key</div>
                                <div class="input-wrap">
                                    <input type="text" name="api_key" value="{{ old('api_key') }}" class="form-control"/>
                                    @if ($errors->has('api_key'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('api_key') }}</strong>
                                                </span>
                                    @endif
                                </div>


                                <div class="form-group__ttl">Secret key</div>
                                <div class="input-wrap">
                                    <input type="text" name="secret_key" value="{{ old('secret_key') }}" class="form-control"/>
                                    @if ($errors->has('secret_key'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('secret_key') }}</strong>
                                                </span>
                                    @endif
                                </div>

                                <div class="form-group__ttl">Дополнительное поле</div>
                                <div class="input-wrap">
                                    <input type="text" name="additional_field" value="{{ old('additional_field') }}"
                                           class="form-control"/>
                                    @if ($errors->has('additional_field'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('additional_field') }}</strong>
                                                </span>
                                    @endif
                                </div>

                                <div class="col-xs-12 form-group{{ $errors->has('is_active') ? ' has-error' : '' }}">
                                    <div class="form-group__ttl">Активировать кошелек
                                    </div>
                                    <div class="input-wrap">
                                        <input type="checkbox" name="is_active" class="form-check-input"
                                               value="1">
                                        @if ($errors->has('is_active'))
                                            <span class="help-block">
                                                    <strong>{{ $errors->first('is_active') }}</strong>
                                                </span>
                                        @endif
                                    </div>
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