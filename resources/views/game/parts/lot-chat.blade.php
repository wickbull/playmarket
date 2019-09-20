@foreach($dialog_msg as $msg)
    <div class="c-chat__dialog-item">
        <div class="c-chat__avatar"><a href="#"
                                       class="h-object-fit"><img
                        src="/default-avatar.svg"
                        alt=""/></a>
        </div>
        <div class="c-chat__dialog-info">
            <div class="c-chat__dialog-top"><a href="#"
                                               class="c-chat__name">{{$msg->user->name}}</a>@if($msg->user->isOnline())<span class="c-chat__online">online</span>@else <span class="c-chat__offline">offline</span> @endif<span
                        class="c-chat__date">{{date('d.m.Y, H:i', strtotime($msg->created_at))}}</span>
            </div>
            <div class="c-chat__dialog-bottom"><span
                        class="c-chat__dialog-msg">{{$msg->text}}</span>
            </div>
        </div>
    </div>
@endforeach
