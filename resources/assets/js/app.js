/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

require('../../../public/bower_components/bootstrap-select/js/bootstrap-select');
// require('bootstrap-select/js/bootstrap-select');
// import 'bootstrap/dist/css/bootstrap.min.css';
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
// import VueResource from "vue-resource"
window.Vue = require('vue');

import Echo from "laravel-echo"

import Pusher from 'pusher-js'


const moment = require('moment-timezone');

moment().tz("Europe/Moscow").format();

require('moment/locale/ru');

window.moment = moment;


window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'c1f427ca92c8e2d9ab65', //Add your pusher key here
    cluster: 'eu',
    encrypted: true,
});



// EventBus Object

const EventBus = new Vue();

Object.defineProperties(Vue.prototype, {
    $bus: {
        get: function () {
            return EventBus
        }
    }
})


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

/*
 *  Chat Component
 */
Vue.component('chat-layout', require('./components/chat/Layout.vue'));  //Main layout
Vue.component('chat-list', require('./components/chat/ChatList.vue'));   //User list
Vue.component('chat-message', require('./components/chat/ChatMessage.vue'));  //Message list
Vue.component('simple-chat', require('./components/chat/SimpleChatForm.vue'));   //Form for chat with user (Message list + Send message form)

/*
 *  Header Event Counter
 */
Vue.component('event-counter', require('./components/notification/EventCounter.vue'));

/*
 *  Shop Component
 */

Vue.component('shop-layout', require('./components/shop/GlobalLayout.vue'));  //Main layout
Vue.component('shop-currency-sale', require('./components/shop/ShopCurrencySale.vue'));  //Currency Sale layout
Vue.component('shop-currency-chat', require('./components/shop/CurrencySaleChat.vue'));  //Currency Sale chat

Vue.component('feedback-item', require('./components/shop/Feedback.vue'));  //Feedback  item
Vue.component('modal', require('./components/shop/Modal-item.vue'));  //Modal


Vue.component('shop-item-sale', require('./components/shop/ShopItemSale.vue'));  //Item Sale modal
Vue.component('shop-item-select', require('./components/shop/SelectItem.vue'));  //Item Sale modal
Vue.component('shop-item-chat', require('./components/shop/ShopItemChat.vue'));  //Item Sale chat
Vue.component('shop-item-modal', require('./components/shop/ShopItemModal.vue'));  //Item Sale layout
Vue.component('shop-modal-select', require('./components/shop/ModalSelectItem.vue'));  //Item Sale modal



const app = new Vue({
    el: '#app'
});




   
