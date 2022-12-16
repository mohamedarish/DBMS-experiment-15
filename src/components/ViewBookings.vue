<template>
    <div v-if="bookedRooms.length < 1">
        No Bookings :(
    </div>
    <div v-else>
        <div v-for="room in bookedRooms" :key="room">
            <SingleListingVue :roomInfo="room" :booked="true"/>
        </div>
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import SingleListingVue from './SingleListing.vue';
export default defineComponent({
    setup() {
        const bookedRooms = ref([
            {
                id: 12,
                name: "Aussie-innit",
                description: "It's australia innit?",
                price: "6 pesos",
                type: "Single Mouse",
                address: "New Zealand",
            },
            {
                id: 14,
                name: "NewZie-innit",
                description: "It's new zealand innit?",
                price: "6 rupees",
                type: "Triple Mouse",
                address: "Australia",
            }
        ]);

        return {
            bookedRooms
        }
    },
    name: "ViewBookings",
    components: {
        SingleListingVue
    }
})
</script>

<style>

</style>