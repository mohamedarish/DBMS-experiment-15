<template>
    <!-- is this rendering -->
    <div v-if="listings.length < 1">
        No Listings Currently Available
    </div>
    <div v-else>
        <div v-for="room in listings" :key="room">
            <SingleListing :roomInfo="room" :booked="false" />
        </div>
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import SingleListing from './SingleListing.vue';
export default defineComponent({
    setup() {
        const listings = ref([
            {
                id: 12,
                name: "Aussie-innit",
                description: "It's australia innit?",
                price: "6 pesos",
                type: "Single Mouse",
                address: "New Zealand",
            },
            {
                id: 1979,
                name: "French🤢",
                description: "It's France🤮 baguette?",
                price: "-6 rubies",
                type: "MultiCuisine",
                address: "France 🤮🤮🤮",
            }
        ]);

        console.log(listings.value);

        return {
            listings
        };
    },
    components: {SingleListing},
    name: "ListingHolder"
})
</script>

<style>

</style>