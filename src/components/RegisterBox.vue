<template>
    <div class="login">
        <form>
            <p>Email</p>
            <input type="email" name="email" id="email" placeholder="john@doe.com" required/>
            <p>Full Name</p>
            <input type="text" name="fullname" id="fullname" placeholder="John Doe" required/>
            <p>Date of Birth</p>
            <input type="date" name="DOB" id="DOB" required/>
            <p>Address</p>
            <input type="text" name="address" id="address" required/>
            <p>Password</p>
            <input type="password" name="password" id="password" placeholder="SuperSecurePassword" required/>
            <p>Confirm Password</p>
            <input type="password" name="confirmp" id="confirmp" placeholder="SuperSecurePassword" required/>
            <input type="submit" id="register" value="Register">
        </form>
    </div>
</template>

<script>
import { defineComponent } from "vue";
export default defineComponent({
    name: "LoginBox",
});
</script>

<style lang="scss" scoped>
.login {
    height: calc(100vh - 64px);
    background-image: url("https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg");
    background-repeat: no-repeat;
    background-size: cover;

    display: flex;
    justify-content: center;
    align-items: center;

    form {
        background: #eee;
        height: 40%;
        width: 35%;
        display: flex;
        flex-flow: column;
        justify-content: center;
        align-items: center;

        p {
            width: 70%;
            height: 7%;
            display: flex;
            align-items: flex-end;
            justify-content: flex-start;
        }
    }
}

</style>