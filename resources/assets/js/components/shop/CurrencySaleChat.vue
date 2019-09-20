<template>
    <div :style="Lot.top == 1 && new Date() < new Date(Lot.top_at) ? `background: #28342F!important;`: ''">
        <div data-th="Продавец" class="t-c c-games-chat__adena-list-saler">
            <div class="c-chat__avatar">
                <div class="h-object-fit">
                    <img :src="Lot.user.avatar" alt=""/>
                </div>
                <span v-if="NewMsgCount != undefined" class="c-chat__conversations-msg-count">{{NewMsgCount}}</span>
            </div>
            <div class="c-games-chat__adena-item-info">
                <div class="c-games-chat__adena-item-top">
                    <a :href="'/admin/edit-lot/' + Lot.id" v-if="Admin == 1"  target="_blank" class="c-chat__settings">Настроить</a>
                    <a target="_blank"
                         :href="'/user-profile/' + Lot.user.id"
                         class="c-chat__name">
                         {{Lot.user.name}}</a>
                    <span v-if="Lot.user.is_online" class="c-chat__online">online</span>
                    <span v-else class="c-chat__offline">offline</span>
                </div>
                <div class="c-games-chat__adena-item-bottom">
                    <div class="c-games-chat__adena-item-i">
                        <span>{{ timestamp }}<span><br>{{Lot.user.reviews_count}} {{language('reviews')}}</span></span>
                        <!-- <span>{{ timestamp }}<span v-html="this.displayReviewCount(Lot.user.reviews_count,true)">{{displayReviewCount(Lot.user.reviews_count,false)}}</span></span> -->
                    </div>
                </div>
            </div>
        </div>

        <div data-th="Рейтинг"
             class="t-c c-games-chat__adena-list-rating text-center">
            <span>{{Lot.user.rating}}</span> 
            <!-- <span v-if="Lot.server.side != undefined"><br>{{Lot.server.side}}</span> -->
        </div>

        <div data-th="Cторона"
             class="t-c c-games-chat__adena-list-side text-center">
            <span>{{Lot.server.name}}</span> <span v-if="Lot.server.side != undefined"><br>{{Lot.server.side}}</span>
        </div>
        <div data-th="Наличие"
             class="t-c c-games-chat__adena-list-stock text-center">
            <span>{{ parseInt(Lot.availability)}} {{unity}}</span>
        </div>
        <div data-th="Цена за 1 кк"
             class="t-c c-games-chat__adena-list-price text-center"
             :id="Lot.id + '-currency-price'">
            <span>{{totalPrice}}</span>
            &#8381;
        </div>
        
    </div>
</template>

<script>
    export default {
        props: ['lot', 'msgCount', 'price', 'unity', 'admin', 'lang'],
        data() {
            return {
                Lot: this.lot,
                NewMsgCount: undefined,

                Admin: this.admin,
                Lang: this.lang,
            }
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
            displayReviewCount: function (count, html) {
                // console.log(count)
                // console.log(this.$parent.$parent.$options.methods.reviewToDisplayCalculate(count,html))
                // return this.$parent.$parent.$options.methods.reviewToDisplayCalculate(count,html)
            },
        },
        computed: {
            timestamp: function () {

                // console.log(moment.utc(this.Lot.user.created_at, 'YYYY-MM-DD').local().fromNow(true).split(' '));
                // console.log('find_here');
                // console.log(moment.utc(this.Lot.user.created_at, 'YYYY-MM-DD').local()._i);
                return moment.utc(this.Lot.user.created_at, 'YYYY-MM-DD').local()._i;
                // return moment.utc(this.Lot.user.created_at, 'YYYY-MM-DD').local().fromNow(true);
            },
            totalPrice: function () {
                return parseFloat(this.price).toFixed(2);
            }
        },
        watch: {
            msgCount: function (value) {
                this.NewMsgCount = value;
            },
        },
        mounted() {
            // console.log(this.lot);
        }
    }
</script>