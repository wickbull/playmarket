<template>
    <ul class="h-list nav-user-item">
        <li class="nav-my-sales">
            <a href="/sales">{{language('my_sales')}}<span v-if="Sales != 0" class="badge">{{Sales}}</span></a>
        </li>
        <li class="nav-my-purchases">
            <a href="/purchases">{{language('my_purchases')}}<span v-if="Purchases != 0" class="badge">{{Purchases}}</span></a>
        </li>
        <li class="nav-my-messages">
            <a href="/chat">{{language('messages')}}<span v-if="Msg != 0" class="badge">{{Msg}}</span></a>
        </li>
        <li>
            <a href="/profile#tab-cabinet_lots" aria-controls="cabinet_lots">{{language('my_lots')}}</a>
        </li>
        <li>
            <form method="POST" action="/lang" id="form_lang" class="authorize-lang-mt">
                <input type="hidden" name="_token" :value="CSRF.csrf">
                <select name="lang" class="selectpicker" data-width="fit" onchange="if(this.selectedIndex) $(this).closest('form').trigger('submit');">
                    <option 
                        v-for="(lang,index) in Langs"
                        v-if="lang.id == LangId.lang_id"
                        :data-content='"<span class=\"flag-icon flag-icon-"+lang.code.toLowerCase()+"\"><\/span> "'
                        :value="lang.id">
                    </option>
                    <option 
                        v-for="(lang,index) in Langs"
                        v-if="lang.id != LangId.lang_id"
                        :data-content='"<span class=\"flag-icon flag-icon-"+lang.code.toLowerCase()+"\"><\/span> "'
                        :value="lang.id">
                    </option>
                </select>
            </form>
        </li>
    </ul>
</template>

<script>
    const play = require('audio-play');
    const load = require('audio-loader');


    export default {
        props: ['event_count', 'id', 'langs', 'csrf', 'langid', 'lang'],
        data() {
            return {
                Msg: this.event_count.msg_count,
                Purchases: this.event_count.purchases_count,
                Sales: this.event_count.sales_count,
                ActiveThread: undefined,
                Langs: this.langs,
                CSRF: this.csrf,
                // Langid: this:langid,
                LangId: this.langid,
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
            listenForNewEvent() {
                Echo.private('App.User.' + this.id).listen('NewEventCount', (e) => {
                    if (e.event.msg) {
                        e.event['active_thread'] = this.ActiveThread;
                        load('../sound/4TnDj0v9GE.ogg').then(play);
                        if (this.ActiveThread == e.event.thread_id) {
                            axios.post('/mark_as_read', {
                                data: e.event,
                            }).catch(function (error) {
                                console.log(error);
                            })
                        }
                        else{
                            this.Msg++;
                        }
                        this.$bus.$emit('newMsg', e.event);

                    }
                    if (e.event.sale) {
                        load('../sound/3gveeCqUD6.ogg').then(play);
                        this.$bus.$emit('closePurchases', e.event);
                        this.Sales = this.Sales + e.event.count;
                        if (!document.hasFocus()) {
                            let text = null;
                            if (e.event.count !== undefined) {
                                if (e.event.count == -1 && !e.event.refuse) text = 'Клиент подтвердил покупку товара. Деньги успешно переведены на вас счёт.';
                                if (e.event.count == 1) text = 'У вас купили товар. Передайте товар покупателю и попросите его потвердить передачу в разделе "Мои покупки".';
                            }
                            if (text !== null)
                                this.notificationHtml('PlayZo.ru', {
                                    body: text,
                                    icon: '../s/images/notification.png',
                                    dir: 'auto'
                                });
                        }
                    }
                    if (e.event.purchases) {
                        load('../sound/baNnhH1I7M.ogg').then(play);
                        this.$bus.$emit('closePurchases', e.event);
                        this.Purchases = this.Purchases + e.event.count;
                        if (!document.hasFocus()) {
                            let text = null;
                            if (e.event.count !== undefined && e.event.count == 1) text = 'Успешная покупка. Получите товар и потвердите получения товара в разделе "Мои покупки"';
                            if (e.event.refuse !== undefined && e.event.refuse) text = 'Продавец закрыл заказ и вернул деньги. Деньги поступили на ваш внутренний счёт.';
                            if (text !== null)
                                this.notificationHtml('PlayZo.ru', {
                                    body: text,
                                    icon: '../s/images/notification.png',
                                    dir: 'auto'
                                });
                        }
                    }
                });
            },
            listenForRemoveCounter() {
                this.$bus.$on('removeCounter', ($event) => {
                    if (this.Msg < $event) this.Msg = 0;
                    else this.Msg = this.Msg - $event;
                });
                this.$bus.$on('activeThread', ($event) => {
                    if ($event == undefined || $event == null) this.ActiveThread = undefined;
                    else this.ActiveThread = $event
                });
            },
            isOnlineUpdate(){
                setInterval(function () {
                    axios.get('/update/online-status', {});
                }.bind(this), 240000);
            },
            notificationHtml(title, options) {
// Проверим, поддерживает ли браузер HTML5 Notifications
                if (!("Notification" in window)) {
                    alert('Ваш браузер не поддерживает HTML Notifications, его необходимо обновить.');
                }

// Проверим, есть ли права на отправку уведомлений
                else if (Notification.permission === "granted") {
// Если права есть, отправим уведомление
                    let notification = new Notification(title, options);

                    function clickFunc(event) {
                        event.preventDefault(); // prevent the browser from focus   ing the Notification's tab
                        window.open('https://playzo.ru/chat', '_blank');
                    }

                    notification.onclick = clickFunc;
                }

// Если прав нет, пытаемся их получить
                else if (Notification.permission !== 'denied') {
                    Notification.requestPermission(function (permission) {
// Если права успешно получены, отправляем уведомление
                        if (permission === "granted") {
                            let notification = new Notification(title, options);

                        } else {
                            // alert('Вы запретили показывать уведомления'); // Юзер отклонил наш запрос на показ уведомлений
                        }
                    });
                } else {
// Пользователь ранее отклонил наш запрос на показ уведомлений
// В этом месте мы можем, но не будем его беспокоить. Уважайте решения своих пользователей.
                }
            },
            checkNotificationPermision() {
                Notification.requestPermission(function (permission) {
                });
            }
        },
        mounted() {
            // console.log(this.langs);
            this.listenForNewEvent();
            this.listenForRemoveCounter();
            this.isOnlineUpdate();
            this.checkNotificationPermision();
            // console.log(this.csrf);
            // console.log(this.langid);
        }
    }
</script>