@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Edit lot
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Edit lot</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          {{--action="{{ route('update-server', $server['id']) }}"--}}
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="col-xs-12">
                                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                    <div class="form-group__ttl">Название игры</div>
                                    <div class="input-wrap">
                                        <select title="Выбрать" name="game_id" class="selectpicker">
                                            @foreach($games as $game)
                                                <option @if($game->id == $lot->game_id) selected="selected"
                                                        @endif value="{{$game->id}}">{{ $game->name }}@if(!empty($game->region))({{$game->region}})@endif</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                    <div class="form-group__ttl">Название сервера</div>
                                    <div class="input-wrap">
                                        <select title="Выбрать" name="server_id" class="selectpicker">
                                            @foreach($servers as $server)
                                                <option @if($server->id == $lot->server_id) selected="selected"
                                                        @endif value="{{$server->id}}">{{ $server->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                            @if(empty($lot['currency']))
                                @foreach($subtags as $subtag)
                                    <div class="col-xs-12 subtag-data"
                                         @if($subtag->attach != 0 && !$lot->subtags->where('sub_tag_id',$subtag->id)->count()) style="display: none;"
                                         @endif @if($lot->subtags->where('sub_tag_id',$subtag->id)->count()) data-active="{{$subtag->attach}}"
                                         @endif data-id="{{$subtag->id}}" data-parent="{{$subtag->attach}}">
                                        <div class="form-group">
                                            @if($subtag->subTagMetadata->isNotEmpty())
                                                <div class="form-group__ttl">{{ $subtag->name }}</div>
                                                <div class="select-wrap">
                                                    <select title="Выбрать" name="subtags[{{ $subtag->id }}]" required
                                                            @if($subtag->attach != 0 && !$lot->subtags->where('sub_tag_id',$subtag->id)->count()) disabled="disabled"
                                                            @endif
                                                            class="selectpicker subtag-pick">
                                                        {{--<option>Выбрать</option>--}}
                                                        @foreach($subtag->subTagMetadata as $metadata)
                                                            <option @if($lot->subtags->where('sub_tag_id',$subtag->id)->where('sub_tag_value_id',$metadata->id)->count()) selected="selected"
                                                                    @endif value="{{$metadata->id}}">{{ $metadata->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            @else
                                                @foreach($lot->subtags as $lot_subtag)
                                                    @if($subtag->id == $lot_subtag->sub_tag_id)
                                                        <div class="form-group__ttl">{{ $subtag->name }}</div>
                                                        <div class="input-wrap">
                                                            <input type="text" name="subtags[{{ $subtag->id }}]"
                                                                   placeholder="Название" value="{{$lot_subtag->name}}"
                                                                   required="required"
                                                                   class="form-control"/>

                                                        </div>
                                                    @endif
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                @endforeach
                            @else
                                <div class="col-xs-12">
                                    <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                                        <div class="form-group__ttl">Название валюты</div>
                                        <div class="input-wrap">
                                            <select title="Выбрать" name="currency_id" class="selectpicker">
                                                @foreach($currencies as $currency)
                                                    <option @if($currency->id == $lot->currency_id) selected="selected"
                                                            @endif value="{{$currency->id}}">{{ $currency->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <div class="form-group__ttl">Цена ₽</div>
                                    <div class="input-wrap">
                                        <input type="text" name="price" value="{{$lot->price}}" required="required"
                                               class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            @if($lot->availability != 0)
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <div class="form-group__ttl">Наличие шт.</div>
                                        <div class="input-wrap">
                                            <input type="text" name="availability" value="{{$lot->availability}}"
                                                   required="required"
                                                   class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        <input type="checkbox" name="active"
                                               @if($lot->active === 1) checked="checked" @endif
                                               value="1" class="hidden-input"/><span
                                                class="check-icon"></span><span
                                                class="check-value">Активное</span>
                                    </label>
                                </div>
                            </div>
                            
                            <hr>

                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        <input type="checkbox" name="top" id="top"
                                            {{-- onchange="console.log(1);" --}}
                                               @if($lot->top === 1) checked="checked" @endif
                                               value="1" class="hidden-input"/>
                                               <span class="check-icon"></span>
                                               <span class="check-value">В топ</span>
                                    </label>
                                </div>
                            </div>


                            
                            


                            <div class='col-sm-8'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker'>
                                        <input type='text' class="form-control" name="top_at" value="{{ $lot->top_at }}" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar" id="top_at"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {

                                    $('#top').on('change', function(e){
                                        if(e.currentTarget.checked == true)
                                            $('#top_at').click();
                                    })

                                    $('#datetimepicker').datetimepicker({
                                        locale: 'ru',
                                        format: 'YYYY-MM-DD HH:mm:ss',
                                        minDate: new Date(),
                                        sideBySide: true,
                                    });
                                });
                            </script>

                           
                             

                        </div><!-- panel-body -->
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
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

            $('.subtag-pick').on('change', function () {
                let $this = $(this);

                let values = $this.find('option').map(function () {
                    return parseInt($(this).val());
                }).get();

                $.each(values, function (key, value) {
                    if ($('.subtag-data[data-parent="' + value + '"]').length > 0)
                        $('.subtag-data[data-parent="' + value + '"]').find('option').each(function () {
                            if ($(this).val()) values.push(parseInt($(this).val()));
                        });
                });

                $('.form-edit-add .subtag-data').each(function (index) {
                    if (values.includes($(this).data('parent'))) {
                        $(this).hide();
                        $(this).hide();

                        $(this).find($('.subtag-pick')).val(null).prop('disabled', true);
                    }
                    if ($(this).data('parent') == $this.val()) {
                        $(this).show();
                        $(this).find($('.subtag-pick')).prop('disabled', false);
                    }
                });
                $('.selectpicker').select2();
            });
        });
    </script>
@stop