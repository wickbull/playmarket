<template>
    <div class="c-chat js-chat">
        <div class="container">
								<div class="c-chat-wrapper">
            <div class="row">
									<div class="col-md-8 c-chat__conversations-col">
                    <div class="l-chat-block c-chat__conversations-wrap minimized">
                        <div class="l-chat-block__header">
                            <button type="button" data-target-block=".c-chat__conversations-wrap"
                                    class="hidden-lg hidden-md button-hide c-chat__conversations-hide">
                            </button>
                            <div class="l-chat-block__ttl"><span>{{language('last')}}</span></div>
                        </div>
                        <div class="l-chat-block__body">
                            <div class="c-chat__conversations js-custom-scroll">
                                <div class="list-group c-chat__conversations-list">
                                    <chat-list class="c-chat__conversations-item"
                                               v-bind:class="{ ' has-deal': findObjectKey('user_id',parseInt(user.id)),
                                               ' has-new-msg': NewMsg.includes(parseInt(user.participants[0].dialog_id)),
                                               ' is-active': Active == parseInt(user.participants[0].dialog_id)}"
                                               v-for="user in Users"
                                               v-bind:user="user"
                                               v-bind:key="user.participants[0].dialog_id"
                                               :msgCount="NewMsgCount[parseInt(user.participants[0].dialog_id)]"
                                               @click.native="getChat(user)"
                                               :lang="Lang">
                                    </chat-list>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-16 c-chat__dialog-col">
                    <simple-chat :users="this.users"
                                 :auth="this.auth"
                                 v-bind:activeTrade="ActiveTrade"
                                 v-bind:messages="Messages"
                                 v-bind:activeUserId="ActiveUserId"
                                 v-bind:treadId="ThreadId"
                                 v-bind:allMsgCount="AllMsgCount"
                                 v-bind:currentMsgIndex="CurrentMsgIndex"
                                 :lang="Lang"></simple-chat>
                </div>
								</div>
                
            </div>
        </div>
    </div>
</template>


<script>

    import MessangerItem from './ChatList.vue';
    import SimpleChat from './SimpleChatForm.vue';

    export default {
        props: ['users', 'auth', 'new_msg', 'lang'],
        components: {MessangerItem, SimpleChat},
        data() {
            return {
                Users: this.users,
                Messages: [],
                ThreadId: undefined,
                Active: undefined,
                NewMsg: [],
                ActiveTrade: [],
                NewMsgCount: [],
                windowsActive: true,
                AllMsgCount: undefined,
                CurrentMsgIndex: undefined,
                ActiveUserId: undefined,
                Lang: this.lang,
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
            getChat(user) {
                this.ActiveUserId = user.id;
                this.AllMsgCount = undefined;
                this.CurrentMsgIndex = undefined;
                let thread_id = parseInt(user.participants[0].dialog_id);
                this.ThreadId = thread_id;
                this.Active = thread_id;
                this.$bus.$emit('activeThread', thread_id);
                axios.post('/get_global_message', {thread_id: thread_id}).then((response) => {
                        if (this.NewMsgCount[thread_id] != undefined) {
                            this.$bus.$emit('removeCounter', this.NewMsgCount[thread_id]);
                            this.NewMsgCount[thread_id] = undefined;
                        }
                        let index = this.NewMsg.indexOf(thread_id);

                    if (index >= 0) this.NewMsg.splice(index, 1);

                    if (response.data.length != 0) {
                            this.AllMsgCount = parseInt(response.data.messages_count);
                            this.CurrentMsgIndex = parseInt(response.data.current_msg_index);
                            let scroll = $(".c-chat__dialog-col .js-custom-scroll");
                            scroll.perfectScrollbar({
                                suppressScrollX: true
                            });
                            scroll.scrollTop(0);
                            this.Messages = response.data.messages.reverse();
                            scroll.animate({scrollTop: 5000}, 500);
                        } else {
                            this.Messages = [];
                        }
                    }
                ).catch(function (error) {
                    console.log(error);
                });
            },
            listenForNewEvent() {
                this.$bus.$on('closePurchases', ($event) => {
                    if ($event.count !== undefined && $event.count != 1) this.removeIfObjectKeyExists('lot_id', $event.lot_id);
                });
                this.$bus.$on('newMsg', ($event) => {
                    if (this.ThreadId != $event.thread_id || !this.windowsActive) {
                        /*
                         *  If user non exists in fill list
                         */
                        if ($event.new_user_id != undefined) this.callNewUserChat($event.thread_id);


                        if ($event.is_system == undefined) {
                            // if (this.ThreadId == undefined) this.pushListToTop($event.user_id, true);
                            // else this.pushListToTop($event.user_id, false);

                            if($event.user_id) this.pushListToTop($event.user_id, true);
                            if (this.NewMsg.indexOf($event.thread_id) == -1) this.NewMsg.push($event.thread_id);
                        }

                        if (this.NewMsgCount[$event.thread_id] != undefined)
                            this.NewMsgCount[$event.thread_id]++;
                        else
                            this.NewMsgCount[$event.thread_id] = 1;
                    }
                    if ($event.is_system !== undefined && $event.is_system) {
                        if ($event.new_thread) this.callNewUserChat($event.thread_id);
                        // if ($event.thread_id) this.pushListToTop($event.thread_id, true);

                        if ($event.trade_status == 1)
                            this.ActiveTrade.push({
                                'lot_id': parseInt($event.lot_id),
                                'user_id': parseInt($event.user_id),
                                'owner_id': parseInt($event.owner_id),
                                'buyer_id': parseInt($event.buyer_id)
                            });
                    }
                })
            },
            newMassageActiveCreate() {
                let arr = [];
                let count_arr = [];
                let new_msg = this.new_msg.new_msg;
                let active_trade = this.new_msg.active_trade;
                if (new_msg.length > 0) {
                    new_msg.forEach(function (element) {
                        if (element.msg_count > 0) {
                            arr.push(parseInt(element.thread_id));
                            count_arr[parseInt(element.thread_id)] = parseInt(element.msg_count);
                        }
                    });
                    this.NewMsgCount = count_arr;
                    this.NewMsg = arr;
                }
                arr = [];
                if (active_trade.length > 0)
                    for (let i = 0; i < active_trade.length; i++) {
                        if (active_trade[i].user_id !== undefined) {
                            arr.push({
                                'lot_id': parseInt(active_trade[i].lot_id),
                                'user_id': parseInt(active_trade[i].user_id),
                                'owner_id': parseInt(active_trade[i].owner_id),
                                'buyer_id': parseInt(active_trade[i].buyer_id)
                            });
                        }
                        this.pushListToTop(parseInt(active_trade[i].user_id), true);
                    }

                    this.ActiveTrade = arr;
            },
            findObjectKey(key, value) {
                let obj = this.ActiveTrade;
                let count = 0;
                    Object.keys(obj).forEach(function (c) {
                        if (parseInt(obj[c][key]) == value) count++;
                    });
                return count;
            },
            removeIfObjectKeyExists(key, value) {
                let obj = this.ActiveTrade;
                let index;
                Object.keys(obj).forEach(function (c) {
                    if (parseInt(obj[c][key]) == value) index = c;
                });
                this.ActiveTrade.splice(index, 1);

            },
            pushListToTop(id, priority) {
                let result = $.grep(this.Users, function (e) {
                    return e.id == id;
                });

                if (result.length == 0) return 0;
                else if (result.length == 1) {
                    let index = this.Users.indexOf(result[0]);
                    if (index > -1) {
                        this.Users.splice(index, 1);
                        if (priority) this.Users.splice(0, 0, result[0]);
                        else this.Users.splice(1, 0, result[0]);
                    }
                }

            },
            listenForPushTop() {
                this.$bus.$on('pushToTop', ($event) => {
                    if ($event != undefined) this.pushListToTop($event, true);
                })
            }
            ,
            callNewUserChat(thread_id) {
                axios.post('/get_new_chat_user', {
                    dialog_id: thread_id
                }).then((response) => {
                    this.Users.push(response.data.user);
                    if (!this.inArray(this.NewMsg)) this.NewMsg.push(parseInt(thread_id));
                    this.pushListToTop(response.data.user.id, true);
                    Vue.set(this.NewMsgCount, parseInt(thread_id), 1);
                }).catch(function (error) {
                    console.log(error);
                });
            },
            checkActive() {
                $(window).on("blur focus", function (e) {
                    let prevType = $(this).data("prevType");

                    if (prevType != e.type) {   //  reduce double fire issues
                        switch (e.type) {
                            case "blur":
                                this.windowsActive = false;
                                break;
                            case "focus":
                                this.windowsActive = true;
                                break;
                        }
                    }

                    $(this).data("prevType", e.type);
                })
            },
            defaultChatLoad() {
                setTimeout(() => {
                    if (this.Users.length > 0) {
                        this.getChat($(this.Users).first()[0]);

                    }
                }, 1000);
            }
        },
        mounted() {
            this.Users.sort(function (a, b) {
                let c = new Date(a.participants[0].updated_at);
                let d = new Date(b.participants[0].updated_at);
                return d - c;
            });
            this.newMassageActiveCreate();
            this.listenForNewEvent();
            this.listenForPushTop();
            this.checkActive();
            this.defaultChatLoad();
        },
    }
</script>