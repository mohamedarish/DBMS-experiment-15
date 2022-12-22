<template>
    <div class="review">
        <div class="row1">
            <div class="user">
                {{ review.user }}
            </div>
            <div class="rate">
                {{ review.rate }} ⭐️
            </div>
        </div>
        <div class="row2">
            <p>{{ review.head }}</p>
        </div>
        <div class="row3">
            <p>{{ review.content }}</p>
        </div>
    </div>
</template>

<script>
import { defineComponent } from 'vue';
export default defineComponent({
    props: ["review"],
    setup () {},
    name: "ReviewHolder"
})
</script>

<style lang="scss" scoped>
.review {
    height: 100px;
    display: flex;
    flex-direction: column;
    padding: 10px;
    margin: 10px;
    background-color: pink;

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