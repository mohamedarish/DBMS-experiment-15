<template>
    <div class="bookingHolder">
        <div class="header-text">Currently booked</div>
        <div v-if="bookedRooms.length < 1">
            No Bookings :(
        </div>
        <div v-else>
            <div v-for="room in bookedRooms" :key="room">
                <BookedListingVue :roomInfo="room"/>
            </div>
        </div>

        <div class="header-text">Previous Bookings</div>
        <div v-if="oldRooms.length > 0">
            <div v-for="old in oldRooms" :key="old">
                <PreviousListingVue :roomInfo="old" />
            </div>
        </div>
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import BookedListingVue from './BookedListing.vue';
import PreviousListingVue from './PreviousListing.vue';
export default defineComponent({
    setup() {
        const bookedRooms = ref([
            {
                id: 12,
                name: "Aussie-innit",
                description: "It's australia innit?",
                price: "6",
                type: "Single Mouse",
                address: "New Zealand",
                rating: 4,
                number_of_reviews: 2,
                images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg"]
            },
            {
                id: 14,
                name: "NewZie-innit",
                description: "It's new zealand innit?",
                price: "6",
                type: "Triple Mouse",
                address: "Australia",
                rating: 1,
                number_of_reviews: 5,
                images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg"]
            }
        ]);

        const oldRooms = ref([
            {
                id: 12,
                name: "Aussie-innit",
                description: "It's australia innit?",
                price: "6",
                type: "Single Mouse",
                address: "New Zealand",
                rating: 4,
                number_of_reviews: 2,
                images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg"]
            },
            {
                id: 14,
                name: "NewZie-innit",
                description: "It's new zealand innit?",
                price: "6",
                type: "Triple Mouse",
                address: "Australia",
                rating: 1,
                number_of_reviews: 5,
                images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg"]
            }
        ]);

        return {
            bookedRooms,
            oldRooms
        }
    },
    name: "ViewBookings",
    components: {
        BookedListingVue,
        PreviousListingVue
    }
})
</script>

<style lang="scss" scoped>
.bookingHolder {
    margin: 10px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    .header-text {
        font-size: xx-large;
        width: 60%;
        margin: 10px;
        border-bottom: solid #666 1px;
    }
}
</style>