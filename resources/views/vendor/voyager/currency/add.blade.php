@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Добавить Валюту
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Добавить новую валюту</h3>
                    </div>
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('save-currency') }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Назва</div>
                                <div class="input-wrap">
                                    <input type="name" name="name" value="{{ old('name') }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('name'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('name') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('unity') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Подсчет единства Пример (1кк или 1000ед и тд.)</div>
                                <div class="input-wrap">
                                    <input type="name" name="unity" value="{{ old('unity') }}"
                                           class="form-control"/>
                                    @if ($errors->has('unity'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('unity') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('multiplier') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Коефициент валюты</div>
                                <div class="input-wrap">
                                    <input name="multiplier" value="{{ old('multiplier') }}"
                                           class="form-control"/>
                                    @if ($errors->has('multiplier'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('multiplier') }}</strong>
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