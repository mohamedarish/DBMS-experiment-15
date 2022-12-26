<template>
    <div class="home">
        <Suspense>
            <template #default>
                <ListingHolderVue />
            </template>
            <template #fallback>
                Loading...
            </template>
        </Suspense>
    </div>
</template>

<script>
import { defineComponent } from 'vue';
import ListingHolderVue from '@/components/ListingHolder.vue';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';
export default defineComponent({
    name: "LisitngView",
    setup() {
        const store = useStore();
        const router = useRouter();

        const user = store.state.user;

        if (!user.name) {
            router.push({path: "/"});
        }
    },
    components: {
        ListingHolderVue,
    }
});
</script>