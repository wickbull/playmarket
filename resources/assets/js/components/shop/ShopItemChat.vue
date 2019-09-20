<template>
    <div v-if="Lot.game_id == Game.id && Lot.active == 1" class="c-games-chat__item"
         :id="'chat_lot_user_' + Lot.id">
        <div class="panel">
            <div :id="Lot.id" class="panel-heading"
                 ref="item"
                 v-bind:class="{ ' is-active': Active == Lot.id,
                 ' has-new-msg': NewMsg.includes(Lot.owner_id),
                 ' has-deal': ActiveTrade.includes(Lot.id)}"
                 v-on:click="getChat(Lot.id)">
                <a role="button" href="#" class="panel-heading-trig collapsed"></a>
                <div class="c-games-chat__item-header">
                    <div class="c-games-chat__item-header-bottom t-row">
                        <div :data-th="language('saler')" class="c-games-chat__item-header-saler t-c">
                            <div
                                    class="c-games-chat__item-header-saler-avatar">
                                <div class="h-object-fit">
                                    <img :src="Lot.user.avatar"
                                         alt=""/>
                                </div>
                                <span v-if="newMsgCount[Lot.user.id] != undefined"
                                      class="c-chat__conversations-msg-count">{{newMsgCount[Lot.user.id]}}</span>
                            </div>
                            <div class="c-games-chat__item-header-saler-info">
                                <div class="c-games-chat__item-header-saler-info-top"><a target="_blank"
                                                                                         :href="'/user-profile/' + Lot.user.id"
                                                                                         class="c-games-chat__item-header-saler-name">{{
                                    Lot.user.name }}</a>
                                    <span v-if="Lot.user.is_online" class="c-chat__online">online</span>
                                    <span v-else class="c-chat__offline">offline</span>
                                </div>
                                <div class="c-games-chat__item-header-saler-info-bottom">
                                    <span>{{timestamp}}<span v-if="Lot.user.reviews_count != undefined"> {{language('reviews')}} {{Lot.user.reviews_count}}</span></span>
                                    <!-- <span>{{timestamp}}<span v-if="Lot.user.reviews_count != undefined"> {{language('reviews')}}{{displayReviewCount(Lot.user.reviews_count,false)}}</span></span> -->
                                </div>
                            </div>
                        </div>
                        <div :data-th="language('description')" class="c-games-chat__item-header-descr t-c">
                            <div>
                                <span v-if="Lot.description.length > 150" class="c-games-chat__item-header-descr-short">{{Lot.description.substring(0,150)}}...</span>
                                <span v-else class="c-games-chat__item-header-descr-short">{{Lot.description}}</span>
                            </div>
                            <span class="c-games-chat__item-header-descr-full">{{ Lot.description }}</span>
                        </div>
                        <div v-if="Tag.price_per_unit != 0" data-th="Наличие"
                             class="c-games-chat__item-header-stock t-c text-center">
                            <span>{{ parseInt(Lot.availability) }}</span></div>
                        <div data-th="Цена"
                             class="c-games-chat__item-header-price t-c text-center">
                            <span>{{ totalPrice(commission[2]) }} &#8381;</span></div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="panel-collapse collapse">
                <div class="c-games-chat__item-body">
                    <div class="row">
                        <div class="col-sm-12 col-xs-24">
                            <div class="c-games-chat__item-game">
                                <ul class="h-list">
                                    <li v-if="Lot.game != undefined && Lot.game.name != undefined"><span
                                            class="key">{{language('game')}}</span><span
                                            class="value">{{ Lot.game.name }}</span>
                                    </li>
                                    <li v-if="Lot.tag != undefined && Lot.tag.name != undefined"><span
                                            class="key">{{language('category')}}</span><span
                                            class="value"><a
                                            :href="'#game-chat-' + Lot.tag.name">{{ Lot.tag.name }}</a></span>
                                    </li>
                                    <li v-if="Lot.server != undefined && Lot.server.name != undefined">
                                        <span
                                            class="key">{{language('server')}}</span><span
                                            class="value">{{ Lot.game.name }} {{ Lot.server.name }}<span
                                            v-if="Lot.server.side != undefined">{{Lot.server.side}}</span></span>
                                    </li>
                                    <li v-if="Lot.subtags != undefined" v-for="subtag in Lot.subtags"
                                        v-bind:key="subtag.id">
                                        <span class="key">{{ subtag.name }}</span>
                                        <span v-if="subtag.subtag_metadata!=undefined" class="value">{{subtag.subtag_metadata.name}}</span>
                                        <span v-else class="value">{{subtag.other_value}}</span>
                                    </li>
                                </ul>
                            </div>
                            <div v-if="auth != undefined && Lot.user.id != auth.id" class="c-games-chat__item-order ">
                                <form :action="'/create-trade/' + Lot.id"
                                      method="post">
                                    <input type="hidden" name="_token" :value="csrf">

                                    <div class="c-games-chat__item-order-ttl"><span>{{language('checkout')}}</span>
                                    </div>
                                    
                                    <div class="c-games-chat__item-order-inputs">

                                        <!-- <label class="checkbox-label c-games-chat__item-order-inputs-checkbox">
                                            <input type="checkbox" name="salers" true-value="1" false-value="" class="hidden-input">
                                            <span class="check-icon"></span>
                                            <span class="check-value">Отправить на аукцион</span>
                                        </label>


                                        <label class="checkbox-label c-games-chat__item-order-inputs-checkbox"><input type="checkbox" name="salers" true-value="1" false-value="" class="hidden-input"><span class="check-icon"></span><span class="check-value">Отправить на почту</span></label>
                                        <label class="checkbox-label c-games-chat__item-order-inputs-checkbox"><input type="checkbox" name="salers" true-value="1" false-value="" class="hidden-input"><span class="check-icon"></span><span class="check-value">Передать в руки</span></label> -->


                                        <label 
                                            class="checkbox-label c-games-chat__item-order-inputs-checkbox" 
                                            v-for="(param,index) in GameParams" 
                                            :id="param.id + '_checkbox_' + Lot.id" 
                                            v-if="param.custom_input == 'checkbox'">
                                            <input :type="param.custom_input" :id="param.id" v-on:change="customParam(param.id, Lot.id)" name="send" :value="param.id" class="hidden-input">
                                            <span class="check-icon"></span>
                                            <span class="check-value">{{ param.name }}</span>
                                        </label>
                                        
                                        

                                        <!-- <div class="form-group" v-for="(param,index) in GameParams" v-if="param.custom_input == 'checkbox'">
                                            <div class="form-group__ttl">
                                                {{ param.name }}
                                            </div>
                                            <div class="form-group">
                                                <input :type="param.custom_input" class="form-control" :id="param.id" v-on:change="customParam(param.id)">
                                            </div>
                                        </div> -->

                                        <div 
                                            class="form-group" 
                                            v-for="(param,index) in GameParams" 
                                            v-if="param.custom_input == 'min' && Tag.price_per_unit != 0">
                                            <div class="form-group__ttl">
                                                {{language(param.name)}}
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="min_items" :value="param.param" disabled>
                                            </div>
                                        </div>

                                        <div 
                                            class="form-group" 
                                            v-for="(param,index) in GameParams" 
                                            v-if="param.custom_input == 'max' && Tag.price_per_unit != 0">
                                            <div class="form-group__ttl">
                                                {{language(param.name)}}
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="max_items" :value="param.param" disabled>
                                            </div>
                                        </div>

                                        <div 
                                            class="form-group" 
                                            v-for="(param,index) in GameParams" 
                                            v-if="param.custom_input == 'text'">
                                            <div class="form-group__ttl">
                                                {{ param.name }} : {{ param.param }}
                                            </div>
                                        </div>
                                    </div> 
                            
                                    <div class="c-games-chat__item-order-inputs">
                                        

                                        <div class="form-group">
                                            <div class="form-group__ttl">{{language('payment_method')}}</div>
                                            <div class="select-wrap">
                                                <select name="pay_method" 
                                                        class="red-tooltip item-tooltip"
                                                        required 
                                                        data-toggle="tooltip" 
                                                        data-trigger="manual"
                                                        :title="language('choose')"
                                                        ref="select" 
                                                        v-model="select" 
                                                        v-on:change="calculatedPrice()"
                                                        tabindex="-98">
                                                    <option class="bs-title-option" value="">{{language('choose')}}</option>

                                                    <option v-if="Lot.price != undefined"
                                                            v-for="(commItem,index) in commission"
                                                            v-bind:key="commItem.id + 'commission-item'"
                                                            :class="{'special-option': commItem.priority == 1}"
                                                            :value="commItem.id">
                                                        {{commItem.title}} -
                                                        {{$parent.$parent.totalCommission(commItem,Lot.price)}}
                                                        {{commItem.symbol}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div v-if="Lot.availability != undefined" class="form-group get-price">
                                            <div class="input-wrap">
                                                <input :id="'availability-' + Lot.id + '-price'" disabled
                                                       class="form-control hidden" :value="Lot.price">
                                                <input :id="'availability-' + Lot.id + '-count'" disabled
                                                       class="form-control hidden" :value="Lot.availability">
                                            </div>

                                            <div v-if="Tag.price_per_unit != 0">
                                                <div class="form-group__ttl">{{language('amount')}}</div>
                                                <div class="input-wrap">
                                                    <input type="number" step="1" name="availability"
                                                           required="required"
                                                           :max="Lot.availability" v-model.number="Availability"
                                                           :id="'availability-' + Lot.id" v-on:keyup="calculatedPrice(); "
                                                           v-on:change="minMaxCount('availability_' + Lot.id); calculatedPrice();"
                                                           :placeholder="language('amount')" autocomplete="off" class="form-control"
                                                           :class="'form-control ' + 'availability_' + Lot.id"/>
                                                </div>
                                            </div>
                                            <div class="form-group__ttl">{{language('will_pay')}}</div>
                                            <div class="input-wrap input-group">
                                                <input name="total-price" :id="'availability-' + Lot.id + '-total'"
                                                       disabled
                                                       class="form-control" :value="Price">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="form-group__ttl">{{language('nickname')}}</div>
                                            <div class="input-wrap">
                                                <input type="text" name="character_name"
                                                       :placeholder="language('nickname')" value=""
                                                       required="required"
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="c-games-chat__item-order-footer">
                                        <button type="submit" :disabled="select == undefined"
                                                class="button btn btn_blue btn_upper create-trade-proposition">
                                            {{language('buy')}}
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div v-if="auth != undefined && Lot.user.id != auth.id" class="col-sm-12 col-xs-24">
                            <div class="c-games-chat__item-tabs">
                                <div class="c-games-chat__item-tabs-saler"><span
                                        class="c-games-chat__item-tabs-saler-name">{{Lot.user.name}}</span>
                                    <span v-if="Lot.user.is_online" class="c-chat__online">online</span>
                                    <span v-else class="c-chat__offline">offline</span>
                                </div>
                                <div role="tablist"
                                     class="c-tab-nav c-games-chat__item-tabs-nav xs-full xx-full">
                                    <button type="button" class="c-tab-nav__trig visible-xs">
                                        <span>{{language('chat_with_seller')}}</span>
                                    </button>
                                    <ul class="c-tab-nav__drop h-list minimized">
                                        <li role="presentation" class="active"><a
                                                :href="'#saler-chat-'+ Lot.id"
                                                :aria-controls="'saler-chat-'+ Lot.id"
                                                role="tab"
                                                data-toggle="tab"><span>{{language('chat_with_seller')}}</span></a>
                                        </li>
                                        <li role="presentation">
                                            <a :href="'#saler-feedbacks-'+ Lot.id"
                                               :aria-controls="'saler-feedbacks-'+ Lot.id"
                                               role="tab"
                                               data-toggle="tab"><span>{{language('seller_reviews')}}</span></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-content">
                                    <div role="tabpanel" :id="'saler-chat-'+ Lot.id"
                                         class="tab-pane fade active in">
                                        <div class="saler-chat">
                                            <div class="saler-chat__list c-games-chat__adena-left js-custom-scroll">
                                                <div v-if="Messages.length > 0">
                                                    <div v-if="AllMsgCount > CurrentMsgIndex"
                                                         class="c-chat__dialog-item"
                                                         style="text-align: center">
                                                        <a v-on:click="getMoreMsg()">{{language('show_more')}}</a>
                                                    </div>
                                                    <chat-message v-for="(chat_message, index) in Messages"
                                                                  v-bind:chat_message="chat_message"
                                                                  v-bind:key="index + '-chat'"
                                                                  :auth="auth"></chat-message>
                                                </div>
                                                <div v-else class="saler-chat__list c-games-chat__adena-left">
                                                    <div class="c-chat__dialog-item">
                                                        <div class="c-chat__avatar">
                                                        </div>
                                                        <div class="c-chat__dialog-info is-system">
                                                            <div class="c-chat__dialog-bottom">
                                                                <span class="c-chat__dialog-msg">
                                                                    {{language('before_placing_an_order')}}
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="saler-chat__form">
                                                <div class="form-group">
                                                    <div class="input-wrap chat-textarea-1">
                                                            <textarea v-model="text"
                                                                      @keyup.enter="sendMessage(isDisabled)"
                                                                      :placeholder="language('enter_message')"
                                                                      maxlength="400"
                                                                      required="required"
                                                                      class="form-control no-resize"></textarea>
                                                    </div>
                                                </div>
                                                <div class="saler-feedbacks__form-footer">
                                                    <button type="button"
                                                            class="btn btn_blue btn_upper msg-send-button"
                                                            v-on:click="sendMessage()" :disabled="isDisabled"
                                                            v-bind:class="{' js-send-msg': auth != undefined}">
                                                        {{language('send')}}
                                                    </button>
                                                    <button v-if="ActiveTrade.includes(parseInt(LotID)) && (auth.id != Lot.user.id)"
                                                            type="button"
                                                            v-on:click="closeTrade()"
                                                            class="btn btn_red btn_upper">
                                                        {{language('validate_purchase')}} {{lotActiveTradeCount()}}
                                                    </button>
                                                    <button v-if="ActiveTrade.includes(parseInt(LotID)) && (auth.id == lotOwnerId)"
                                                            type="button"
                                                            v-on:click="refuseMoney()"
                                                            class="btn btn_red btn_upper">
                                                        {{language('return_money')}} {{lotActiveTradeCount()}}
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" :id="'saler-feedbacks-'+ Lot.id"
                                         class="tab-pane fade">
                                        <div class="saler-feedbacks">
                                            <div class="saler-feedbacks__list js-custom-scroll">
                                                <feedback v-for="(feedback, index) in Feedbacks"
                                                          v-bind:feedback="feedback"
                                                          v-bind:key="index + '-feedback'"
                                                          :auth="auth">
                                                </feedback>
                                            </div>
                                            <div v-if="canSendFeedback != undefined" class="saler-feedbacks__form">
                                                <div class="form-group">
                                                    <div class="input-wrap">
                                                        <textarea placeholder="Написать отзыв"
                                                                  maxlength="250"
                                                                  v-model="review"
                                                                  @keyup.enter="sendFeedback()"
                                                                  required="required"
                                                                  class="form-control no-resize"></textarea>
                                                    </div>
                                                </div>
                                                <div class="saler-feedbacks__form-radios">
                                                    <div class="form-group">
                                                        <label class="radio-label label_good">
                                                            <input type="radio"
                                                                   name="mark"
                                                                   v-model="mark"
                                                                   v-bind:value="1"
                                                                   class="hidden-input"/><span
                                                                class="check-icon"></span><span
                                                                class="check-value">{{language('positive')}}</span>
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="radio-label label_bad">
                                                            <input type="radio"
                                                                   name="mark"
                                                                   v-model="mark"
                                                                   v-bind:value="0"
                                                                   class="hidden-input"/><span
                                                                class="check-icon"></span><span
                                                                class="check-value">{{language('negative')}}</span>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="saler-feedbacks__form-footer">
                                                    <button v-on:click="sendFeedback()"
                                                            class="btn btn_blue btn_upper">
                                                        {{language('send')}}
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Feedback from './Feedback.vue'


    export default {
        props: ['tag', 'game', 'lot', 'auth', 'newMsg', 'activeTrade', 'newMsgCount', 'commission', 'active', 'csrf', 'gameParams', 'lang'],
        components: {Feedback},
        data() {

            return {
                Game: this.game,
                Tag: this.tag,
                Lot: this.lot,
                text: '',
                LotID: undefined,
                Messages: [],
                Active: this.active,
                Price: undefined,
                Availability: undefined,
                select: undefined,
                NewMsg: [],
                ActiveTrade: [],
                AllMsgCount: undefined,
                CurrentMsgIndex: undefined,
                Feedbacks: [],
                mark: undefined,
                review: '',
                currentUserId: undefined,
                canSendFeedback: undefined,
                lastActiveThread: undefined,
                isDisabled: false,
                currencySymbol: '₽',
                maxAvailability: 0,
                Lang: this.lang,

                GameParams: this.gameParams,
            }
        },
        watch: {
            activeTrade: function (value) {
                this.ActiveTrade = value;
            },
            lot: function (value) {
                this.Lot = value;
            },
            active: function (value) {
                this.Active = value;
            }
        },
        computed: {
            timestamp: function () {
                // console.log(moment.utc(this.Lot.user.created_at, 'YYYY-MM-DD').local());
                return moment.utc(this.Lot.user.created_at, 'YYYY-MM-DD').local()._i
                // return moment.utc(this.Lot.user.created_at, 'YYYY-MM-DD').local().fromNow(true);
            }
        },
        methods: {
            language: function(name) {
                let lang = '';
                if(!!this.lang) {
                    this.lang.forEach( (element, index) => {
                        if(name == element.name && !!element.vue_translate) 
                            lang = element.vue_translate.name;
                        else if(name == element.name && !element.vue_translate) lang = name;
                    });
                } else {
                    lang = name;
                }
                return lang;
            },
            minMaxCount(id) {
                var price           = $("." + id).val();
                var max             = $('#max_items').val();
                var min             = $('#min_items').val();
                if (parseInt(min) > parseInt(price)) var value = parseInt(min);
                else if (parseInt(max) < parseInt(price)) var value = parseInt(max);
                else var value      = parseInt(price);
                this.Availability   = value;
            },

            maxCount(id) {
                var price           = $("." + id).val();
                var max             = $('#max_items').val();
                if (parseInt(max) < parseInt(price)) var value = parseInt(max);
                else var value      = parseInt(price);
                this.Availability   = value;
            },

            customParam(idInput, lotId) {
                var array = [];
                var elementsCount = 0;
                var count = 0;
                let item = $(this.$el).find('#' + idInput + '_checkbox_' + lotId).find('input').is(":checked");
                this.gameParams.forEach(function(el, id){
                    if(el.custom_input == "checkbox") {
                        if(el.id != idInput && item == true) $('#' + el.id + '_checkbox_' + lotId).hide();
                        else $('#' + el.id + '_checkbox_' + lotId).show();
                    }
                });
            },

            getChat(lot_id) {
                this.$bus.$emit('activeItem', lot_id);
                $(".red-tooltip").tooltip("hide");
                $('.input-wrap_error').remove();
                $(".form-control").removeClass('error');
                if (this.Active == lot_id) {
                    this.Active = undefined;
                    this.Messages = [];
                    this.LotID = undefined;
                } else {

                    this.Messages = [];
                    this.Active = lot_id;
                    this.LotID = lot_id;
                    if (this.Lot.user.id != this.auth.id) {
                        this.AllMsgCount = undefined;
                        this.CurrentMsgIndex = undefined;
                        this.getMsgRequest(lot_id);
                    }
                    this.getFeedbackList(lot_id);
                    if (this.lastActiveThread != undefined)
                        Echo.leave('threads.chats.' + this.lastActiveThread);
                }
            },
            getMsgRequest(lot_id, msg_index = undefined) {
                let item = $(this.$refs.item);
                axios.post('/get_lot_message', {lot_id: lot_id, skip: msg_index}).then((response) => {
                        this.AllMsgCount = parseInt(response.data.messages_count);
                        this.CurrentMsgIndex = parseInt(response.data.current_msg_index);
                        if (!msg_index && response.data.thread_id != undefined) {
                            this.lastActiveThread = parseInt(response.data.thread_id);
                            this.$bus.$emit('activeThread', parseInt(response.data.thread_id));
                            this.listenForNewMessage(parseInt(response.data.thread_id));
                            this.newMsgCount[lot_id] = undefined;
                            let index = this.NewMsg.indexOf(lot_id);
                            if (index >= 0)
                                this.NewMsg.splice(index, 1);
                        }
                        if (response.data.length != 0) {
                            let scroll = item.siblings('.panel-collapse').find('.js-custom-scroll');
                            scroll.perfectScrollbar({
                                suppressScrollX: true
                            });
                            if (!msg_index) {
                                let index = this.NewMsg.indexOf(parseInt(response.data.user.id));
                                this.currentUserId = parseInt(response.data.user.id);
                                if (index > -1) {
                                    this.NewMsg.splice(index, 1);
                                }

                                if (this.newMsgCount[response.data.user.id] != undefined) {
                                    this.$bus.$emit('removeCounter', this.newMsgCount[parseInt(response.data.user.id)]);
                                    // this.newMsgCount[parseInt(response.data.user.id)] = undefined;
                                    this.$bus.$emit('chatMsgCounter', parseInt(response.data.user.id));
                                }
                                scroll.scrollTop(0);
                                this.Messages = response.data.messages.reverse();
                                scroll.animate({scrollTop: scroll.prop('scrollHeight') + 1000}, 500);

                            } else {
                                this.Messages = response.data.messages.reverse().concat(this.Messages);
                                let count = parseInt(response.data.messages.length);
                                let element = scroll.find('.c-chat__dialog-item').slice(0, count);
                                let outerHeight = 0;
                                element.each(function () {
                                    outerHeight += $(this).outerHeight();
                                });
                                outerHeight += 50;
                                scroll.scrollTop(outerHeight);
                            }
                        } else {
                            this.Messages = [];
                            this.$bus.$emit('activeThread', undefined);
                        }
                    }
                ).catch(function (error) {
                    console.log(error);
                });
            },
            getMoreMsg() {
                this.getMsgRequest(this.LotID, this.CurrentMsgIndex);
            },
            getFeedbackList(lot_id) {
                this.Feedbacks = [];
                this.canSendFeedback = undefined;
                this.mark = 1;
                this.review = '';
                axios.post('/get/user/feedback', {
                    lot_id: lot_id
                }).then((response) => {
                    this.Feedbacks = response.data.review;
                    if (response.data.send_feedback_access != undefined)
                        this.canSendFeedback = true;
                }).catch(function (error) {
                    console.log(error);
                });

            },
            sendFeedback() {
                axios.post('/send_user_feedback/' + this.currentUserId, {
                    lot_id: this.LotID,
                    text: this.review,
                    mark: this.mark
                }).then((response) => {
                    if (response.data.false) {
                        alert(response.data.msg);
                    } else {
                        console.log(response.data);
                        this.Feedbacks.push(response.data.review);
                        this.canSendFeedback = undefined;
                    }
                }).catch((response) => {
                    console.log(response);
                });
            },
            sendMessage(disable = false) {
                let text = this.text;

                if (this.LotID == undefined) alert('Выберите, кому вы хотите отправить сообщение');

                else if (text.length > 400) alert('Лимит одного собщенния 400 знаков, у вас в сообщении ' + text.length + ' знаков.');
                else {
                    this.isDisabled = true;
                    let item = $(this.$refs.item);
                    let textWithoutEnter = text.replace(/\n/g, "");
                    if (this.auth != undefined) {
                        if (this.LotID != undefined && this.text != '' && textWithoutEnter.length > 0 && !disable) {
                            this.text = '';
                            axios.post('/send_lot_message', {
                                text: text,
                                lot_id: this.LotID
                            }).then((response) => {
                                this.text = '';

                                let scroll = item.siblings('.panel-collapse').find('.js-custom-scroll');
                                scroll.perfectScrollbar({
                                    suppressScrollX: true
                                });
                                this.Messages.push(response.data.message);
                                scroll.animate({scrollTop: scroll.prop('scrollHeight') + 300}, 500);
                            }).catch(function (error) {
                                alert(error.response.data.msg);
                                console.log(error.response.data.msg);
                                this.text = '';
                            });
                            let $button = $('.msg-send-button');
                            let timer = 3;
                            $button.text('Отправить (' + timer + ')');
                            let downloadTimer = setInterval(function () {
                                $button.text('Отправить (' + timer + ')');
                                --timer;
                                $button.text('Отправить (' + timer + ')');
                                if (timer <= 0) {
                                    clearInterval(downloadTimer);
                                    $button.text('Отправить');
                                }
                            }, 1000);
                            setTimeout(() => this.isDisabled = false, 3000);

                        }
                    } else {
                        alert('Войдите или зарегистрируйтесь')
                    }
                }

            },
            closeTrade() {
                if (this.calculateLotActiveTrade() > 1) {
                    let win = window.open('/purchases', '_blank');
                    win.focus();
                } else {
                    let item = $(this.$refs.item);
                    axios.post('/axios-update-trade', {
                        lot_id: this.LotID
                    }).then((response) => {
                        let scroll = item.siblings('.panel-collapse').find('.js-custom-scroll');
                        scroll.perfectScrollbar({
                            suppressScrollX: true
                        });
                        this.Messages.push(response.data.msg);
                        scroll.animate({scrollTop: scroll.prop('scrollHeight') + 300}, 500);
                        this.$bus.$emit('closePurchases', {'lot_id': this.LotID});
                    }).catch(function (error) {
                        alert(error.response.data);
                        console.log(error.response.data);
                    });
                }
            },
            refuseMoney() {
                if (this.calculateLotActiveTrade() > 1) {
                    let win = window.open('/sales', '_blank');
                    win.focus();
                } else {
                    let item = $(this.$refs.item);
                    axios.post('/axios-refuse-money-trade', {
                        lot_id: this.LotID
                    }).then((response) => {
                        let scroll = item.siblings('.panel-collapse').find('.js-custom-scroll');
                        scroll.perfectScrollbar({
                            suppressScrollX: true
                        });
                        this.Messages.push(response.data.msg);
                        scroll.animate({scrollTop: scroll.prop('scrollHeight') + 300}, 500);
                        this.$bus.$emit('closePurchases', {'lot_id': this.LotID});
                    }).catch(function (error) {
                        alert(error);
                        console.log(error);
                    });
                }
            },
            calculateLotActiveTrade() {
                let lot_id = this.LotID;
                return $.grep(this.ActiveTrade, function (elem) {
                    return elem == lot_id;
                }).length;
            },
            lotActiveTradeCount() {
                let count = this.calculateLotActiveTrade();
                if (count > 1)
                    return '(' + count + ')';
            },
            listenForNewMessage(thread_id) {
                let item = $(this.$refs.item);
                Echo.private('threads.chats.' + parseInt(thread_id)).listen('ChatGlobalMessage', (e) => {
                    let scroll = item.siblings('.panel-collapse').find('.js-custom-scroll');
                    scroll.perfectScrollbar({
                        suppressScrollX: true
                    });
                    this.Messages.push(e.message);
                    scroll.animate({scrollTop: scroll.prop('scrollHeight') + 300}, 500);
                });
            },
            calculatedPrice() {

                let $pay_method = $(this.$refs.select);
                let text = null;

                let selectId = this.select;

                this.currencySymbol = this.findCommissionSymbol('id', this.select);

                let result = $.grep(this.commission, function (e) {
                    return e.id == selectId;
                });


                if (result.length == 0) text = 'Необходимо выбрать способ оплаты';
                else {
                    let availability = this.Availability;
                    if (availability == undefined) availability = 1;

                    if (this.Lot.availability < availability) text = 'У продавца не хватает товара';


                    this.Price = (this.Lot.price * availability / this.$parent.$parent.commissionSum(result[0])).toFixed(2);

                }

                if (text != null) {
                    $pay_method.attr('title', text)
                        .tooltip('fixTitle')
                        .tooltip('show');
                }
                else $pay_method.tooltip('hide');
            },
            findCommissionSymbol(key, value) {
                let obj = this.commission;
                let symbol = this.currencySymbol;
                Object.keys(obj).forEach(function (c) {
                    if (parseInt(obj[c][key]) == value) symbol = obj[c]['symbol'];
                });
                return symbol;
            },
            totalPrice: function (val) {
                return parseFloat(this.$parent.$parent.totalCommission(val, this.Lot.price)).toFixed(2);
            },
            displayReviewCount: function (count, html) {
                return this.$parent.$parent.$options.methods.reviewToDisplayCalculate(count, html)
            }

        },
        updated() {
            $(this.$refs.select).selectpicker('refresh');
        },
        mounted() {
            if (this.Tag.price_per_unit == 0) this.Price = this.$parent.$parent.totalCommission(this.commission[2], this.Lot.price);
        }
    }
</script>

<style scoped>
    .tooltip-inner {
        border: solid 10px #ccc;
    }
</style>