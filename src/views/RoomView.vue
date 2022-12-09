<template>
  <div class="home">
    <AddRoomVue />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import AddRoomVue from "@/components/AddRoom.vue";

export default defineComponent({
  name: "LoginView",
  components: {
    AddRoomVue,
  },
});
</script>
