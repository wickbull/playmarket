<template>
    <div>
        <div class="c-chat__avatar">
            <a href="#" class="h-object-fit">
                <img :src="User.avatar" alt=""/>
            </a>
            <span v-if="msgCount != undefined" class="c-chat__conversations-msg-count">{{msgCount}}</span>
        </div>
        <div class="c-chat__conversations-info">
            <div class="c-chat__conversations-top">
                <a href="#" class="c-chat__name">{{User.name}}</a>
                <span v-if="User.is_online == true" class="c-chat__online">online</span>
                <span v-else class="c-chat__offline">offline</span>
								<!-- <span class="c-chat_time"> 14:38</span> -->
            </div>
            <div class="c-chat__conversations-bottom">
                <span class="c-chat__conversations-msg">{{ language('on_web') }} {{ timestamp }}</span>
            </div>
        </div>
    </div>
</template>


<script>

    export default {
        props: ['user', 'msgCount', 'lang'],

        data() {
            return {
                User: this.user,
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
        },
        computed: {
            
            timestamp: function () {
                return moment.utc(this.User.created_at, 'YYYY-MM-DD').local()._i;
                // return moment.utc(this.User.created_at, 'YYYY-MM-DD').local().fromNow(true);
            }
        },
        mounted() {
        }
    }
</script>