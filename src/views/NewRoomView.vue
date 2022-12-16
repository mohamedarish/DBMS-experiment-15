<template>
    <div class="home">
        <AddRoomVue />
    </div>
</template>

<script>
import { defineComponent } from "vue";
import AddRoomVue from "@/components/AddRoom.vue";
export default defineComponent({
    name: "NewRoomView",
    components: {
        AddRoomVue,
    },
});
</script>