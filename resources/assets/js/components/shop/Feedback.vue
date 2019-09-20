<template>
    <div class="saler-feedbacks__item">
        <div class="saler-feedbacks__item-avatar " v-bind:class="{
        ' feedback__good': parseInt(feedback.mark),
        ' feedback__bad': !parseInt(feedback.mark),
        }">
            <div class="h-object-fit"><img :src="feedback.user.avatar" alt=""></div>
            <div class="saler-feedbacks__item-avatar-ico"></div>
        </div>
        <div class="saler-feedbacks__item-info">
            <div class="saler-feedbacks__item-ttl">
                <span>{{timestamp}}, {{feedback.trade.lot.game.name}}, {{feedback.trade.price}} &#8381;</span>
            </div>
            <div class="saler-feedbacks__item-txt">
                <span>{{feedback.text}}</span>
            </div>
        </div>
    </div>
</template>


<script>

    export default {
        props: ['feedback'],

        data() {
            return {
                // Feedback: feedback
            }
        },
        computed: {
            timestamp: function () {
                return moment.utc(this.feedback.created_at, 'YYYY-MM-DD').local().fromNow(true);
            }
        },
        mounted() {
        }
    }
</script>