<template>
    <RoomDetailedVue :roomInfo="reqRoom" :available="true"/>
</template>

<script>
import { defineComponent, ref } from 'vue';
import { useRoute } from 'vue-router';
import RoomDetailedVue from '@/components/RoomDetailed.vue';
export default defineComponent({
    name: "SingleRoomView",
    props: ["roomId"],
    setup() {
        const rooms = [
            {
                id: 12,
                name: "Aussie-innit",
                description: "It's australia innit?",
                price: "6",
                type: "Single Mouse",
                address: "New Zealand",
                rating: 2,
                number_of_reviews: 6000,
                images: ["https://pix10.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg", "https://www.ohotelsindia.com/pune/images/b32d5dc553ee2097368bae13f83e93cf.jpg", "https://cdn.britannica.com/41/941-004-D59E3112/Masai-giraffe.jpg"]
            },
            {
                id: 1979,
                name: "French🤢",
                description: "It's France🤮 baguette?",
                price: "-600000",
                type: "MultiCuisine",
                address: "France 🤮🤮🤮",
                rating: 1,
                number_of_reviews: 40000,
                images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg", "https://cdn.britannica.com/41/941-004-D59E3112/Masai-giraffe.jpg"]
            },
            {
                id: 16,
                name: "Giraffe🦒",
                description: "Giraffe 🦒🦒🦒",
                price: "6000000",
                type: "It's a giraffe",
                address: "Giraffe 🦒🦒🦒 Town 🦒🦒🦒🦒🦒",
                rating: 1,
                number_of_reviews: 40000,
                images: ["https://cdn.mos.cms.futurecdn.net/mEuBJTDhXuTfSKdLefzSKg-1200-80.jpg"]
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
        ];

        const route = useRoute();

        const reqRoom = ref(rooms.filter(element => element.id.toString() == route.params.id.slice(1))[0]);

        console.log(reqRoom);

        return {
            reqRoom
        }
    },
    components: {
        RoomDetailedVue
    }
})
</script>

<style>

</style>