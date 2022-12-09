<template>
  <div class="home">
    <AddHotelVue />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import AddHotelVue from "@/components/AddHotel.vue";

export default defineComponent({
  name: "RegisterView",
  components: {
    AddHotelVue,
  },
});
</script>
