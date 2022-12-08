<template>
  <div class="home">
    <RegisterEmployeeVue />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import RegisterEmployeeVue from "@/components/RegisterEmployee.vue";

export default defineComponent({
  name: "UserRegister",
  components: {
    RegisterEmployeeVue,
  },
});
</script>
