<template>
  <div class="home">
    <AddListingVue />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import AddListingVue from "@/components/AddListing.vue";

export default defineComponent({
  name: "LoginView",
  components: {
    AddListingVue,
  },
});
</script>
