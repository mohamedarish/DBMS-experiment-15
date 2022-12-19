<template>
    <div class="login">
        <form>
            <ul>
                <li>
                    <label for="type"> Type </label>
                    <input type="text" name="type" id="type" />
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
  
<script>
import { defineComponent } from "vue";
export default defineComponent({
    name: "AddRoom",
});
</script>

<style lang="scss" scoped>


</style>