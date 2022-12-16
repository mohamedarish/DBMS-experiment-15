<template>
    <div class="home">
        <HotelLoginVue />
    </div>
</template>

<script>
import { defineComponent } from "vue";
import HotelLoginVue from "@/components/HotelLogin.vue";
export default defineComponent({
    name: "OldRoomView",
    components: {
        HotelLoginVue,
    },
});
</script>