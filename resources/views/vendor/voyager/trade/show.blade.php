@extends('voyager::master')

@section('page_header')
    <h1 class="page-title">
        <i class=""></i> Редактировать сделку
    </h1>
@stop

@section('content')

    <div class="page-content container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">

                    <div class="panel-heading">
                        <h3 class="panel-title">Редактировать сделку</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-edit-add" role="form"
                          action="{{ route('trade-update-by-id-admin', $trade['id']) }}"
                          method="POST">
                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}
                        {{method_field('PUT')}}
                        <div class="panel-body">
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Владелец:
                                        <a target="_blank"
                                           href="{{route('user-profile',['id' => $trade->owner->id])}}">{{$trade->owner->name}}</a>
                                        <a target="_blank"
                                           href="{{route('user-admin-edit',['id' => $trade->owner->id])}}"
                                           class="btn btn-default">Редактировать</a>
                                        <br>
                                        Баланс - {{$trade->owner->balance or 0}}
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Покупатель:
                                        <a target="_blank"
                                           href="{{route('user-profile',['id' => $trade->buyer->id])}}">{{$trade->buyer->name}}</a>
                                        <a target="_blank"
                                           href="{{route('user-admin-edit',['id' => $trade->buyer->id])}}"
                                           class="btn btn-default">Редактировать</a>
                                        <br>
                                        Баланс - {{$trade->buyer->balance or 0}}
                                    </label>
                                </div>
                            </div>
                            <br>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Покупка с помощью:
                                        {{$trade->paymentCurrency->title}}
                                    </label>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Редактировать лот:
                                        <a href="{{route('edit-lot',['id' => $trade->lot->id])}}"
                                           class="btn-sm btn-success pull-right edit">
                                            <i class="voyager-edit"></i>Лот</a>
                                    </label>
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Имя персонажа:
                                    </label>
                                    <div class="input-wrap">
                                        <input type="text" name="character_name" value="{{$trade->character_name}}">
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Цена:
                                    </label>
                                    <div class="input-wrap">
                                        <input type="text" name="price" value="{{$trade->price}}">
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Количество:
                                    </label>
                                    <div class="input-wrap">
                                        <input type="text" name="get_availability" value="{{$trade->get_availability}}">
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Статус: @if($trade->status == 1)
                                            <span>Открытый</span>
                                        @elseif($trade->is_payed == 0 && $trade->status == 1)
                                            <span style="color:blue;">Ожидание оплаты</span>
                                        @elseif($trade->status == 3)
                                            <span style="color:red;">Возврат</span>
                                        @else
                                            <span style="color:green;">Закрыт</span>
                                        @endif
                                    </label>
                                </div>
                            </div>

                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        Оплата: @if($trade->is_payed == '1')Оплачено @else Не оплачено@endif
                                    </label>
                                </div>
                            </div>

                        </div><!-- panel-body -->
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                            @if($trade->status == 1 && $trade->is_payed == 1)
                                <button data-toggle="modal" data-target="#close-trade"
                                        {{--onclick="event.preventDefault();--}}
                                        {{--document.getElementById('close').submit();" --}}
                                        type="button"
                                        class="btn btn-warning">Закрыть сделку
                                </button>
                                <button data-toggle="modal" data-target="#refuse-trade"
                                        {{--onclick="event.preventDefault();--}}
                                        {{--document.getElementById('refuse').submit();" --}}
                                        type="button"
                                        class="btn btn-danger">Вернуть деньги (Отмена сделки)
                                </button>
                            @endif
                            <button data-toggle="modal" data-target="#change-status"
                                    {{--onclick="event.preventDefault();--}}
                                    {{--document.getElementById('refuse-money').submit();" --}}
                                    type="button"
                                    class="btn btn-default">Сменить статус оплаты
                            </button>
                        </div>
                    </form>
                    @if($trade->status == 1 && $trade->is_payed == 1)
                        <div id="close-trade" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <form id="close" action="{{route('trade-by-id-close-admin',['id' => $trade->id])}}"
                                          method="POST">

                                        {{csrf_field()}}
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Закрыть сделку</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="checkbox-label">
                                                        Пароль:
                                                    </label>
                                                    <div class="input-wrap">
                                                        <input type="password" name="password" value=""
                                                               placeholder="Пароль">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-default">Подтвердить
                                            </button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                            </button>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>

                        <div id="refuse-trade" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <form id="refuse"
                                          action="{{route('trade-by-id-refuse-admin',['id' => $trade->id])}}"
                                          method="POST">

                                        {{csrf_field()}}
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Вернуть деньги (Отмена сделки)</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <label class="checkbox-label">
                                                        Пароль:
                                                    </label>
                                                    <div class="input-wrap">
                                                        <input type="password" name="password" value=""
                                                               placeholder="Пароль">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-default">Подтвердить
                                            </button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                            </button>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>

                @endif
                <!-- Modal -->
                    <div id="change-status" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <form id="refuse-money" method="POST"
                                      action="{{route('trade-by-id-refuse-payment-admin',['id' => $trade->id])}}">
                                    {{csrf_field()}}
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Сменить статус оплаты</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <label class="checkbox-label">
                                                    Пароль:
                                                </label>
                                                <div class="input-wrap">
                                                    <input type="password" name="password" value=""
                                                           placeholder="Пароль">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-default">Подтвердить
                                        </button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                    </div>
                                </form>

                            </div>

                        </div>
                    </div>

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