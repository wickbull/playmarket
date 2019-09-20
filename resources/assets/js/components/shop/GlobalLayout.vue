<template>
    <div class="c-games-chat__inner">
        <div class="row">
            <div class="col-lg-12 col-md-6_10 col-sm-14 col-xs-24">
                <div role="tablist" class="c-tab-nav c-games-chat__tabs-nav xs-full xx-full">
                    <button type="button" class="c-tab-nav__trig visible-xs"><span>{{language('Adena')}}</span>
                    </button>
                    <ul class="c-tab-nav__drop h-list minimized">
                        <li v-for="(currency,index) in Game.currency"
                            v-bind:key="currency.id + '-currency+'"
                            v-bind:class="{ ' active':  index == 0}"
                            role="presentation">
                            <a :href="'#game-chat-' + currency.name"
                               :aria-controls="'game-chat-' + currency.name" role="tab"
                               data-toggle="tab"><span>{{currency.name}}</span></a>
                        </li>
                        <li v-for="(tags,index) in Game.tags"
                            v-bind:key="tags.id + '-tags'"
                            v-bind:class="{ ' active':  Game.currency.length == 0 && index == 0}"
                            role="presentation">
                            <a :href="'#game-chat-' + tags.name"
                               :aria-controls="'game-chat-' + tags.name" role="tab"
                               data-toggle="tab"><span>{{tags.name}}</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="tab-content">
            <shop-currency-sale v-for="(currency,index) in Game.currency"
                                v-bind:key="currency.id + '-currency'"
                                v-bind:game="Game"
                                v-bind:currency="currency"
                                v-bind:auth="Auth"
                                v-bind:count="index"
                                v-bind:newMsg="NewMsg"
                                v-bind:activeTrade="ActiveTrade"
                                :newMsgCount="NewMsgCount"
                                v-bind:csrf="csrf"
                                v-bind:commission="commission"
                                v-bind:admin="Admin"
                                v-bind:lang="Lang">
            </shop-currency-sale>
            <shop-item-sale v-for="(tag,index) in Game.tags"
                            v-bind:key="tag.id + '-item-sale'"
                            v-bind:game="Game"

                            v-bind:tag="tag"
                            v-bind:auth="Auth"
                            v-bind:count="index"
                            v-bind:newMsg="NewMsg"
                            v-bind:activeTrade="ActiveTrade"
                            :newMsgCount="NewMsgCount"
                            v-bind:csrf="csrf"
                            v-bind:commission="commission"

                            v-bind:game-params="GameParams"
                            v-bind:lang="Lang">
            </shop-item-sale>
            <shop-item-modal v-for="tag in Game.tags"
                             v-bind:key="tag.id + '-item-modal'"
                             v-bind:game="Game"
                             v-bind:tag="tag"
                             v-bind:csrf="csrf"
                             v-bind:lang="Lang">
            </shop-item-modal>
        </div>
    </div>
</template>

<script>
    import ShopCurrencySale from './ShopCurrencySale.vue';
    import ShopItemSale from './ShopItemSale.vue';
    import ShopItemModal from './ShopItemModal.vue';

    export default {
        props: ['game', 'auth', 'new_msg', 'commission', 'admin', 'gameParams', 'lang'],
        components: {
            childVue: ShopCurrencySale, ShopItemSale, ShopItemModal
        },
        data() {
            //
            return {
                Game: this.game,
                NewMsg: [],
                ActiveTrade: [],
                NewMsgCount: [],
                
                csrf: undefined,

                Admin: this.admin,
                GameParams: this.gameParams,
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
            newMassageActiveCreate() {
                let arr = [];
                let count_arr = [];
                if (this.new_msg.length != 0) {
                    let new_msg = this.new_msg.new_msg;
                    let active_trade = this.new_msg.active_trade;
                    if (new_msg.length > 0) {
                        new_msg.forEach(function (element) {
                            if (element.msg_count > 0) {
                                arr.push(parseInt(element.user_id));
                                count_arr[parseInt(element.user_id)] = parseInt(element.msg_count);
                            }
                        });
                        this.NewMsgCount = count_arr;
                        // this.NewMsg =  arr;
                    }
                    arr = [];
                    if (active_trade.length > 0) {
                        active_trade.forEach(function (element) {
                            if (element.lot_id != undefined) arr.push(parseInt(element.lot_id));
                        });
                        this.ActiveTrade = arr;
                    }
                }

            },
            listenForNewEvent() {
                this.$bus.$on('newMsg', ($event) => {

                    if ($event.is_system != undefined) if ($event.trade_status == 1) this.ActiveTrade.push(parseInt($event.lot_id));
                    if ($event.user_id != this.auth.id) {

                        if (this.NewMsgCount[parseInt($event.user_id)] != undefined) {
                            let val = this.NewMsgCount[parseInt($event.user_id)];
                            Vue.set(this.NewMsgCount, parseInt($event.user_id), ++val);
                        }
                        else Vue.set(this.NewMsgCount, parseInt($event.user_id), 1);
                    }
                });
            },
            listenForCloseTrade() {
                this.$bus.$on('closePurchases', ($event) => {
                    let index = this.ActiveTrade.indexOf(parseInt($event.lot_id));
                    if (index > -1) this.ActiveTrade.splice(index, 1);
                });
            },
            reviewToDisplayCalculate: function (count, html) {
                let word = '';
                let num = Math.abs(parseInt(count)) % 100; // берем число по модулю и сбрасываем сотни (делим на 100, а остаток присваиваем переменной $num)
                num = num % 10; // сбрасываем десятки и записываем в новую переменную
                if (num > 10 && num < 20) word = ' отзывов';
                if (num > 1 && num < 5) word = ' отзыва';
                if (num == 1) word = ' отзыв';
                if (num == 0) word = ' отзывов';
                if (word.length < 1) word = ' отзывов';
                let str = ',';
                if (html) str += '<br>';
                else str += ' ';
                str += count + word;
                return str
            },
            listenChatMsgCount() {
                this.$bus.$on('chatMsgCounter', ($event) => {
                    Vue.set(this.NewMsgCount, $event, undefined);
                });
            },
            totalCommission: function (item, lot_price) {
                let price = undefined;
                price = lot_price;
                let amount = price * 100 / parseFloat(item.coefficient);
                let commisionPrice = amount / this.commissionSum(item);
                if (isNaN(commisionPrice)) return 0;
                return this.roundDown(commisionPrice, 3);
            },
            commissionSum(item) {
                return (100 - ((parseFloat(item.site) + parseFloat(item.withdrawal) + parseFloat(item.other) + parseFloat(item.payment)))) / 100;
            },
            roundDown(number, decimals) {
                decimals = decimals || 0;
                return (Math.floor(number * Math.pow(10, decimals)) / Math.pow(10, decimals));
            }
        },
        computed: {
            Auth: function () {
                if (this.auth != 'null') return this.auth;
                else return undefined;
            }
        },
        mounted() {
            if (this.Auth != undefined) {
                this.listenForNewEvent();
                this.newMassageActiveCreate();
                this.listenForCloseTrade();
                this.listenChatMsgCount();
            }
            let token = document.head.querySelector('meta[name="csrf-token"]');
            if (token != null) this.csrf = token.content;
        }
    }
</script>

