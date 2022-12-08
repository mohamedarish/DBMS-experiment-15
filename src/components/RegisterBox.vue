<template>
  <div class="login">
    <form>
      <ul>
        <li>
          <label for="email"> email </label>
          <input type="email" name="email" id="email" />
        </li>
        <li>
          <label for="fullname"> name </label>
          <input type="text" name="fullname" id="fullname" />
        </li>
        <li>
          <label for="managerb"> Are you a manager? </label>
          <input type="checkbox" name="managerb" id="managerb" />
        </li>
        <li>
          <!-- Only show this if the checkbox above is selected -->
          <label for="hotel">Enter the name of the hotel you manage</label>
          <input type="text" name="hotel" id="hotel" />
        </li>
        <li>
          <label for="phone">phone number</label>
          <input type="tel" name="phone" id="phone" />
        </li>
        <li>
          <label for="password"> password </label>
          <input type="password" name="password" id="password" />
        </li>
        <li>
          <label for="confirmp"> confirm password </label>
          <input type="password" name="confirmp" id="confirmp" />
        </li>
        <li>
          <button type="submit">register</button>
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
