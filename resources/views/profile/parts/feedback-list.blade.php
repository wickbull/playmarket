<div class="saler-feedbacks__item">
    <div class="saler-feedbacks__item-avatar @if($item->mark == '1') feedback__good @elseif($item->mark == '0') feedback__bad @endif">
        <div class="saler-feedbacks__item-avatar-ico"></div>
    </div>
    <div class="saler-feedbacks__item-info">
        <div class="saler-feedbacks__item-ttl"><span>{{localeDate($item->created_at,'d M Y')}}
                , {{$item->trade->lot->game->name or ''}}
                , {{$item->trade->price}} &#8381;</span>
        </div>
        <div class="saler-feedbacks__item-txt">
            <span>{{$item->text}}</span>
        </div>
    </div>
</div>