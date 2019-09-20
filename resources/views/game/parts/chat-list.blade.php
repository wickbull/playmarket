<div class="c-games-chat__adena-item @if($lot->status == 0) has-deal @endif"
     id="chat_user_{{$lot->user->id}}">
    <div data-th="Продавец" class="t-c c-games-chat__adena-list-saler">
        <div class="c-chat__avatar">
            <div class="h-object-fit">
                <img src="{{ $lot->user->avatar or ''}}" alt=""/>
            </div>
        </div>
        <div class="c-games-chat__adena-item-info">
            <div class="c-games-chat__adena-item-top"><a
                        href="{{ route('user-profile' , $lot->user->id) }}"
                        class="c-chat__name">{{ $lot->user->name or ''}}</a>
                @if($lot->user->isOnline())<span class="c-chat__online">online</span>@else
                    <span class="c-chat__offline">offline</span> @endif
            </div>
            <div class="c-games-chat__adena-item-bottom">
                <div class="c-games-chat__adena-item-i">
                                                            <span>на сайте с {{ date('d m Y', strtotime($lot->user->created_at)) }}
                                                                , 13 отзывов</span>
                </div>
            </div>
        </div>
    </div>
    <div data-th="Cторона"
         class="t-c c-games-chat__adena-list-side text-center">
        <span>Лорем</span>
    </div>
    <div data-th="Наличие"
         class="t-c c-games-chat__adena-list-stock text-center">
        <span>{{ $lot->availability or ''}}</span>
    </div>
    <div data-th="Цена за 1 кк"
         class="t-c c-games-chat__adena-list-price text-center"
         id="{{$lot->id or ''}}-currency-price">
        <span>{{ $lot->price or ''}}</span>
        &#8381;
    </div>
</div>