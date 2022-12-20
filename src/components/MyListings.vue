<template>
    <div v-if="listedRooms.length < 1">
        <div>No listings made yet</div>
        <AddRoomVue />
    </div>
    <div v-else>
        <div v-for="listing in listedRooms" :key="listing">
            <SingleListingVue :roomInfo="listing" :booked="false" :manager="true" />
        </div>
        <AddRoomVue />
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import SingleListingVue from './SingleListing.vue';
import AddRoomVue from './AddRoom.vue';

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
                number_of_reviews: 100,
                images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg"]
            },
            {
                id: 14,
                name: "NewZie-innit",
                description: "It's new zealand innit?",
                price: "6 rupees",
                type: "Triple Mouse",
                address: "Australia",
                rating: 0,
                number_of_reviews: 0,
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
        AddRoomVue
    }
})
</script>

<style lang="scss" scoped>

</style>