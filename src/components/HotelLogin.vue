<template>
  <div class="login">
    <form>
      <ul>
        <li>
          <label for="name"> Name </label>
          <input type="text" name="name" id="name" />
        </li>
        <li>
          <label for="password"> Password </label>
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

<style lang="scss">
ul {
  list-style-type: none;
}
</style>
