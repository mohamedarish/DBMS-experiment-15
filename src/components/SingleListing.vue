<template>
    <div class="listing" v-if="!makePopupAppear">
        <div v-if="!booked">
            <h3 class="heading">{{ roomInfo.name }}</h3>
            <p class="description">{{ roomInfo.descriptiom }}</p>
            <h3 class="price">{{ roomInfo.price }}</h3>
            <p class="type">{{ roomInfo.type }}</p>
            <p class="address">{{ roomInfo.address }}</p>
            <button @click="triggerPopUp()">Book Now</button>
        </div>
        <div v-else>
            <h3 class="heading">{{ roomInfo.name }}</h3>
            <p class="description">{{ roomInfo.descriptiom }}</p>
            <h3 class="price">{{ roomInfo.price }}</h3>
            <p class="type">{{ roomInfo.type }}</p>
            <p class="address">{{ roomInfo.address }}</p>
            <button @click="triggerPopUp()">Cancel</button>
        </div>
    </div>
    <div class="confirmation" v-else>
        <p class="id">{{ roomInfo.id }}</p>

        <div v-if="!booked">
            <label for="date">Date</label>
            <input type="date" name="date" id="date" />

            <button @click="triggerPopUp()">Book</button>
            <button @click="triggerPopUp()">Cancel</button>
        </div>
        <div v-else>
            <button @click="triggerPopUp()">Confirm Cancellation</button>
        </div>

    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
export default defineComponent({
    props: ["roomInfo", "booked"],
    setup() {
        const makePopupAppear = ref(false);

        const triggerPopUp = ref(() => {
            console.log("triggered a flip");
            makePopupAppear.value = !makePopupAppear.value;
        })

        return {
            makePopupAppear,
            triggerPopUp,
        }
    },
    name: "SingleListing",
});
</script>

<style>
.listing, .confirmation {
    border: 5px solid #42b983;
}
</style>