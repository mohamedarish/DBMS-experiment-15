<template>
  <div class="home">
    <RegisterBoxVue />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import RegisterBoxVue from "@/components/RegisterBox.vue";

export default defineComponent({
  name: "RegisterView",
  components: {
    RegisterBoxVue,
  },
});
</script>
