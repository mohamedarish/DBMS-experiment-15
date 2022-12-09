<template>
  <div class="home">
    <HotelLoginVue />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import HotelLoginVue from "@/components/HotelLogin.vue";

export default defineComponent({
  name: "LoginView",
  components: {
    HotelLoginVue,
  },
});
</script>
