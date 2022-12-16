<template>
    <div class="login">
        <form>
            <ul>
                <li>
                    <label for="name"> Name </label>
                    <input type="text" name="name" id="name" />
                </li>
                <li>
                    <label for="address"> Address </label>
                    <input type="text" name="address" id="address" />
                </li>
                <li>
                    <label for="password"> Password </label>
                    <input type="password" name="password" id="password" />
                </li>
                <li>
                    <button type="submit">register</button>
                </li>
            </ul>
        </form>
    </div>
</template>

<script>
import { defineComponent } from "vue";
export default defineComponent({
    name: "AddHotel",
});
</script>

<style>
ul {
    list-style-type: none;
}
</style>