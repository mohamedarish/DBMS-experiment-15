<template>
  <div class="login">
    <form>
      <ul>
        <li>
          <label for="email"> email </label>
          <input type="email" name="email" id="email" />
        </li>
        <li>
          <label for="password"> password </label>
          <input type="password" name="password" id="password" />
        </li>
        <li>
          <button type="submit">login</button>
        </li>
      </ul>
    </form>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
export default defineComponent({
  name: "LoginBox",
});
</script>

<style></style>
