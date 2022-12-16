<template>
    <div class="listing" v-if="!makePopupAppear">
        <h3 class="heading">{{ roomInfo.name }}</h3>
        <p class="description">{{ roomInfo.descriptiom }}</p>
        <h3 class="price">{{ roomInfo.price }}</h3>
        <p class="type">{{ roomInfo.type }}</p>
        <p class="address">{{ roomInfo.address }}</p>
        <button @click="makePopupAppear = true">Book Now</button>
    </div>
    <div class="booking" v-else>
        <p class="id">{{ roomInfo.id }}</p>

        <form action="submit">
            <label for="date">Date</label>
            <input type="date" name="date" id="date" />

            <button @click="makePopupAppear = false">Book</button>
            <button @click="makePopupAppear = false">Cancel</button>
        </form>
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
export default defineComponent({
    props: ["roomInfo"],
    setup(props) {
        console.log(props.roomInfo);

        const makePopupAppear = ref(false);

        return {
            makePopupAppear
        }
    },
    name: "SingleListing",
});
</script>

<style>
.listing, .booking {
    border: 5px solid #42b983;
}
</style>