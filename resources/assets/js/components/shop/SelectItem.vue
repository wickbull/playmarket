<template>
    <div>
        <div v-if="subTag.sub_tag_metadata != undefined && subTag.sub_tag_metadata.length != 0">
            <div class="form-group">
                <div class="form-group__ttl">{{language(subTag.name)}}</div>
                <div class="select-wrap">
                    <select :title="language('choose')" :name="'subtags['+subTag.id+']'" class="selectpicker"
                            v-model="subtags"
                            v-on:change="filterData()">
                        <option value="">{{language('choose')}}</option>
                        <option v-for="subTagMetadata in subTag.sub_tag_metadata"
                                v-bind:key="'subTag-' + subTagMetadata.id"
                                :value="subTagMetadata.id">
                            {{subTagMetadata.name}}
                        </option>
                    </select>
                </div>
            </div>
        </div>
        <div v-else>
            <div class="form-group">
                <div class="form-group__ttl">{{subTag.name}}</div>
                <div class="select-wrap">
                    <input type="text" :name="'subtag_name['+subTag.id+']'" value=""
                           class="form-control"
                           v-on:keyup="filterData()"
                           aria-required="true">
                </div>
            </div>
        </div>
    </div>
</template>

<script>

    export default {
        props: ['subtag', 'lang'],

        data() {
            return {
                subTag: this.subtag,
                subtags: undefined,
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
            filterData() {
                this.$parent.filterData(this.subtags, this.subTag.id);
            },
        },
        updated() {
            $(this.$refs.select).selectpicker('refresh');
        },
        mounted() {
        }
    }
</script>