<template>
  <div class="login">
    <form>
      <ul>
        <li>
          <label for="roomis"> Enter the links to images for the rooms </label>
          <ul type="roomis">
            <li>
              <label for="link1"> Link 1 </label
              ><input type="url" name="link1" id="roomis" />
            </li>
            <li>
              <label for="link2"> Link 2 </label
              ><input type="url" name="link2" id="roomis" />
            </li>
            <li>
              <label for="link3"> Link 3 </label
              ><input type="url" name="link3" id="roomis" />
            </li>
            <li>
              <label for="link4"> Link 4 </label
              ><input type="url" name="link4" id="roomis" />
            </li>
          </ul>
        </li>
        <li>
          <label for="roomn"> Enter the room name </label>
          <input type="text" name="roomn" id="roomn" />
        </li>
        <li>
          <label for="roomd"> Enter the room description </label>
          <input type="text" name="roomd" id="roomd" />
        </li>
        <li>
          <label for="roomp"> Enter the quoted price for the room </label>
          <input type="number" name="roomp" id="roomp" />
        </li>
        <li>
          <button type="submit">submit</button>
        </li>
      </ul>
    </form>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
export default defineComponent({
  name: "AddListing",
});
</script>

<style lang="scss">
ul {
  list-style-type: none;
}
</style>
