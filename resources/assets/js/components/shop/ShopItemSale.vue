<template>
    <div role="tabpanel" :id="'game-chat-' + Tag.name" class="tab-pane fade"
         v-bind:class="{ ' active in':  Game.currency.length == 0 && count == 0}">
        <div class="c-games-chat__items">
            <div class="c-games-chat__buttons">
                <div class="row">
                    <div v-if="auth != undefined && auth.confirmed_rules == 1 && auth.confirmed == 1"
                         class="col-xs-14 col-xx-24">
                        <button data-toggle="modal" :data-target="'#modal-add-proposition-' +  Tag.id"
                                type="button"
                                class="btn btn_blue-white btn_upper btn_auto-height c-games-chat__btn-abs">
                            {{ language('sale') }}
                            {{ Tag.name}}
                        </button>
                    </div>
                    <div v-else class="col-xs-14 col-xx-24">
                        <button type="button" v-on:click="unregisterAlarm()"
                                class="btn btn_blue-white btn_upper btn_auto-height c-games-chat__btn-abs">
                            {{ language('sale') }}
                            {{ Tag.name}}
                        </button>
                    </div>
                    <div class="col-xs-10 col-xx-24">
                        <button type="button" data-target-block=".c-games-chat__items-filter"
                                :data-show-text="language('show_filter')" :data-hide-text="language('hide_filter')"
                                class="c-games-chat__items-filter-trig btn btn_blue btn_auto-height button-toggle visible-xs"></button>
                    </div>
                </div>
            </div>
						<div class="c-games-chat__wrap">
							<div class="c-games-chat__items-filter minimized">
                <form class="filter" :id="'form-' + Tag.id">
                    <div class="row">
                        <input type="hidden" name="_token" :value="csrf">
                        <div v-if="Game.servers.length != 0"
                             class="col-lg-24 col-md-24 col-sm-24 col-xs-12 col-xx-24">
                            <div class="form-group">
                                <div class="form-group__ttl">{{ language('server') }}</div>
                                <div class="select-wrap">
                                    <select :title="language('choose')" name="server_id"
                                            class="selectpicker" v-on:change="filterData()">
                                        <option value="">{{ language('choose') }}</option>
                                        <option v-for="server in Game.servers"
                                                v-bind:key="server.id"
                                                :value="server.id">{{server.name}}<span
                                                v-if="server.side!=undefined">({{server.side}})</span>
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-group__ttl">{{ language('sort') }}:</div>
                                <div class="select-wrap">
                                    <select id="server-sort" :title="language('choose')" name="sort"
                                            v-on:change="filterData()" v-model="sort"
                                            class="selectpicker">
                                        <option value="0">{{ language('choose') }}</option>
                                        <option value="1">{{ language('price_up') }}</option>
                                        <option value="2">{{ language('price_down') }}</option>
                                        <option value="5">{{ language('earlier') }}</option>
                                        <option value="6">{{ language('later') }}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div v-if="Tag.subtags.length != 0">
                            <shop-item-select v-for="subtag in Tag.subtags"
                                              v-bind:key="'subtag-' + subtag.id"
                                              v-bind:subtag="subtag"
                                              v-if="subtag.attach == 0 || subtag.append == 1"
                                              class="col-lg-24 col-md-24 col-sm-24 col-xs-12 col-xx-24"
                                              :lang="Lang">
                            </shop-item-select>
                        </div>
                        <div class="col-md-24 col-sm-11 col-xs-10 col-xx-24">
                            <div class="form-group dib">
                                <label class="checkbox-label">
                                    <input type="checkbox" name="salers"
                                           v-model="salers"
                                           :checked="salers"
                                           v-bind:true-value="1"
                                           v-bind:false-value="''"
                                           v-on:change="filterData()"
                                           class="hidden-input"/><span class="check-icon"></span><span
                                        class="check-value">{{ language('salers') }}</span>
                                </label>
                            </div>
                            <span class="c-chat__online">online</span>
                        </div>
                    </div>
                </form>
            </div>
						<div class="c-games-chat__table-wrap">
								<div class="c-games-chat__item-header-top hidden-xs">
                <div class="t-c">{{ language('saler') }}</div>
                <div class="t-c">{{ language('description') }}</div>
                <div v-if="Tag.price_per_unit != 0" class="t-c text-center">{{ language('availability') }}</div>
                <div class="t-c text-center">{{ language('price') }}</div>
            </div>
            <div :class="'c-games-chat__items-list collapse-group items-list-' + Tag.id">
                <div v-if="Tag.lots != undefined">
                    <shop-item-chat v-for="(lot,index) in Tag.lots"
                                    v-bind:key="index + '-lot'"
                                    v-bind:lot="lot"
                                    v-bind:game="Game"
                                    v-bind:tag="Tag"
                                    v-bind:auth="auth"
                                    v-bind:lotID="lot.id"
                                    v-bind:newMsg="newMsg"
                                    v-bind:activeTrade="activeTrade"
                                    v-bind:newMsgCount="newMsgCount"
                                    v-bind:csrf="csrf"
                                    v-bind:commission="commission"
                                    v-bind:active="Active"
                                    v-bind:game-params="GameParams"
                                    :lang="Lang">
                    </shop-item-chat>
                </div>
            </div>
						</div>
            
						</div>
            
        </div>
    </div>
</template>

<script>

    import ShopItemChat from './ShopItemChat.vue';
    import SelectItem from './SelectItem.vue';


    export default {
        props: ['tag', 'auth', 'game', 'count', 'csrf', 'commission', 'newMsg', 'activeTrade', 'newMsgCount', 'gameParams', 'lang'],
        components: {ShopItemChat, SelectItem},

        data() {
            return {
                Game:       this.game,
                Tag:        this.tag,
                salers:     '0',  //Seller Online = 1
                Active:     undefined,
                Appended:   [],
                sort:       0,

                GameParams: this.gameParams,
                Lang:       this.lang,
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
            filterData(subtag, parent_id) {
                let form_name = 'form-' + this.Tag.id;
                let form = $('#' + form_name);

                axios.post('/item_filter/game=' + this.Game.id + '/tag=' + this.Tag.id,
                    form.serialize())
                    .then((response) => {
                        this.Tag.lots = response.data.sort(function(x,y){return (x.top === y.top)? 0 : x.top? -1 : 1;});
                    })
                    .catch(function (error) {
                        console.log(error);
                    });


                let sub2Tag = this.findCommissionSymbol('attach', subtag, parent_id);
                if (sub2Tag.length > 0) this.addNewSelect(sub2Tag, parent_id);

            },
            orderSubtags() {
                this.Tag.subtags.sort(function (a, b) {
                    return a.priority - b.priority;
                });
            },
            activeItemValue() {
                this.$bus.$on('activeItem', ($event) => {
                    this.Active = $event;
                });
            },
            unregisterAlarm() {
                if (this.auth == undefined) alert('Зарегистрируйтесь или войдите что бы выставить лот');
                else {
                    if (this.auth.confirmed_rules != 1) window.location.replace("/page/pravila-dlya-prodavcov?sales=1");
                    if (this.auth.confirmed != 1) window.location.replace("/profile#cabinet_personal_data");
                }
            },
            findCommissionSymbol(key, value, parent_id) {
                let obj = this.Tag.subtags;
                let result = [];
                Object.keys(obj).forEach(function (c) {
                    if (obj[c][key] == value) {
                        result.push(obj[c]);
                    }
                });
                this.removeSelect(parent_id);
                return result;
            },
            addNewSelect(obj, parent_id) {
                let appended = this.Appended.slice();
                let temp = [];
                obj.forEach(function (element) {
                    appended[element.id] = [];
                    if (appended[parent_id] !== undefined) appended[element.id] = appended[parent_id].slice();
                    appended[element.id].push(parent_id);
                    element.append = 1;
                });
                this.Appended = appended.slice();
                this.orderSubtags();
            },
            removeSelect(parent) {
                let obj = this.Tag.subtags;
                let appended = this.Appended.slice();
                let ids = this.getElementForDelete(appended, parent);

                if (ids.length > 0) {
                    Object.keys(obj).forEach(function (c) {
                        if (ids.includes(obj[c]['id'])) {
                            obj[c]['append'] = 0;
                            appended.splice(obj[c]['id'], 1);
                        }
                    });
                    this.Appended = appended.slice();
                }

            },
            getElementForDelete(appended, parent) {
                let ids = [];
                appended.forEach(function (index, element) {
                    if (index.includes(parent)) {
                        ids.push(element);
                    }
                });
                return ids;
            }
        },
        updated() {
            $(this.$el).find('.selectpicker').selectpicker('refresh');
        },
        mounted() {
            this.activeItemValue();
        }
    }
</script>