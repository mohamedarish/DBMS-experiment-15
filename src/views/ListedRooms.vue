<template>
    <div class="home">
        <!-- render? -->
        <MyListingsVue />
    </div>
</template>

<script>
import { defineComponent } from 'vue';
import MyListingsVue from '@/components/MyListings.vue';
export default defineComponent({
    name: "ListedRooms",
    components: {
        MyListingsVue,
    }
});
</script>