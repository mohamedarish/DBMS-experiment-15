<template>
    <div class="home">
        <AddHotelVue />
    </div>
</template>

<script>
import { defineComponent } from "vue";
import AddHotelVue from "@/components/AddHotel.vue";
export default defineComponent({
    name: "NewHotelView",
    components: {
        AddHotelVue,
    },
});
</script>