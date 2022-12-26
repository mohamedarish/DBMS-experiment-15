<template>
    <Suspense>
        <template #default>
            <RoomDetailedVue />
        </template>
        <template #fallback>
            Loading...
        </template>
    </Suspense>
</template>

<script>
import { defineComponent } from 'vue';
import { useRouter } from 'vue-router';
import RoomDetailedVue from '@/components/RoomDetailed.vue';
import { useStore } from 'vuex';
export default defineComponent({
    name: "SingleRoomView",
    props: ["roomId"],
    setup() {
        const store = useStore();
        const router = useRouter();

        const user = store.state.user;

        if (!user.name) {
            router.push({path: "/"});
        }
    },
    components: {
        RoomDetailedVue,
    }
})
</script>

<style>

</style>