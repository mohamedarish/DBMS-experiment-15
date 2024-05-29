<template>
  <div class="error">
    <div class="image">
      <img
        src="https://cdni.iconscout.com/illustration/premium/thumb/tourist-couple-trying-to-find-path-3462569-2911004.png"
        alt="lost-tourist"
      />
    </div>
    <div class="text">404 Not Found</div>
    <div class="link">Go Back <RouterLink href="./">Home?</RouterLink></div>
  </div>
</template>

<script>
import { defineComponent } from "vue";
import { RouterLink } from "vue-router";
export default defineComponent({
  name: "NotFound",
  components: { RouterLink },
});
</script>

<style lang="scss" scoped></style>

