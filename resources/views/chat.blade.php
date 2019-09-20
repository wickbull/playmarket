@extends('layouts.app')
@section('content')
    <main>
        <div class="c-chat js-chat">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 c-chat__conversations-col">
                        <div class="l-chat-block c-chat__conversations-wrap minimized">
                            <div class="l-chat-block__header">
                                <button type="button" data-target-block=".c-chat__conversations-wrap"
                                        class="hidden-lg hidden-md button-hide c-chat__conversations-hide">
                                </button>
                                <div class="l-chat-block__ttl"><span>Последние</span></div>
                            </div>
                            <div class="l-chat-block__body">
                                <div class="c-chat__conversations js-custom-scroll">
                                    <ul class="list-group c-chat__conversations-list">
                                        @foreach($list_dialogs as $item)
                                            @php($arr_msg = $item->dialog->message->toArray())
                                            @php($msg_status = end($arr_msg))
                                            <li v-on:click="getUserId"
                                                class="list-group-item c-chat__conversations-item @if($item->dialog->trade['status'] == 0) has-deal @elseif(isset($msg_status['seen']) && $msg_status['seen'] == 0) has-new-msg @endif"
                                                id="{{ $item->user->id }}" v-bind:dialogId="{{$item->dialog_id}}"
                                                value="{{ $item->user->name }}">
                                                <div class="c-chat__avatar"><a href="#" class="h-object-fit"><img
                                                                src="{{$item->user->avatar}}" alt=""/></a>
                                                </div>
                                                <div class="c-chat__conversations-info">
                                                    <div class="c-chat__conversations-top">
                                                        <a href="#" class="c-chat__name">{{$item->user->name}}</a>
                                                        @if($item->user->isOnline())<span
                                                                class="c-chat__online">online</span>@else <span
                                                                class="c-chat__offline">offline</span> @endif
                                                    </div>
                                                    <div class="c-chat__conversations-bottom">
                                                        <span class="c-chat__conversations-msg">На сайте с {{ date('d/m/Y', strtotime($item->user->created_at)) }}</span>
                                                        @php($arr = $item->dialog->message->toArray())
                                                        @php($time = end($arr))
                                                        <span class="c-chat__date">{{ date('d/m/Y H:i', strtotime($time['created_at']))}}</span>
                                                    </div>
                                                </div>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-16 c-chat__dialog-col">
                        <div class="row">
                            <div class="" v-for="(chatWindow,index) in chatWindows"
                                 v-bind:sendid="index.senderid" v-bind:name="index.name">
                                <div class="l-chat-block c-chat__dialog-wrap">
                                    <div class="l-chat-block__header">
                                        <button type="button" data-target-block=".c-chat__conversations-wrap"
                                                class="hidden-lg hidden-md button-toggle c-chat__conversations-trig animate-this">
                                        </button>
                                        <div class="l-chat-block__ttl"><span>Чат c @{{chatWindow.name}}</span></div>
                                        <a href="#" class="l-chat-block__msg"><i class="ico ico-envelope"></i><span>1 новое сообщение</span></a>
                                    </div>
                                    <div class="l-chat-block__body">
                                        <div class="c-chat__dialog js-custom-scroll">
                                            <div class="c-chat__dialog-list">
                                                <ul class="chat" id="chat">
                                                    <li class="left clearfix" v-for="chat in chats"
                                                        v-bind:message="chat.text" v-bind:username="chat.user.name">
                                                                <span class="chat-img pull-left">
                                                                <img src="http://placehold.it/50/55C1E7/fff&amp;text=U"
                                                                     alt="User Avatar" class="img-circle">
                                                                </span>
                                                        <div class="chat-body clearfix">
                                                            <div class="header">
                                                                <strong class="primary-font">
                                                                    @{{chat.user.name}}</strong>
                                                            </div>
                                                            <p v-if="">@{{chat.text}} </p>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="c-chat__form">
                                    <input :id="chatWindow.senderid"
                                           v-model="chatMessage[chatWindow.senderid]"
                                           v-on:keyup.enter="sendMessage" type="text"
                                           class="form-control input-md"
                                           placeholder="Type your message here..."/>
                                    <span class="input-group-btn">
                                                <button :id="chatWindow.senderid" class="btn btn-warning btn-md"
                                                        v-on:click="sendMessage">
                                                    Send
                                                </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection