@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Редактировать кошельок
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
                          action="{{ route('update-site-wallet', $data['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Название</div>
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


                            <div class="form-group__ttl">Платежная система</div>
                            <div class="input-wrap">
                                <select name="keyword"
                                        required="required" class="form-control">
                                    <option @if($data['keyword'] == 'freekassa') selected="selected" @endif value="freekassa">Freekassa</option>
                                    <option @if($data['keyword'] == 'wmr_out') selected="selected"
                                            @endif value="wmr_out">Webmoney WMR (Вывод)
                                    </option>
                                    <option @if($data['keyword'] == 'wmr') selected="selected" @endif value="wmr">Webmoney WMR</option>
                                    <option @if($data['keyword'] == 'wmz') selected="selected" @endif value="wmz">Webmoney WMZ</option>
                                    <option @if($data['keyword'] == 'wme') selected="selected" @endif value="wme">Webmoney WME</option>
                                    <option @if($data['keyword'] == 'wmu') selected="selected" @endif value="wmu">Webmoney WMU</option>
                                    <option @if($data['keyword'] == 'yandex_money') selected="selected" @endif value="yandex_money">Yandex Money</option>
                                    <option @if($data['keyword'] == 'qiwi') selected="selected" @endif value="qiwi">Qiwi</option>
                                </select>
                                @if ($errors->has('game_id'))
                                    <span class="help-block">
                                                    <strong>{{ $errors->first('game_id') }}</strong>
                                                </span>
                                @endif
                            </div>
                            <div class="form-group__ttl">Кошельок (Для Webmoney)</div>
                            <div class="input-wrap">
                                <input type="text" name="wallet_key" value="{{$data['wallet_key'] or old('wallet_key') }}" class="form-control"/>
                                @if ($errors->has('wallet_key'))
                                    <span class="help-block">
                                                    <strong>{{ $errors->first('wallet_key') }}</strong>
                                                </span>
                                @endif
                            </div>

                            <div class="form-group__ttl">API key</div>
                            <div class="input-wrap">
                                <input type="text" name="api_key" value="{{$data['api_key'] or old('api_key') }}" class="form-control"/>
                                @if ($errors->has('api_key'))
                                    <span class="help-block">
                                                    <strong>{{ $errors->first('api_key') }}</strong>
                                                </span>
                                @endif
                            </div>

                            <div class="form-group__ttl">Secret key</div>
                            <div class="input-wrap">
                                <input type="text" name="secret_key"
                                       @if(isset($data['secret_key'])) placeholder="Поле зашифровано"
                                       @endif class="form-control"/>
                                @if ($errors->has('secret_key'))
                                    <span class="help-block">
                                                    <strong>{{ $errors->first('secret_key') }}</strong>
                                                </span>
                                @endif
                            </div>
                            <div class="form-group__ttl">Дополнительное поле</div>
                            <div class="input-wrap">
                                <input type="text" name="additional_field"
                                       @if(isset($data['additional_field'])) placeholder="Поле зашифровано"
                                       @endif class="form-control"/>
                                @if ($errors->has('additional_field'))
                                    <span class="help-block">
                                                    <strong>{{ $errors->first('additional_field') }}</strong>
                                                </span>
                                @endif
                            </div>

                            <div class="col-xs-12 form-group{{ $errors->has('is_active') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Активировать кошелек</div>
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
                        </div><!-- panel-body -->
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary">Подтвердить</button>
                        </div>
                    </form>
                </div>
            </div>
            @if($data['keyword'] == 'yandex_money')

                <div class="col-md-12">

                    <div class="panel panel-bordered">

                        <div class="panel-heading">
                            <h3 class="panel-title">Временный токен Yandex (Генерация)</h3>
                        </div>

                        <!-- /.box-header -->
                        <!-- form start -->
                        <form action="{{ route('yandex-set-oaut', $data['id']) }}"
                              method="POST">
                            <div class="panel-body">

                                <!-- CSRF TOKEN -->
                                {{ csrf_field() }}
                                <div class="form-group__ttl">Параметры: Необходимо - "account-info operation-history operation-details incoming-transfers payment-p2p.limit(1,10000) money-source("wallet","card")"
                                    (https://tech.yandex.ru/money/doc/dg/concepts/protocol-rights-docpage/) limit(1,10000) - значит что 10 000 рублей в день
                                </div>
                                <div class="input-wrap">
                                    <input type="text" name="param" value=""
                                           class="form-control"
                                           placeholder="Вводить через пробел">
                                </div>
                                <div class="panel-footer">
                                    <button type="submit" class="btn btn-primary">Подтвердить</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            @endif
        </div>
    </div>
@stop

@section('javascript')

@stop