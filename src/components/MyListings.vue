<template>
    <div v-if="listedRooms.length < 1">
        <div class="noListing">No listings added yet yet</div>
        <AddRoomVue />
    </div>
    <div class="listings" v-else>
        <div v-for="listing in listedRooms" :key="listing">
            <HotelListingVue :roomInfo="listing"/>
        </div>
        <AddRoomVue />
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import HotelListingVue from './HotelListing.vue';
import AddRoomVue from './AddRoom.vue';

export default defineComponent({
    setup() {
        const listedRooms = ref([
            {
                id: 12,
                name: "Aussie-innit",
                description: "It's australia innit?",
                price: "6",
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
                price: "6",
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
        HotelListingVue,
        AddRoomVue
    }
})
</script>

<style lang="scss" scoped>
.noListing {
    width: 60%;
    margin: 10px;
    padding: 10px;
}

.listings {
    display: flex;
    flex-direction: column;
    width: 100%;
    align-items: center;
    height: 100vh;
    padding-top: 20px;
}
</style>