<template>
    <div class="home">
        <!-- render? -->
        <ListingHolderVue />
    </div>
</template>

<script>
import { defineComponent } from 'vue';
import ListingHolderVue from '@/components/ListingHolder.vue';
export default defineComponent({
    name: "LisitngView",
    components: {
        ListingHolderVue,
    }
});
</script>