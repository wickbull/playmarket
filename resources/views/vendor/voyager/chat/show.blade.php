@extends('voyager::master')

@section('page_header')
    <style>
        .chat {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .chat li {
            margin-bottom: 10px;
            padding-bottom: 5px;
            border-bottom: 1px dotted #B3A9A9;
        }

        .chat .lot-item {
            color: red;
            font-weight: bold;
        }

        .chat li img {
            max-height: 50px;
        }

        .chat li.left .chat-body {
            margin-left: 60px;
        }

        .chat li.center .chat-body {
            margin-left: 0;
            border-left: 5px solid red;
            border-radius: 10px;
        }

        .chat li.center .chat-body p {
            margin-left: 10px;
        }

        .chat li.center .chat-body .header {
            margin-left: 10px;
        }

        .chat li.right .chat-body {
            margin-right: 60px;
        }

        .chat li .chat-body p {
            margin: 0;
            color: #777777;
        }

        .panel .slidedown .glyphicon, .chat .glyphicon {
            margin-right: 5px;
        }

        .panel-body {
            overflow-y: scroll;
            height: 100%;
        }

        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar {
            width: 12px;
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar-thumb {
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
            background-color: #555;
        }
    </style>
    <h1 class="page-title">
        <i class=""></i> Чаты пользователя номер - {{$msg->first()->dialog_id}}
    </h1>
    @if (Session::has('flash_message_success'))
        <div class="alert alert-success">{{Session::get('flash_message_success') }}</div>
    @elseif(Session::has('flash_message_error'))
        <div class="alert alert-danger">{{Session::get('flash_message_error') }}</div>
    @endif
@stop

@section('content')

    <div class="page-content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    @if($errors->any())
                        <div class="registration-form-errors-container">
                            @foreach ($errors->all() as $error)
                                <div class="registration-form-error-item">
                                    {{ $error }}
                                </div>
                            @endforeach
                        </div>
                    @endif
                    <div class="panel-heading">
                        <span class="glyphicon glyphicon-comment"></span> Чаты
                    </div>
                    <div class="panel-body">
                        <ul class="chat">
                            @foreach($msg as $item)
                                <li class="@if($item->sender_id == $main_id)left @elseif($item->sender_id == '1') center @else right @endif clearfix">
                                    <span class="chat-img @if($item->sender_id == $main_id)pull-left @elseif($item->sender_id == '1') @else pull-right @endif ">
                            <img @if($item->sender_id == '1') src="{{asset('s/images/useful/svg/default-avatar.svg')}}"
                                 @else src="{{$item->users->avatar}}" @endif class="img-circle"/>
                        </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">{{$item->users->name}} @if($item->lot_id != '' && !empty($item->lots))
                                                    <span class="lot-item">Лот: <a target="_blank"
                                                                                   href="{{route('edit-lot',['id' => $item->lot_id])}}">{{$item->lots->id}}</a></span> @endif
                                            </strong>
                                            <small class="@if($item->sender_id == $main_id)left @elseif($item->sender_id == '1') center @else right @endif text-muted">
                                                <span class="glyphicon glyphicon-time"></span>{{$item->created_at->format('d.m.Y G:i:s')}}
                                            </small>
                                        </div>
                                        <p>
                                            {!! $item->text !!}
                                        </p>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                        {{$msg->links()}}
                    </div>
                    <div class="panel-footer">
                        <div class="form-group">
                            <form action="{{route('chat-new-msg-admin',['id' => $msg->first()->dialog_id])}}"
                                  method="POST">
                                {{csrf_field()}}
                                <textarea id="btn-input" type="text" name="msg" class="form-control input-sm"
                                          placeholder="Напишите что то от имени администрации">{!! old('msg') !!}</textarea>
                                <span class="input-group-btn">
                            <button type="submit" class="btn btn-warning btn-sm" id="btn-chat">
                                Отправить</button></span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@stop

@section('javascript')
    <script>
        $('div.alert').delay(3000).slideUp(300);
        $(window).load(function() {
            $("html, body").animate({ scrollTop: $(document).height() }, 1000);
        });
    </script>
@stop