<template>
  <div class="home">
    <LoginBoxVue />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import LoginBoxVue from "@/components/LoginBox.vue";

export default defineComponent({
  name: "LoginView",
  components: {
    LoginBoxVue,
  },
});
</script>
