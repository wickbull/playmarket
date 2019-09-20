<template>
    <div role="tabpanel" :id="'game-chat-' + Currency.name" class="tab-pane fade"
         v-bind:class="{ ' active in':  Game.currency.length > 0 && count == 0}">
        <div class="c-games-chat__adena">
            <div class="c-games-chat__buttons">
                <div class="row">
                    <div v-if="auth != undefined" class="col-xs-24">
                        <a :href="'/game/' + Game.id + '/sell-service/' + Currency.name + '-' + Currency.id" type="button"
                           class="btn btn_blue-white btn_upper btn_auto-height c-games-chat__btn-abs">
                            {{ language('sale_game_money') }}
                        </a>
                    </div>
                    <div v-else class="col-xs-24">
                        <a href="#" type="button" v-on:click="unregisterAlarm()"
                           class="btn btn_blue-white btn_upper btn_auto-height c-games-chat__btn-abs">
                            {{ language('sale_game_money') }}
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-14 col-xs-24 col-md-6_10 col-lg-14">
                    <div class="c-games-chat__adena-left">
                        <div class="c-games-chat__adena-filter">
                            <div class="row">
                                

                                <div class="col-md-16 col-sm-13 col-xs-14 col-xx-24">
                                    <div class="form-group">
                                        <div class="form-group__ttl"><b>{{ Game.name }}</b> - {{ language('server') }}:</div>

                                        <div class="select-wrap">
                                            <select id="server-search" class="selectpicker" name="server"
                                                    v-on:change="filterData()" v-model="server"
                                                    
                                                    >
                                                    <!-- class="selectpicker" -->
                                                <option value="">{{ language('choose') }}</option>
                                                <option v-for="server in Game.servers"
                                                        v-bind:key="server.id"
                                                        :value="server.id">{{server.name}}<span
                                                        v-if="server.side!=undefined">{{server.side}}</span>
                                                </option>
                                            </select>
                                        </div>
                                    </div>

									<div class="form-group">
                                        <div class="form-group__ttl">{{ language('sort') }}:</div>
                                        <div class="select-wrap">
                                            <select id="server-sorts" name="sorts"
                                                    @change="filterData()" v-model="sorts"
                                                    class="selectpicker"
                                                    >
                                                    <!-- class="selectpicker" -->
                                                <option value="0">{{ language('choose') }}</option>
                                                <option value="1">{{ language('price_up') }}</option>
                                                <option value="2">{{ language('price_down') }}</option>
                                                <option value="5">{{ language('earlier') }}</option>
                                                <option value="6">{{ language('later') }}</option>
                                            </select>
                                        </div>
                                    </div>



                                    <div v-if="Game.subtags != undefined">
                                        <div v-for="subtag in Game.subtags"
                                             v-bind:key="subtag.id"
                                             class="form-group">
                                            <div v-if="subtag.attach == 1">
                                                <div class="form-group__ttl">{{subtag.name}}</div>
                                                <div class="select-wrap">
                                                    <select name="side" class="selectpicker"
                                                            v-model="side" v-on:change="filterData()">
                                                        <option v-for="subTagMetadata in subtag.subTagMetadata"
                                                                v-bind:key="subTagMetadata.id"
                                                                :value="subTagMetadata.id">{{subTagMetadata.name}}
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-8 col-sm-11 col-xs-10 col-xx-24">
                                    <div class="form-group dib">
                                        <label class="checkbox-label">
                                            <input id="salers" type="checkbox" name="salers"
                                                   v-model="salers"
                                                   v-bind:true-value="1"
                                                   v-bind:false-value="''"
                                                   v-on:change="filterData()"
                                                   class="hidden-input"/>
                                                   <span class="check-icon  check-icon--notop"></span>
                                                   <span class="check-value">{{ language('salers') }}</span>
                                        </label>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="c-games-chat__adena-list-wrap">
                            <div class="c-games-chat__adena-list-ttl">
                                <div class="t-c c-games-chat__adena-list-saler"><span>{{ language('saler') }}</span></div>
                                <div class="t-c c-games-chat__adena-list-rating text-center"><span>{{ language('rating') }}</span></div>
                                <div class="t-c c-games-chat__adena-list-side text-center"><span>{{ language('server') }}</span></div>
                                <div class="t-c c-games-chat__adena-list-stock text-center"><span>{{ language('availability') }}</span></div>
                                <div class="t-c c-games-chat__adena-list-price text-center">
                                    <span>{{ language('price_by_1') }} {{Currency.unity}}</span>
                                </div>
                            </div>
                            <div class="c-games-chat__adena-list js-custom-scroll" id="server-adena-list">
                                <!-- .sort(function(x,y){return (x.top === y.top)? 0 : x.top? -1 : 1;}) -->
                                <div v-for="curr_lot in Lots"
                                     v-bind:key="curr_lot.id"
                                     v-on:click="getChat(curr_lot)">
                                    <shop-currency-chat
                                            v-if="curr_lot.game_id == Game.id && curr_lot.active == 1"
                                            class="c-games-chat__adena-item"
                                            v-bind:id="curr_lot.game_id"
                                            v-bind:class="{ ' is-active': Active == curr_lot.id,
                                               ' has-new-msg': NewMsg.includes(parseInt(curr_lot.user.id)),
                                               ' has-deal': ActiveTrade.includes(parseInt(curr_lot.id))}"
                                            v-bind:price="$parent.totalCommission(commission[2],curr_lot.price)"
                                            v-bind:lot="curr_lot"
                                            v-bind:unity="Currency.unity"
                                            :msgCount="newMsgCount[curr_lot.user.id]"
                                            :lang="Lang"
                                            :admin="Admin">
                                    </shop-currency-chat>
                                </div>
                            </div>

                            <div class="c-games-chat__adena-list js-custom-scroll" id="adena-list"
                                 style="display: none;">
                            </div>
                        </div>
                    </div>
                    <div class="c-games-chat__adena-form">
                        <form class="js-form_check" target="_blank" :action="'/create-trade/' + LotID" method="post" autocomplete="off">
                            <input type="hidden" name="_token" :value="csrf">
                            <div class="c-games-chat__adena-form-ttl"><span>{{ language('checkout') }}</span></div>
                            <div class="row">
                                <div class="col-md-12 col-sm-24 col-xs-12 col-xx-24">
                                    <div class="form-group">
                                        <div class="form-group__ttl">{{ language('payment_method') }}</div>
                                        <div class="select-wrap">
                                            <div class="btn-group bootstrap-select" v-on:click="lotCheck()">
                                                <select name="pay_method" class="selectpicker red-tooltip" required
                                                        ref="select" v-model="select" id="pay-method"
                                                        v-on:change="changeSymbol()"
                                                        data-toggle="tooltip" data-trigger="manual" :title="language('choose')">
                                                    <option v-if="price != undefined"
                                                            v-for="commItem in commission"
                                                            v-bind:key="commItem.id + 'commission'"
                                                            :class="{'special-option': commItem.priority == 1}"
                                                            :value="commItem.id">{{commItem.title}} -
                                                        {{ $parent.totalCommission(commItem,price)}} за
                                                        {{Currency.unity}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
																
                                <div class="col-md-12 col-sm-24 col-xs-12 col-xx-24">
                                    <div class="form-group">
                                        <div class="form-group__ttl">{{ language('hero_name') }}</div>
                                        <div class="input-wrap">
                                            <input type="text" name="character_name" :placeholder="language('hero_name')" value=""
                                                   id="character-name" required
                                                   data-toggle="tooltip" data-trigger="manual" title=""
                                                   class="form-control red-tooltip">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-24 col-xs-12 col-xx-24">
                                    <div class="form-group">
                                        <div class="form-group__ttl">{{ language('will_pay') }}</div>
                                        <div class="input-wrap input-group">
                                            <input v-model="payment" :min="minPrice" id="input-payment"
                                                   v-on:keyup="calculatedPrice(true)" title=""
                                                   data-toggle="tooltip" data-trigger="manual"
                                                   type="number" autocomplete="off"
                                                   name="value" v-on:change="minPriceAlert()" required
                                                   placeholder="00.00 ₽" value=""
                                                   class="form-control red-tooltip">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-24 col-xs-12 col-xx-24">
                                    <div class="form-group">
                                        <div class="form-group__ttl">{{ language('will_receive') }}</div>
                                        <div class="input-wrap input-group">
                                            <input v-model="totalValue" v-on:keyup="calculatedPrice(false)"
                                                   type="number" autocomplete="off" id="input-total"
                                                   :max="maxAvailability"
                                                   v-on:change="minPriceAlert()" required
                                                   name="availability" :placeholder="'00.00 ' + displayCurrencyKeyword()"
                                                   class="form-control red-tooltip">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="c-games-chat__adena-form-footer">
                                <button type="submit" class="btn btn_blue btn_upper">{{ language('buy') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-10 col-xs-24 col-md-4_10 col-lg-10">
                    <div class="c-games-chat__item-tabs ">
                        <div class="c-games-chat__item-tabs-saler">
                            <span class="c-games-chat__item-tabs-saler-name">{{defaultName}}</span>
                            <span v-if="defaultStatus == undefined"></span>
                            <span v-else-if="defaultStatus" class="c-chat__online c-chat__online-nop">online</span>
                            <span v-else class="c-chat__offline">offline</span>
                        </div>
                        <div role="tablist"
                             class="c-tab-nav c-games-chat__item-tabs-nav xs-full xx-full">
                            <button type="button" class="c-tab-nav__trig visible-xs"><span>{{ language('chat_with_seller') }}</span>
                            </button>
                            <ul class="c-tab-nav__drop h-list minimized">
                                <li role="presentation" class="active"><a
                                        href="#saler-chat"
                                        aria-controls="saler-chat"
                                        role="tab"
                                        data-toggle="tab"><span>{{ language('chat_with_seller') }}</span></a>
                                </li>
                                <li role="presentation"><a href="#saler-feedbacks"
                                                           aria-controls="saler-feedbacks"
                                                           role="tab"
                                                           data-toggle="tab"><span>{{ language('seller_reviews') }}</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div role="tabpanel" id="saler-chat"
                                 class="tab-pane fade active in">
                                <div class="saler-chat" id="currency-chat">
                                    <div class="saler-chat__list c-games-chat__adena-left js-custom-scroll">
                                        <div v-if="Messages.length > 0">
                                        <div v-if="AllMsgCount > CurrentMsgIndex" class="c-chat__dialog-item"
                                             style="text-align: center">
                                            <a v-on:click="getMoreMsg()">{{ language('show_more') }}</a>
                                        </div>
                                        <chat-message
                                                v-for="(chat_message, index) in Messages"
                                                      v-bind:chat_message="chat_message"
                                                      v-bind:key="index + '-chat'"
                                                      :auth="auth"></chat-message>
                                        </div>
                                        <div v-else class="saler-chat__list c-games-chat__adena-left">
                                            <div class="c-chat__dialog-item">
                                                <div class="c-chat__avatar">
                                                </div>
                                                <div class="c-chat__dialog-info is-system">
                                                    <div class="c-chat__dialog-bottom"><span
                                                            class="c-chat__dialog-msg">{{ language('before_placing_an_order') }}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div v-if="LotID !== undefined"  class="saler-chat__form">
                                            <div class="form-group">
                                                <div class="input-wrap chat-textarea">
                                                    <textarea v-model="text" maxlength="400"
                                                              @keyup.enter="sendMessage(isDisabled)"
                                                              placeholder="Введите сообщение" required="required"
                                                              class="form-control no-resize"></textarea>
                                                </div>
                                            </div>
                                            <div class="saler-feedbacks__form-footer">
                                                <button type="button"
                                                        class="btn btn_blue btn_upper msg-send-button"
                                                        v-on:click="sendMessage()" :disabled="isDisabled"
                                                        v-bind:class="{' js-send-msg': auth != undefined}">{{ language('send') }}
                                                </button>
                                                <button v-if="ActiveTrade.includes(parseInt(LotID)) && (auth.id != lotOwnerId)"
                                                        type="button"
                                                        v-on:click="closeTrade()"
                                                        class="btn btn_red btn_upper">
                                                    {{ language('validate_purchase') }} {{lotActiveTradeCount()}}
                                                </button>
                                                <button v-if="ActiveTrade.includes(parseInt(LotID)) && (auth.id == lotOwnerId)"
                                                        type="button"
                                                        v-on:click="refuseMoney()"
                                                        class="btn btn_red btn_upper">
                                                    {{ language('return_money') }} {{lotActiveTradeCount()}}
                                                </button>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" id="saler-feedbacks"
                                 class="tab-pane fade">
                                <div class="saler-feedbacks">
                                    <div class="saler-feedbacks__list js-custom-scroll">
                                        <feedback v-for="(feedback, index) in Feedbacks"
                                                  v-bind:feedback="feedback"
                                                  v-bind:key="index + '-feedback'"
                                                  :auth="auth"
                                                  :lang="Lang">
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
                                                        class="check-value">{{ language('positive') }}</span>
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
                                                        class="check-value">{{ language('negative') }}</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div v-if="LotID !== undefined" class="saler-feedbacks__form-footer">
                                            <button v-on:click="sendFeedback()"
                                                    class="btn btn_blue btn_upper">
                                                {{ language('send') }}
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
</template>

<script>
    import CurrencySaleChat from './CurrencySaleChat.vue';
    import ChatMessage from '../chat/ChatMessage.vue';
    import Feedback from './Feedback.vue';
    import Modal from './Modal-item.vue';


    export default {
        props: ['game', 'currency', 'auth', 'newMsg', 'activeTrade', 'newMsgCount', 'commission', 'csrf', 'count', 'admin', 'lang'],
        components: {CurrencySaleChat, ChatMessage, Feedback, Modal},
        data() {

            return {
                Admin: this.admin,
                Lang: this.lang,

                Lots: this.currency.lots.sort(function(x,y){return (x.top === y.top)? 0 : x.top? -1 : 1;}),
                Game: this.game,
                Currency: this.currency,
                defaultName: 'Пользователь',
                defaultStatus: undefined,
                Messages: [],
                LotID: undefined,
                text: '',
                Active: undefined,
                NewMsg: [],
                ActiveTrade: [],
                server: '',
                side: '',
                salers: '0', //Seller Online = 1
                sorts: 0,
                availability: 0,
                price: undefined,
                payment: undefined,
                minPrice: undefined,
                totalValue: 0,
                select: undefined,
                commissionValue: undefined,
                AllMsgCount: undefined,
                CurrentMsgIndex: undefined,
                Feedbacks: [],
                mark: undefined,
                lotOwnerId: undefined,
                review: '',
                currentUserId: undefined,
                canSendFeedback: undefined,
                showModal: false,
                lastActiveThread: undefined,
                isDisabled: false,
                currencySymbol: '₽',
                maxAvailability: 0
            }
        },
        watch: {
            // newMsg: function (value) {
            //     this.NewMsg = value;
            // },
            activeTrade: function (value) {
                this.ActiveTrade = value;
            },
        },
        methods: {
            language: function(name) {
                let lang = '';
                if(!!this.lang) {
                    this.lang.forEach( (element, index) => {

                        if(name == element.name && !!element.vue_translate) lang = element.vue_translate.name;
                        else if(name == element.name && !element.vue_translate) lang = name;
                    });
                } else lang = name;
                return lang;
            },
            getChat(lot) {
                $(".red-tooltip").tooltip("hide");
                $('.input-wrap_error').remove();
                $(".form-control").removeClass('error');
                let lot_id = lot.id;
                this.availability = lot.availability;
                this.maxAvailability = lot.availability;
                this.price = lot.price;
                this.LotID = lot_id;
                this.Active = lot_id;
                this.totalValue = undefined;
                this.payment = undefined;
                this.minPrice = lot.min_order;
                this.select = undefined;
                this.defaultName = lot.user.name;
                this.lotOwnerId = lot.user.id;
                this.defaultStatus = lot.user.is_online;
                if (this.auth != undefined && lot.user.id != this.auth.id) {
                    this.AllMsgCount = undefined;
                    this.CurrentMsgIndex = undefined;
                        this.currencyMsgGetRequest(lot_id);
                }
                this.getFeedbackList(lot_id);

                if (this.lastActiveThread != undefined) Echo.leave('threads.chats.' + this.lastActiveThread);

            },
            getMoreMsg() {
                this.currencyMsgGetRequest(this.LotID, this.CurrentMsgIndex);
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
                    if (response.data.send_feedback_access != undefined) this.canSendFeedback = true;
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
                    if (response.data.false) alert(response.data.msg);
                    else {
                        console.log(response.data);
                        this.Feedbacks.push(response.data.review);
                        this.canSendFeedback = undefined;
                    }
                }).catch((response) => {
                    console.log(response);
                });
            },
            currencyMsgGetRequest(lot_id, msg_index = null) {
                axios.post('/get_lot_message', {lot_id: lot_id, skip: msg_index}).then((response) => {
                        if (response.data.length != 0) {
                            this.AllMsgCount = parseInt(response.data.messages_count);
                            this.CurrentMsgIndex = parseInt(response.data.current_msg_index);
                            if (!msg_index) {
                                this.currentUserId = parseInt(response.data.user.id);

                                /*
                                 *  Active thread send to counter
                                 */
                                if (response.data.thread_id != undefined) {
                                    /*
                                     * Send active thread to header
                                     */
                                    this.lastActiveThread = parseInt(response.data.thread_id);
                                    this.$bus.$emit('activeThread', parseInt(response.data.thread_id));
                                    this.listenForNewMessage(response.data.thread_id);
                                }

                                /*
                                 * Mark list as read
                                 */
                                let index = this.NewMsg.indexOf(parseInt(response.data.user.id));
                                if (index > -1) this.NewMsg.splice(index, 1);

                                /*
                                 * Remove counter unread msg
                                 */
                                if (this.newMsgCount[parseInt(response.data.user.id)] != undefined) {
                                    /*
                                     * Send count to header
                                     */
                                    this.$bus.$emit('removeCounter', this.newMsgCount[parseInt(response.data.user.id)]);
                                    this.$bus.$emit('chatMsgCounter', parseInt(response.data.user.id));

                                }
                            }

                            /*
                             * Scroll to Top
                             */
                            let scroll = $('#currency-chat .js-custom-scroll');
                            scroll.perfectScrollbar({
                                suppressScrollX: true
                            });

                            if (!msg_index) {
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
            sendMessage(disable = false) {
                let text = this.text;
                if (this.LotID == undefined) alert(this.language('alert_choose_whom'));
                else if (text.length > 400) alert(this.language('alert_limit_message') + text.length + this.language('alert_symbols'));
                else {
                    this.isDisabled = true;
                    let textWithoutEnter = text.replace(/\n/g, "");
                    if (this.auth != undefined) {
                        if (this.LotID != undefined && this.text != '' && textWithoutEnter.length > 0 && !disable) {
                            this.text = '';
                            axios.post('/send_lot_message', {
                                text: text,
                                lot_id: this.LotID
                            }).then((response) => {
                                this.text = '';
                                if (this.Messages.length == 0) this.$bus.$emit('createdNewChatEvent', response.data);
                                this.Messages.push(response.data.message);
                                $('.saler-chat__list').animate({scrollTop: $('#currency-chat .js-custom-scroll').prop("scrollHeight") + 300}, 500);
                            }).catch(function (error) {
                                alert(error.response.data.msg);
                                console.log(error.response.data.msg);
                                this.text = '';
                            });

                            let $button = $('.msg-send-button');
                            let timer = 3;
                            $button.text(this.language('send') + ' (' + timer + ')');
                            let downloadTimer = setInterval(function () {
                                $button.text(this.language('send') + ' (' + timer + ')');
                                --timer;
                                $button.text(this.language('send') + ' (' + timer + ')');
                                if (timer <= 0) {
                                    clearInterval(downloadTimer);
                                    $button.text(this.language('send'));
                                }
                            }, 1000);
                            setTimeout(() => this.isDisabled = false, 3000);
                        }
                    } else {
                        alert(this.language('alert_login_or_reg'))
                    }
                }
            },
            closeTrade() {
                if (this.calculateLotActiveTrade() > 1) {
                    let win = window.open('/purchases', '_blank');
                    win.focus();
                } else {
                    axios.post('/axios-update-trade', {
                        lot_id: this.LotID
                    }).then((response) => {
                        let scroll = $('#currency-chat .js-custom-scroll');
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
            refuseMoney() {
                if (this.calculateLotActiveTrade() > 1) {
                    let win = window.open('/sales', '_blank');
                    win.focus();
                } else {
                    axios.post('/axios-refuse-money-trade', {
                        lot_id: this.LotID
                    }).then((response) => {
                        let scroll = $('#currency-chat .js-custom-scroll');
                        scroll.perfectScrollbar({
                            suppressScrollX: true
                        });
                        if (response.data.msg != null) {
                            this.Messages.push(response.data.msg);
                            scroll.animate({scrollTop: scroll.prop('scrollHeight') + 300}, 500);
                            this.$bus.$emit('closePurchases', {'lot_id': this.LotID});
                        }
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
                if (count > 1) return '(' + count + ')';
            },
            listenForNewMessage(thread_id) {
                let item = $(this.$refs.item);
                Echo.private('threads.chats.' + parseInt(thread_id)).listen('ChatGlobalMessage', (e) => {
                    let scroll = $('#currency-chat .js-custom-scroll');
                    scroll.perfectScrollbar({
                        suppressScrollX: true
                    });
                    this.Messages.push(e.message);
                    scroll.animate({scrollTop: scroll.prop('scrollHeight') + 300}, 500);
                });
            },
            filterData() {            
                // console.log('sort');
                axios.post('/search-server', {
                    server_id: this.server,
                    currency_id: this.Currency.id,
                    is_online: this.salers,
                    sort_by: this.sorts
                }).then((response) => {
                    $('#server-adena-list').scrollTop(0);
                    //console.log(this.Lots)
                    //console.log(response.data)
                    //this.Currency.lots = response.data;
                    this.Lots = response.data.sort(function(x,y){return (x.top === y.top)? 0 : x.top? -1 : 1;});
                    this.Messages = [];
                    this.LotID = undefined;
                    this.Active = undefined;
                    $(document).trigger('vue-loaded');
                }).catch(function (error) {
                    console.log(error);
                });

                // axios.post('/search-server', {
                //     server_id: this.server,
                //     currency_id: this.Currency.id,
                //     is_online: this.salers,
                //     sort_by: this.sort
                // }).then((response) => {
                //     $('#server-adena-list').scrollTop(0);
                //     this.Lots = response.data;
                //     this.Messages = [];
                //     this.LotID = undefined;
                //     this.Active = undefined;
                //     $(document).trigger('vue-loaded');
                // }).catch(function (error) {
                //     console.log(error);
                // });
            },
            minPriceAlert() {
                let selectId = this.select;
                let coefficient = 100;

                this.availability = parseFloat(this.availability);


                if (selectId != undefined) {
                    let $payment_input = $('#input-payment');

                    let result = $.grep(this.commission, function (e) {
                        return e.id == selectId;
                    });
                    if (result.length == 0) return 0;
                    else if (result.length == 1) coefficient = result[0].coefficient;


                    let min = parseFloat((parseFloat(this.minPrice) * 100 / coefficient));
                    this.minPrice = min;
                    if (this.payment < min)
                        $payment_input.attr('title', this.language('alert_min_sum') + ' - ' + min + ' ' + result[0].symbol)
                            .tooltip('fixTitle')
                            .tooltip('show');
                    else $payment_input.tooltip('hide');
                }


            },
            displayCurrencyKeyword() {
                if (this.Currency.unity != null) return this.Currency.unity;
                else return '';
            },
            calculatedPrice(type, tooltip = true) {
                let total = 0;
                let selectId = this.select;

                let $pay_method = $('#pay-method');
                let text = null;

                this.availability = parseFloat(this.availability);


                if (selectId != undefined) {
                    let result = $.grep(this.commission, function (e) {
                        return e.id == selectId;
                    });
                    if (result.length == 0) return 0;

                    let currencyPrice = this.price * 100 / parseFloat(result[0].coefficient);

                    if (type) {

                        total = (this.payment / currencyPrice * this.$parent.commissionSum(result[0])).toFixed(3);

                        if (total >= this.availability) {
                            text = this.language('alert_seller_low_count_product');
                            this.totalValue = total;
                        } else {
                            if (total < 0 || Number.isNaN(total)) this.totalValue = 0;
                            else {
                                $pay_method.tooltip('hide');
                                this.totalValue = total;
                        }
                        }
                    } else {
                        total = (this.price * this.totalValue / this.$parent.commissionSum(result[0])).toFixed(2);

                        if ((parseFloat(this.totalValue) > parseFloat(this.availability))) {
                            text = this.language('alert_seller_low_count_product');
                            this.payment = this.totalValue * priceWithCommission;
                            //Limit input
                            // this.totalValue = this.availability;
                        } else {
                            if (total < 0 || Number.isNaN(total)) this.payment = 0;
                            else {
                                $pay_method.tooltip('hide');
                                this.payment = total;
                            }
                        }
                    }
                } else {
                    if (this.LotID == undefined) text = this.language('alert_need_lot');
                    else text = this.language('alert_need_pay');
                }

                if (text !== null && tooltip)
                    $pay_method.attr('title', text)
                        .tooltip('fixTitle')
                        .tooltip('show');
            }
            ,
            unregisterAlarm() {
                if (this.auth == undefined) alert(this.language('alert_login_or_reg'));
            },
            findCommissionSymbol(key, value) {
                let obj = this.commission;
                let symbol = this.currencySymbol;
                Object.keys(obj).forEach(function (c) {
                    if (parseInt(obj[c][key]) == value) symbol = obj[c]['symbol'];
                });
                return symbol;
            },
            changeSymbol() {
                this.currencySymbol = this.findCommissionSymbol('id', this.select);
            },
            lotCheck() {
                if (this.LotID === undefined) {
                    let $pay_method = $('#pay-method');
                    $pay_method.attr('title', this.language('alert_need_lot')).tooltip('fixTitle').tooltip('show');
                } else {
                    this.calculatedPrice(true, false);
                }

            }

        },
        updated() {

            // $(() => {
                // console.log(this.$refs.select);
                // $(this.$refs.select).selectpicker('refresh');
                // $('.selectpicker').selectpicker('refresh');
                // $('#server-sorts').selectpicker('refresh');
                $(this.$el).find('.selectpicker').selectpicker('refresh');
                // console.log($(this.$el).find('.selectpicker'));
            // });
            
        },
        mounted() {

            // console.log(this.$refs.select);
            // $(this.$refs.select).selectpicker('refresh');
        }
    }
</script>

<style scoped>
    .tooltip-inner {
        border: solid 10px #ccc;
    }
</style>