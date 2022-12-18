<template>
    <RoomDetailedVue />
</template>

<script>
import { defineComponent } from 'vue';
import RoomDetailedVue from '@/components/RoomDetailed.vue';
export default defineComponent({
    name: "SingleRoomView",
    components: {
        RoomDetailedVue
    }
})
</script>

<style>

</style>