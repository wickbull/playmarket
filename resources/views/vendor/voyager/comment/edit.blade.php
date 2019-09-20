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
                        <h3 class="panel-title">Редактировать коммент</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('comment.update', $comment->id) }}"
                          method="POST">
                        {{method_field('PUT')}}
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class=" col-xs-12 form-group{{ $errors->has('text') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Текст</div>
                                <div class="input-wrap">
                                    <textarea name="text" class="form-control">{!! $comment->text!!}</textarea>
                                    @if ($errors->has('text'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('text') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>
                            <div class="col-xs-12 form-group{{ $errors->has('mark') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Оценка</div>
                                <div class="input-wrap">
                                    <select class="selectpicker" name="mark">
                                        <option value="0" {{$comment->mark == '0'?'selected':null}}>
                                            - (Негативная оценка)
                                        </option>
                                        <option value="1" {{$comment->mark == '1'?'selected':null}}>
                                            + (Позитивная оценка)
                                        </option>
                                    </select>
                                    @if ($errors->has('mark'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('mark') }}</strong>
                                                </span>
                                    @endif
                                </div>
                            </div>

                            <div class="col-xs-12 form-group{{ $errors->has('created_at') ? ' has-error' : '' }}">
                                <div class="form-group__ttl">Оценка</div>
                                <div class="input-wrap">
                                    <input type="date" name="created_at" class="form-control"
                                           value="@if($comment->created_at!=''){{$comment->created_at->format('Y-m-d')}}@else{{old('created_at')}}@endif"/>
                                    @if ($errors->has('created_at'))
                                        <span class="help-block">
                                                    <strong>{{ $errors->first('created_at') }}</strong>
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
    <script>
        $(document).ready(function () {
            $('.selectpicker').select2();
        });
    </script>
@stop