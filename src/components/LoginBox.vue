<template>
    <div class="login">
        <form>
            <p>Email</p>
            <input type="email" name="name" id="name" placeholder="john@doe.com" required />
            <p>password:</p>
            <input type="password" name="password" id="password" placeholder="SuperSecurePassword" minlength="8" required/>
            <input type="checkbox" name="showPass" id="showPass" :checked="checkboxState" @input="triggerPassword()" />
            <input type="submit" id="login" value="Login"/>

                <p>New to this site? <a href="">SignUp</a></p>
                <p>Hotel Manager? <a href="">Hotel Login</a></p>
        </form>
    </div>
</template>

<script>
import { defineComponent, onMounted, ref } from "vue";
export default defineComponent({
    name: "LoginBox",
    setup() {
        const checkboxState = ref(false);
        let passwordField = ref(null);

        const triggerPassword = ref(() => {
            checkboxState.value = !checkboxState.value;

            if (checkboxState.value) {
                passwordField.value.type = "text";
            } else {
                passwordField.value.type = "password";
            }
        })

        onMounted(() => {
            passwordField = ref(document.querySelector("#password"));
        })

        return {
            checkboxState,
            triggerPassword
        };
    }
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

        p:nth-last-child(2) {
            margin-top: 12px;
        }

        p {
            width: 70%;
            height: 7%;
            display: flex;
            align-items: flex-end;
            justify-content: flex-start;

            a {
                padding-left: 3px;
                text-decoration-line: none;
                color: #82500A;
                text-decoration-color: #82500A;
            }

            a:visited {
                color: #82501B;
                text-decoration-color: #82501B;
            }
        }

        #name, #password {
            background-color: #eee;
            border: none;
            border-bottom: solid #777 0.2px;
            width: 70%;
            height: 10%;
            font-size: 3vh;
            box-decoration-break: none;
            outline: none;
            margin-bottom: 9px;
        }

        #name:focus, #password:focus {
            border-bottom: solid #555 0.4px;
            transition: all 0.5s ease-in-out;
            background: #ddd;
        }

        #login {
            width: 70%;
            height: 15%;
            background-color: #82500A;
            color: #ccc;
            font-size: 3vh;
        }

        #showPass {
            width: 4vh;
            height: 2vh;
            position: absolute;
            right: 37.5%;
            bottom: 47%;
        }
    }
}
</style>