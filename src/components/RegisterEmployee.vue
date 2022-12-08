<template>
  <div class="login">
    <form>
      <ul>
        <li>
          <label for="email"> email </label>
          <input type="email" name="email" id="email" />
        </li>
        <li>
          <label for="name"> Name </label>
          <input type="text" name="name" id="name" />
        </li>
        <li>
          <label for="gender"> Gender </label>
          <input type="radio" name="gender" id="male" value="male" />
          <label for="male"> Male </label>
          <input type="radio" name="gender" id="female" value="female" />
          <label for="female"> Female </label>
        </li>
        <li>
          <label for="address"> Address </label>
          <input type="text" name="address" id="address" />
        </li>
        <li>
          <label for="position"> Position </label>
          <input type="text" name="position" id="position" />
        </li>
        <li>
          <label for="password"> password </label>
          <input type="password" name="password" id="password" />
        </li>
        <li>
          <button type="submit">add employee</button>
        </li>
      </ul>
    </form>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
export default defineComponent({
  name: "RegisterEmployee",
});
</script>

<style lang="scss">
ul {
  list-style-type: none;
}
</style>
