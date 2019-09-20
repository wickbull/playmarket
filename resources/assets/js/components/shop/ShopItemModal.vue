<template>
    <div :id="'modal-add-proposition-' + currentTag.id" tabindex="-1" role="dialog"
         class="modal-add-proposition modal fade modal_centered">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                    <h3 class="modal-title">{{language('add_offer')}}</h3>
                </div>
                <div class="modal-body">
                    <form method="POST" :action="'/game/' + Game.id + '/sell-proposition/' + currentTag.id">
                        <input type="hidden" name="_token" :value="csrf">
                        <div class="row">
                            <div v-if="Game.servers.length != 0" class="col-xs-12 col-xx-24">
                                <div class="form-group">
                                    <div class="form-group__ttl">{{language('server')}}</div>
                                    <div class="select-wrap">
                                        <select :title="language('choose')" name="server_id" class="selectpicker" required>
                                            <option v-for="server in Game.servers"
                                                    v-bind:key="server.id"
                                                    :value="server.id">
                                                    {{server.name}}
                                                    <span v-if="server.side!=undefined">({{server.side}})</span>
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <shop-modal-select v-for="subtag in currentTag.subtags"
                                               v-bind:key="'subtag-modal-' + subtag.id"
                                               v-bind:subtag="subtag"
                                               v-if="subtag.appendModal == 1 || subtag.attach == 0"
                                               :lang="Lang">

                            </shop-modal-select>
                            <div class="col-xs-12 col-xx-24">
                                <div class="form-group">
                                    <div class="form-group__ttl">{{language('price')}}</div>
                                    <div class="input-wrap input-group">
                                        <input type="number" step="any" name="price"
                                               value=""
                                               required="required"
                                               class="form-control"/>
                                        <span class="input-group-addon">₽</span>

                                    </div>
                                </div>
                            </div>
                            <div v-if="currentTag.price_per_unit != 0" class="col-xs-12 col-xx-24">
                                <div class="form-group">
                                    <div class="form-group__ttl">{{language('availability')}}</div>
                                    <div class="input-wrap">
                                        <input type="number" name="availability" step="1" placeholder="0" value=""
                                               required="required"
                                               class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-24">
                                <div class="form-group">
                                    <div class="form-group__ttl">{{language('description')}}</div>
                                    <div class="input-wrap">
                                        <textarea name="description" required="required" maxlength="100"
                                                  class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-24">
                                <div class="form-group">
                                    <label class="checkbox-label">
                                        <input type="checkbox" name="active" required="required" checked="checked"
                                               value="1" class="hidden-input"/><span
                                            class="check-icon"></span><span
                                            class="check-value">{{language('active')}}</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-footer text-center">
                            <button type="submit" class="btn btn_blue btn_upper">{{language('save')}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    import ModalSelectItem from './ModalSelectItem.vue';


    export default {

        props: ['tag', 'game', 'csrf', 'lang'],
        components: {ModalSelectItem},

        data() {
            return {
                Game: this.game,
                Appended: [],
                currentTag: this.tag,
                Lang: this.lang
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
            checkChild(subtag, parent_id) {
                let sub2Tag = this.findCommissionSymbol('attach', subtag, parent_id);
                if (sub2Tag.length > 0) this.addNewSelect(sub2Tag, parent_id);
                this.$forceUpdate();
            },

            orderSubtags() {
                this.currentTag.subtags.sort(function (a, b) {
                    return a.priority - b.priority;
                });
            },
            findCommissionSymbol(key, value, parent_id) {
                let obj = this.currentTag.subtags;
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
                    element.appendModal = 1;
                });
                this.Appended = appended.slice();
                this.orderSubtags();
            },
            removeSelect(parent) {
                let obj = this.currentTag.subtags;
                let appended = this.Appended.slice();
                let ids = this.getElementForDelete(appended, parent);

                if (ids.length > 0) {
                    Object.keys(obj).forEach(function (c) {
                        if (ids.includes(obj[c]['id'])) {
                            obj[c]['appendModal'] = 0;
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
            },
        },
        updated() {
            $(this.$el).find('.selectpicker').selectpicker('refresh');
        },
        mounted() {

        }
    }
</script>

<style>
    .bootstrap-select .dropdown-menu.inner {
        position: static;
        float: none;
        border: 0;
        padding: 0;
        margin: 0;
        -webkit-border-radius: 0;
        -moz-border-radius: 0;
        border-radius: 0;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
    }

    .bootstrap-select .dropdown-menu {
        width: 100%;
    }

    .dropdown-menu > .active > a, .dropdown-menu > .active > a:hover, .dropdown-menu > .active > a:focus {
        background-color: #f5f5f5;
        color: #000;
    }

    .bootstrap-select.open .dropdown-toggle .bs-caret:before {
        -webkit-transform: translateY(2px) rotate(225deg);
        -moz-transform: translateY(2px) rotate(225deg);
        -ms-transform: translateY(2px) rotate(225deg);
        -o-transform: translateY(2px) rotate(225deg);
        transform: translateY(2px) rotate(225deg);
        border-bottom-color: #2aa7ff;
        border-right-color: #2aa7ff;
    }
</style> 