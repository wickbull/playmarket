<div class="c-games-chat__item-tabs-saler"><span class="c-games-chat__item-tabs-saler-name">Sines</span><span
            class="c-chat__online">online</span>
</div>
<div role="tablist" class="c-tab-nav c-games-chat__item-tabs-nav xs-full xx-full">
    <button type="button" class="c-tab-nav__trig visible-xs"><span>Чат с продавцом</span>
    </button>
    <ul class="c-tab-nav__drop h-list minimized">
        <li role="presentation" class="active"><a href="#saler-chat-0"
                                                  aria-controls="saler-chat-0" role="tab"
                                                  data-toggle="tab"><span>Чат с продавцом</span></a>
        </li>
        <li role="presentation"><a href="#saler-feedbacks-0" aria-controls="saler-feedbacks-0"
                                   role="tab"
                                   data-toggle="tab"><span>Отзывы о продавце</span></a></li>
    </ul>
</div>
<div class="tab-content">
    <div role="tabpanel" id="saler-chat-0" class="tab-pane fade active in">
        <div class="saler-chat" id="chat-box">
            <div class="saler-chat__list  chat-body">
                <div class="chat-container">
                    <div class="chat-content">
                        <input type="hidden" name="chat_buddy_id" id="chat_buddy_id"/>
                        <div class="chat_body__massage custom_scrollbar chat-box-body">
                            <div>Выберите собеседника</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="saler-chat__form">
                <form class="js-form_check">
                    <div class="form-group">
                        <div class="input-wrap chat-textarea">
                            <textarea placeholder="Введите сообщение" required="required" class="form-control no-resize"></textarea>
                        </div>
                    </div>
                    <div class="saler-feedbacks__form-footer">
                        <button type="button" class="btn btn_blue btn_upper js-send-msg">Отправить111</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div role="tabpanel" id="saler-feedbacks-0" class="tab-pane fade">
        <div class="saler-feedbacks">
            <div class="saler-feedbacks__list js-custom-scroll">
                <div class="saler-feedbacks__item">
                    <div class="saler-feedbacks__item-avatar feedback__bad">
                        {{--<div class="saler-feedbacks__item-avatar-ico"></div>--}}
                    </div>
                    <div class="saler-feedbacks__item-info">
                        <div class="saler-feedbacks__item-ttl"><span>в этом месяце, EVE , 500 &#8381;</span>
                        </div>
                        <div class="saler-feedbacks__item-txt"><span>В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя для распечатки образцов.</span>
                        </div>
                    </div>
                </div>
                <div class="saler-feedbacks__item">
                    <div class="saler-feedbacks__item-avatar feedback__good">
                        {{--<div class="saler-feedbacks__item-avatar-ico"></div>--}}
                    </div>
                    <div class="saler-feedbacks__item-info">
                        <div class="saler-feedbacks__item-ttl"><span>4 месяца назад, Lineage 2 (Free), 70 &#8381;</span>
                        </div>
                        <div class="saler-feedbacks__item-txt"><span>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться.</span>
                        </div>
                    </div>
                </div>
                <div class="saler-feedbacks__item">
                    <div class="saler-feedbacks__item-avatar">
                    </div>
                    <div class="saler-feedbacks__item-info">
                        <div class="saler-feedbacks__item-ttl"><span>4 месяца назад, Lineage 2 (Free), 70 &#8381;</span>
                        </div>
                        <div class="saler-feedbacks__item-txt"><span>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться.</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="saler-feedbacks__form">
                <form class="js-form_check">
                    <div class="form-group">
                        <div class="input-wrap">
                                                    <textarea placeholder="Написать отзыв" required="required"
                                                              class="form-control no-resize"></textarea>
                        </div>
                    </div>
                    <div class="saler-feedbacks__form-radios">
                        <div class="form-group">
                            <label class="radio-label label_good">
                                <input type="radio" name="good_bad-0-undefined"
                                       checked="checked" value="Позитивный"
                                       class="hidden-input"/><span
                                        class="check-icon"></span><span class="check-value">Позитивный</span>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="radio-label label_bad">
                                <input type="radio" name="good_bad-0-undefined"
                                       value="Негативный" class="hidden-input"/><span
                                        class="check-icon"></span><span class="check-value">Негативный</span>
                            </label>
                        </div>
                    </div>
                    <div class="saler-feedbacks__form-footer">
                        <button type="submit" class="btn btn_blue btn_upper">Отправить</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>