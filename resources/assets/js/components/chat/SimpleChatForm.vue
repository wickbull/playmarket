<template>
    <div>
        <div class="l-chat-block c-chat__dialog-wrap">
            <div class="l-chat-block__header l-chat-block__header-right">
                <div></div>
                <button type="button" data-target-block=".c-chat__conversations-wrap"
                        class="hidden-lg hidden-md button-toggle c-chat__conversations-trig animate-this">
                </button>

                <div class="l-chat-block__ttl"><span>{{ language('chat') }}</span></div>
            </div>
            <div class="l-chat-block__body">
                <div class="c-chat__dialog js-custom-scroll">
                    <div class="c-chat__dialog-list">
                        <div v-if="allMsgCount > CurrentIndex" class="c-chat__dialog-item"
                             style="text-align: center">
                            <a href="#" v-on:click="getMoreMsg()">{{ language('show_more') }}</a>
                        </div>
                        <chat-message v-for="(chat_message, index) in Messages"
                                      v-bind:chat_message="chat_message"
                                      v-bind:key="index"
                                      :auth="Auth"
                                      :lang="Lang"></chat-message>
                    </div>
                </div>
            </div>
        </div>
        <div class="saler-chat__form">
            <form class="js-form_check">
                <div class="form-group">
                    <div class="input-wrap chat-textarea">
                                        <textarea v-model="text" @keyup.enter.prevent="sendMessage(isDisabled)"
                                                  maxlength="400"
                                                  :placeholder="language('enter_message')"
                                                  required="required"
                                                  class="form-control no-resize"></textarea>
                    </div>
                </div>
                <div class="saler-feedbacks__form-footer">
                    <button type="button" :disabled="isDisabled" v-on:click="sendMessage()"  id="msg-send-button"
                            class="btn btn_blue btn_upper">
                        {{language('send')}}
                    </button>
                    <button v-if="checkIsActiveTradeBuyerExists() > 0"
                            type="button"
                            v-on:click="closeTrade()"
                            class="btn btn_red btn_upper">
                        {{language('confirm_the_order')}} {{activeBuyerTradeCount()}}
                    </button>
                    <button v-if="checkIsActiveTradeOwnerExists() > 0"
                            type="button"
                            v-on:click="refuseMoney()"
                            class="btn btn_red btn_upper">
                        {{language('return_money')}} {{activeOwnerTradeCount()}}
                    </button>
                    <!--<button type="button" v-on:click="returnMoney()" class="btn btn_red btn_upper">-->
                        <!--Вернуть деньги-->
                    <!--</button>-->
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    import ChatMessage from './ChatMessage.vue';

    export default {
        props: ['users', 'auth', 'messages', 'treadId', 'activeTrade', 'allMsgCount', 'currentMsgIndex', 'activeUserId', 'lang'],
        components: {ChatMessage},
        data() {
            return {
                Users: this.users,
                Auth: this.auth,
                text: '',
                CurrentThreadId: undefined,
                Messages: [],
                CurrentIndex: this.currentMsgIndex,
                isDisabled: false,
                Lang: this.lang,
            }
        },
        watch: {
            treadId: function (value) {
                this.listenForNewMessage(value, this.CurrentThreadId);
                this.CurrentThreadId = value;
            },
            messages: function (value) {
                this.Messages = value;
            },
            AllMsgCount: function (value) {
                this.AllMsgCount = value;
            },
            currentMsgIndex: function (value) {
                this.CurrentIndex = value;
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
            sendMessage(disable = false) {
                let text = this.text;
                if (this.CurrentThreadId == undefined) alert('Выберите, кому вы хотите отправить сообщение');
                else if (text.length > 400) alert('Лимит одного собщенния 400 знаков, у вас в сообщении ' + text.length + ' знаков.');
                else {
                    this.isDisabled = true;

                    let textWithoutEnter = text.replace(/\n/g, "");
                    if (this.CurrentThreadId != undefined && this.text != '' && textWithoutEnter.length > 0 && !disable) {
                        this.text = null;
                        axios.post('/send_global_message', {
                            text: text,
                            thread_id: this.CurrentThreadId
                        }).then((response) => {
                            this.Messages.push(response.data.message);
                            this.$bus.$emit('pushToTop', response.data.to_user_id);
                            $('.c-chat__dialog').animate({scrollTop: parseInt($('.c-chat__dialog-list').prop("scrollHeight") + 100)}, 500);
                        }).catch(function (error) {
                            alert(error.response.data.msg);
                            console.log(error.response.data.msg);
                            this.text = '';
                        });
                        let $button = $('#msg-send-button');
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
                }
            },
            closeTrade() {
                if (this.checkIsActiveTradeBuyerExists() > 1) {
                    let win = window.open('/purchases', '_blank');
                    win.focus();
                } else {
                    let lot_id = parseInt(this.getLotIdByObjectKey('buyer_id', parseInt(this.Auth.id), 'owner_id', parseInt(this.activeUserId)));
                    axios.post('/axios-update-trade', {
                        lot_id: lot_id
                    }).then((response) => {
                        this.Messages.push(response.data.msg);
                        this.$bus.$emit('pushToTop', response.data.to_user_id);
                        $('.c-chat__dialog').animate({scrollTop: parseInt($('.c-chat__dialog-list').prop("scrollHeight")+100)}, 500);
                        // this.removeIfObjectKeyExists('lot_id',lot_id);
                    }).catch(function (error) {
                        alert(error);
                        console.log(error);
                    });
                }
            },
            refuseMoney() {
                if (this.checkIsActiveTradeOwnerExists() > 1) {
                    let win = window.open('/sales', '_blank');
                    win.focus();
                } else {
                    let lot_id = parseInt(this.getLotIdByObjectKey('owner_id', parseInt(this.Auth.id), 'buyer_id', parseInt(this.activeUserId)));
                    axios.post('/axios-refuse-money-trade', {
                        lot_id: lot_id
                    }).then((response) => {
                        this.Messages.push(response.data.msg);
                        this.$bus.$emit('pushToTop', response.data.to_user_id);
                        $('.c-chat__dialog').animate({scrollTop: parseInt($('.c-chat__dialog-list').prop("scrollHeight") + 100)}, 500);
                        // this.removeIfObjectKeyExists('lot_id',lot_id);
                    }).catch(function (error) {
                        alert(error);
                        console.log(error);
                    });
                }
            },
            // removeIfObjectKeyExists(key, value) {
            //     let obj = this.activeTrade;
            //     let index;
            //     Object.keys(obj).forEach(function (c) {
            //         if (parseInt(obj[c][key]) == value) {
            //             index = c;
            //         }
            //     });
            //     this.activeTrade.splice(index, 1);
            // },
            checkIsActiveTradeOwnerExists() {
                return this.findObjectKey('owner_id', parseInt(this.Auth.id), 'buyer_id', parseInt(this.activeUserId));
            },
            checkIsActiveTradeBuyerExists() {
                return this.findObjectKey('buyer_id', parseInt(this.Auth.id), 'owner_id', parseInt(this.activeUserId));
            },
            activeOwnerTradeCount() {
                let count = this.findObjectKey('owner_id', parseInt(this.Auth.id), 'buyer_id', parseInt(this.activeUserId));
                if (count > 1)
                    return '(' + count + ')';
            },
            activeBuyerTradeCount() {
                let count = this.findObjectKey('buyer_id', parseInt(this.Auth.id), 'owner_id', parseInt(this.activeUserId));
                if (count > 1)
                    return '(' + count + ')';
            },
            listenForNewMessage(thread_id, oldThread) {
                Echo.leave('threads.chats.' + oldThread);
                Echo.private('threads.chats.' + parseInt(thread_id)).listen('ChatGlobalMessage', (e) => {
                    if (e.user_id == this.auth.id)
                        e.message.name = 'Вы';
                    this.Messages.push(e.message);
                    $('.c-chat__dialog').animate({scrollTop: parseInt($('.c-chat__dialog-list').prop("scrollHeight")) + 100}, 500);
                });
            },
            findObjectKey(key, value, key_second, value_second) {
                let obj = this.activeTrade;
                let count = 0;
                Object.keys(obj).forEach(function (c) {
                    if (parseInt(obj[c][key]) == value && parseInt(obj[c][key_second]) == value_second) count++;

                });
                return count;
            },
            removeObjectKey(key, value, key_second, value_second) {
                let obj = this.activeTrade;
                let count = 0;
                Object.keys(obj).forEach(function (c) {
                    if (parseInt(obj[c][key]) == value && parseInt(obj[c][key_second]) == value_second) {
                        let index = this.ActiveTrade.indexOf(parseInt(this.LotID));
                        if (index > -1) {
                            this.ActiveTrade.splice(index, 1);
                        }
                    }
                });
                return count;
            },
            getLotIdByObjectKey(key, value, key_second, value_second) {
                let obj = this.activeTrade;
                let lot_id;
                Object.keys(obj).forEach(function (c) {
                    if (parseInt(obj[c][key]) == value && parseInt(obj[c][key_second]) == value_second) {
                        lot_id = parseInt(obj[c]['lot_id']);
                    }
                });
                return lot_id;
            },
            getMoreMsg() {
                axios.post('/get_global_message', {
                    thread_id: this.CurrentThreadId,
                    skip: this.CurrentIndex
                }).then((response) => {
                        if (response.data.length != 0) {
                            this.CurrentIndex = parseInt(response.data.current_msg_index);
                            let scroll = $(".c-chat__dialog-col .js-custom-scroll");
                            scroll.perfectScrollbar({
                                suppressScrollX: true
                            });
                            scroll.scrollTop(0);
                            this.Messages = response.data.messages.reverse().concat(this.Messages);
                            let count = parseInt(response.data.messages.length);
                            let element = $(document).find('.js-custom-scroll .c-chat__dialog-item').slice(0, count);
                            let outerHeight = 0;
                            element.each(function () {
                                outerHeight += $(this).outerHeight();
                            });
                            outerHeight += 50;
                            scroll.scrollTop(outerHeight);

                            // this.Messages = response.data.messages;
                        } else {
                            this.Messages = [];
                        }
                    }
                ).catch(function (error) {
                    console.log(error);
                });
            }

        },
        updated() {
            $(document).ready();
        },
        mounted() {
        }
    }
</script>