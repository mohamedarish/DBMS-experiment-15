<template>
    <div class="review">
        <div class="row1">
            <div class="user">
                {{ review.customer.name }}
            </div>
            <div class="rate">
                {{ review.review }} ⭐️
            </div>
        </div>
        <div class="row2">
            <p>{{ review.title }}</p>
        </div>
        <div class="row3">
            <p v-if="!fullRevFlag && review.description.length > 500">{{ review.description.substring(0, 500) }} <b @click="triggerFullReview">Read More...</b></p>
            <p v-else @click="triggerFullReview()">{{ review.description }}</p>
        </div>
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
export default defineComponent({
    props: ["review"],
    setup () {
        const fullRevFlag = ref(false);

        const triggerFullReview = ref(() => {
            fullRevFlag.value = !fullRevFlag.value;
        });

        return {
            fullRevFlag,
            triggerFullReview
        }
    },
    name: "ReviewHolder"
})
</script>

<style lang="scss" scoped>
.review {
    display: flex;
    flex-direction: column;
    padding: 10px;
    margin: 10px;
    border-top: solid #999 2px;
    border-bottom: solid #999 2px;

    .row1 {
        // width: 100vh;
        display: flex;
        flex-direction: row;
        justify-content: space-between;

        .user {
            font-weight: 500;
            font-size: large;
        }

        .rate {
            font-size: large;
        }
    }

    .row2 {
        display: flex;
        // width: 100vh;
        justify-content: flex-start;
        font-size: x-large;
        font-weight: 700;

    }

    .row3 {
        display: flex;
        // width: 100vh;
        justify-content: flex-start;
        font-size: medium;

    }
}
</style>