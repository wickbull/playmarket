<template>
    <div>
        <div class="c-chat__dialog-item">
            <div class="c-chat__avatar"><a href="#"
                                           class="h-object-fit">
                <div v-if="this.chat_message.name != 'You'">
                    <img :src="this.chat_message.avatar" alt=""/>
                </div>
                <div v-else>
                    <img :src="Auth.avatar" alt=""/>
                </div>

            </a>
            </div>
            <div class="c-chat__dialog-info"
                 v-bind:class="{ ' is-system': this.chat_message.is_system}">
                <div class="c-chat__dialog-top">
                    <div v-if="this.chat_message.name != 'You'">
                        <a href="#"
                           class="c-chat__name">{{this.chat_message.name}}</a>
                    </div>
                    <div v-else>
                        <a href="#"
                           class="c-chat__name">{{language('you')}}</a>
                    </div>
                    <a v-if="this.chat_message.chat_game != undefined" href="#"
                       class="c-chat__name" style="font-style: italic;">({{this.chat_message.chat_game}})</a>
                    <span v-if="this.chat_message.status == true" class="c-chat__online">online</span>
                    <span v-else class="c-chat__offline">offline</span>
                    <span class="c-chat__date">{{timestamp}}</span>
                </div>
                <div class="c-chat__dialog-bottom"><span
                        class="c-chat__dialog-msg" v-html="this.chat_message.body">{{this.chat_message.body}}</span>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
    export default {
        props: ['chat_message', 'auth', 'threadId', 'lang'],
        data() {
            return {
                Auth: this.auth,
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
                // console.log(moment(this.chat_message.time, 'DD-MM-YYYY H:mm:ss')._i)
                return moment(this.chat_message.time, 'DD-MM-YYYY H:mm:ss')._i;
                // return moment(this.chat_message.time, 'DD-MM-YYYY H:mm:ss').fromNow(true) + ' назад';
            }
        },
        mounted() {

        },
    }
</script>
