<template>
    <NotFoundVue />
</template>

<script>
import { defineComponent } from 'vue';
import NotFoundVue from '@/components/NotFound.vue';
export default defineComponent({
    name: "ErrorView",
    components: {
        NotFoundVue
    }
})
</script>