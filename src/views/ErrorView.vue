<template>
    <NotFoundVue />
</template>

<script>
import { defineComponent } from 'vue';
import NotFoundVue from '@/components/NotFound.vue';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';
export default defineComponent({
    name: "ErrorView",
    setup() {
        const store = useStore();
        const router = useRouter();

        const data = store.state.user;

        if (data.name) {
            router.push("allrooms");
        } else {
            router.push({path: "/"})
        }
    },
    components: {
        NotFoundVue
    }
})
</script>