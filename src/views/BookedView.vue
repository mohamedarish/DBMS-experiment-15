<template>
    <div class="home">
        <!-- render? -->
        <ViewBookingsVue />
    </div>
</template>

<script>
import { defineComponent } from 'vue';
import ViewBookingsVue from '@/components/ViewBookings.vue';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';

export default defineComponent({
    name: "BookedView",
    setup() {
        const store = useStore();
        const router = useRouter();

        const user = store.state.user;

        if (!user.name) {
            router.push({path: "/"});
        }
    },
    components: {
        ViewBookingsVue,
    }
});
</script>