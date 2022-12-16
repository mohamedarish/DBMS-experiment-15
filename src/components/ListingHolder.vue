<template>
    <!-- is this rendering -->
    <div v-for="room in listings" :key="room">
        <SingleListing :roomInfo="room" />
        ___
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import SingleListing from './SingleListing.vue';
export default defineComponent({
    setup() {
        const listings = ref([
            {
                name: "Aussie-innit",
                description: "It's australia innit?",
                price: "6 pesos",
                type: "Single Mouse",
                address: "New Zealand",
            },
            {
                name: "French🤮-innit",
                description: "It's France🤮 innit?",
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