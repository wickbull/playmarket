@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> @if(isset($dataTypeContent->id)){{ 'Edit' }}@else{{ 'New' }}@endif {{ $dataType->display_name_singular }}
    </h1>
@stop

@section('content')
    <div class="page-content container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">@if(isset($dataTypeContent->id)){{ 'Edit' }}@else{{ 'Add New' }}@endif {{ $dataType->display_name_singular }}</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="@if(isset($dataTypeContent->id)){{ route('voyager.'.$dataType->slug.'.update', $dataTypeContent->id) }}@else{{ route('voyager.'.$dataType->slug.'.store') }}@endif"
                          method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                    @if(isset($dataTypeContent->id))
                        {{ method_field("PUT") }}
                    @endif

                    <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">
                            <div class="form-group">
                                <label for="name">Имя</label>
                                <input type="text" class="form-control" name="name"
                                       placeholder="Name" id="name"
                                       value="@if(isset($dataTypeContent->name)){{ old('name', $dataTypeContent->name) }}@else{{old('name')}}@endif">
                            </div>

                            <div class="form-group">
                                <label for="name">Email</label>
                                <input type="text" class="form-control" name="email"
                                       placeholder="Email" id="email"
                                       value="@if(isset($dataTypeContent->email)){{ old('email', $dataTypeContent->email) }}@else{{old('email')}}@endif">
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                @if(isset($dataTypeContent->password))
                                    <br>
                                    <small>Leave empty to keep the same</small>
                                @endif
                                <input type="password" class="form-control" name="password"
                                       placeholder="Password" id="password"
                                       value="">
                            </div>

                            <div class="form-group">
                                <label for="name">Номер телефона</label>
                                <input type="text" class="form-control" name="phone"
                                       placeholder="С кодом страны (+7 или +380)"
                                       value="@if(isset($dataTypeContent->phone) && strlen($dataTypeContent->phone)>2){{ old('phone', $dataTypeContent->phone) }}@else{{old('phone')}}@endif">
                            </div>

                            <div class="form-group">
                                <label for="password">Avatar</label>
                                @if(isset($dataTypeContent->avatar))
                                    <img src="{{$dataTypeContent->avatar}}"
                                         style="width:200px; height:auto; clear:both; display:block; padding:2px; border:1px solid #ddd; margin-bottom:10px;">
                                @endif
                                <input type="file" name="avatar">
                            </div>

                            {{--<div class="form-group">--}}
                                {{--<label for="status">User Block IP </label>--}}
                                {{--<input id="toggle-event" type="checkbox" name="status"--}}
                                       {{--{{ $dataTypeContent->status ? 'checked' : '' }} data-toggle="toggle"--}}
                                       {{--data-onstyle="success" data-on="Active" data-off="Block">--}}
                            {{--</div>--}}


                            <div id="date-range" class="form-group">
                                <label for="status">Время блокировки по IP</label>
                                <div class="input-group">
                                    <div class="input-group-addon">От</div>
                                    <input class="form-control" type="date" name="start_time"
                                           value="{{!empty($block_ip)?$block_ip->count()?$block_ip->first()->from->format('Y-m-d'):null:null }}">
                                    <div class="input-group-addon">До</div>
                                    <input type="date" class="form-control"  name="end_time"
                                           value="{{!empty($block_ip)?$block_ip->count()?$block_ip->first()->to->format('Y-m-d'):null:null }}">
                                </div>
                            </div>
                            <div id="date-range" class="form-group">
                                <label for="status">User IP address</label>
                                <input type="text" class="form-control" name="ip"
                                       id="ip"
                                       value="{{ $dataTypeContent->ip }}" readonly>
                            </div>

                            {{--<div class="form-group col-md-4">--}}
                                {{--<label for="create_lot">Блокировка создание лотов</label>--}}
                                {{--<input  type="checkbox" name="blocks[create_lot]" id="create_lot"--}}
                                       {{--{{ $dataTypeContent->create_lot ? 'checked' : '' }} data-toggle="toggle"--}}
                                       {{--data-onstyle="success" data-on="Active" data-off="Block" value="1">--}}
                            {{--</div>--}}

                            {{--<div class="form-group col-md-4">--}}
                                {{--<label for="buy_lot">Блокировка покупок</label>--}}
                                {{--<input  type="checkbox" name="blocks[buy_lot]" id="buy_lot"--}}
                                       {{--{{ $dataTypeContent->buy_lot ? 'checked' : '' }} data-toggle="toggle"--}}
                                       {{--data-onstyle="success" data-on="Active" data-off="Block" value="1">--}}
                            {{--</div>--}}

                            <div class="form-group col-md-4">
                                <label for="get_money">Потвердить email</label>
                                <input type="checkbox" name="confirmed"
                                       {{ $dataTypeContent->confirmed ? 'checked' : '' }} data-toggle="toggle"
                                       data-onstyle="success" data-on="Отменить" data-off="Подтвердить" value="1">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="get_money">Потвердить правила сайта</label>
                                <input type="checkbox" name="confirmed_rules"
                                       {{ $dataTypeContent->confirmed_rules ? 'checked' : '' }} data-toggle="toggle"
                                       data-onstyle="success" data-on="Отменить" data-off="Подтвердить" value="1">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="get_money">Активировать блокировку</label>
                                <input type="checkbox" name="is_block"
                                       {{ $dataTypeContent->is_block ? 'checked' : '' }} data-toggle="toggle"
                                       data-onstyle="success" data-on="Отменить" data-off="Заблокировать" value="1">
                            </div>


                            <div class="form-group col-md-4">
                                <label for="get_money">Заблокировать вывод</label>
                                <input type="checkbox" name="is_block_payment"
                                       {{ $dataTypeContent->is_block_payment ? 'checked' : '' }} data-toggle="toggle"
                                       data-onstyle="success" data-on="Отменить" data-off="Заблокировать" value="1">
                            </div>

                            <div class="form-group col-md-12">
                                <label for="role">Роль</label>
                                <select name="role_id" id="role" class="form-control">
                                    <?php $roles = TCG\Voyager\Models\Role::all(); ?>
                                    @foreach($roles as $role)
                                        <option value="{{$role->id}}"
                                                @if(isset($dataTypeContent) && $dataTypeContent->role_id == $role->id) selected @endif>{{$role->display_name}}</option>
                                    @endforeach
                                </select>
                            </div>

                        </div><!-- panel-body -->

                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>

                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                          enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                               onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
            </div>
        </div>
    </div>
@stop

@section('javascript')
    <script>
    </script>
    <script src="{{ voyager_asset('lib/js/tinymce/tinymce.min.js') }}"></script>
    <script src="{{ voyager_asset('js/voyager_tinymce.js') }}"></script>
@stop
