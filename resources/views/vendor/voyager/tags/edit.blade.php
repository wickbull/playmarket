@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Редактировать тег
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Редактировать тег</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('update-tag', $tag['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Назва</div>
                                <div class="input-wrap">
                                    <input type="name" name="name" value="{{ $tag['name'] }}"
                                           required="required" class="form-control"/>
                                    @if ($errors->has('name'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('name') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="form-group{{ $errors->has('price_per_unit') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Имеет цену за единицу</div>
                                <div class="input-wrap">
                                    {{--<input type="name" name="price_per_unit" value="{{ $tag['price_per_unit'] }}"--}}
                                           {{--required="required" class="form-control"/>--}}
                                    <input type="checkbox" name="price_per_unit"
                                           class="form-check-input" value="1"
                                            {{ $tag['price_per_unit'] ? 'checked' : '' }}>
                                    @if ($errors->has('price_per_unit'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('price_per_unit') }}</strong>
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