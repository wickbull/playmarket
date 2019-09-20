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
                        <h3 class="panel-title">Редактировать комисиию</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('update-commission', $commission['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Название</div>
                                <div class="input-wrap">
                                    <input name="title" value="{{ $commission['title'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('title'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('title') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xs-12 form-group{{ $errors->has('is_active') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Добавить к игровой валюте</div>
                                <div class="input-wrap">
                                    <input type="checkbox" name="is_active" class="form-check-input"
                                           value="1" {{ $commission['is_active'] ? 'checked' : '' }}>
                                    @if ($errors->has('is_active'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('is_active') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('coefficient') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Коефициент валюты (100 = 1 рубль, Курс доллара 63.21 = 6321)</div>
                                <div class="input-wrap">
                                    <input name="coefficient" value="{{ $commission['coefficient'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('coefficient'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('coefficient') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>

                            <legend>Комисия (Проценты от 0 до 100)</legend>
                            <div class="form-group{{ $errors->has('site') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Сайт</div>
                                <div class="input-wrap">
                                    <input name="site" value="{{ $commission->site or  old('site') }}"
                                           class="form-control"/>
                                    @if ($errors->has('site'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('site') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('payment') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Платежка</div>
                                <div class="input-wrap">
                                    <input name="payment"
                                           value="{{ $commission->payment or old('payment') }}"
                                           class="form-control"/>
                                    @if ($errors->has('payment'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('payment') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('withdrawal') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Ввод средств</div>
                                <div class="input-wrap">
                                    <input name="withdrawal"
                                           value="{{ $commission->withdrawal or old('withdrawal') }}"
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
                                    <input name="other" value="{{ $commission->other or old('other') }}"
                                           class="form-control"/>
                                    @if ($errors->has('other'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('other') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>

                            <legend>Коммисия вывода (Проценты от 0 до 100)</legend>

                            <div class="form-group{{ $errors->has('output_commission') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Коммисия на вывод c баланса (в процентах: 4.45)</div>
                                <div class="input-wrap">
                                    <input name="output_commission" value="{{ $commission->output_commission or old('output_commission') }}"
                                           class="form-control"/>
                                    @if ($errors->has('output_commission'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('output_commission') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xs-12 form-group{{ $errors->has('can_withdrawal') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Возможность вывода</div>
                                <div class="input-wrap">
                                    <input type="checkbox" name="can_withdrawal" class="form-check-input"
                                           value="1" {{ $commission['can_withdrawal'] ? 'checked' : '' }}>
                                    @if ($errors->has('can_withdrawal'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('can_withdrawal') }}</strong>
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