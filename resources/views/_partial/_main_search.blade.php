<div class="row">
    <div class="c-games-list__col col-lg-8 col-sm-12 col-xs-12 col-xx-24">
        @foreach($games as $key => $game)
            <div class="c-games-list__group" id="game">
                <div class="c-games-list__group-letter"><span>{{$key}}</span></div>
                <div class="c-games-list__group-list">
                    @foreach($game as $g)
                        <div class="c-games-list__item">
                            <div class="c-games-list__item-header"><a href="/game/{{ $g->id }}"
                                                                      class="c-games-list__item-ttl">{{ $g->name }}</a>
                                
                            </div>
                            <div class="c-games-list__item-tags">
                                <ul class="h-list">
                                    @foreach($g->currency as $currency)
                                        <li>
                                            <a href="/game/{{ $g->id }}#tab-game-chat-{{$currency->name}}">#@lang(session("langId"), 'currency', $currency->name, 43200)</a>
                                        </li>
                                    @endforeach
                                    @foreach($g->tags as $tag)
                                        <li><a href="/game/{{ $g->id }}#tab-game-chat-{{$tag->name}}">#@lang(session("langId"), 'tags', $tag->name, 43200)</a>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        @endforeach
    </div>
</div>