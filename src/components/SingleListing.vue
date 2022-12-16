<template>
    <div class="listing">
        <h3 class="heading">{{ roomInfo.name }}</h3>
        <p class="description">{{ roomInfo.descriptiom }}</p>
        <h3 class="price">{{ roomInfo.price }}</h3>
        <p class="type">{{ roomInfo.type }}</p>
        <p class="address">{{ roomInfo.address }}</p>
    </div>
</template>

<script>
import { defineComponent } from 'vue';
export default defineComponent({
    props: ["roomInfo"],
    setup(props) {
        console.log(props.roomInfo);
    },
    name: "SingleListing",
});
</script>

<style>

</style>