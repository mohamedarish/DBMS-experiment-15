<template>
    <div class="home">
        <!-- render? -->
        <ViewBookingsVue />
    </div>
</template>

<script>
import { defineComponent } from 'vue';
import ViewBookingsVue from '@/components/ViewBookings.vue';

export default defineComponent({
    name: "BookedView",
    components: {
        ViewBookingsVue,
    }
});
</script>