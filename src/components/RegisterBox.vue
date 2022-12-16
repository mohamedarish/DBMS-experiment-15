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
                    <label for="dob"> DOB </label>
                    <input type="date" name="DOB" id="DOB" />
                </li>
                <li>
                    <label for="phone"> phone number </label>
                    <input type="tel" name="phone" id="phone" />
                </li>
                <li>
                    <label for="address"> Address </label>
                    <input type="tel" name="address" id="address" />
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

<script>
import { defineComponent } from "vue";
export default defineComponent({
    name: "LoginBox",
});
</script>

<style>
ul {
    list-style-type: none;
}
</style>