<template>
    <div class="home">
        <Suspense>
            <template #default>
            <!-- render? -->
                <ViewBookingsVue />
            </template>
            <template #fallback>
                Loading...
            </template>
        </Suspense>
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

        if (!user.name || user.type != "user") {
            router.push({path: "/"});
        }
    },
    components: {
        ViewBookingsVue,
    }
});
</script>