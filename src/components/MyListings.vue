<template>
    <div v-if="listedRooms.length < 1">
        No listings made yet
    </div>
    <div v-else>
        <div v-for="listing in listedRooms" :key="listing">
            <SingleListingVue :roomInfo="listing" :booked="false" :manager="true" />
        </div>
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import SingleListingVue from './SingleListing.vue';

export default defineComponent({
    setup() {
        const listedRooms = ref([
            {
                id: 12,
                name: "Aussie-innit",
                description: "It's australia innit?",
                price: "6 pesos",
                type: "Single Mouse",
                address: "New Zealand",
                rating: 5,
                images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg"]
            },
            {
                id: 14,
                name: "Aussie-innit",
                description: "It's new zealand innit?",
                price: "6 rupees",
                type: "Triple Mouse",
                address: "Australia",
                rating: 1,
                images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg"]
            }
        ]);

        return {
            listedRooms
        }
    },
    name: "MyListings",
    components: {
        SingleListingVue,
    }
})
</script>

<style lang="scss" scoped>

</style>