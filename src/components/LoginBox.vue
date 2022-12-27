<template>
    <form v-on:submit.prevent>
        <p>Email</p>
        <input type="email" name="name" id="name" placeholder="john@doe.com" class="userInfo" required v-model="email"/>
        <p>password:</p>
        <input type="password" name="password" id="password" placeholder="SuperSecurePassword" minlength="8" class="userInfo" required v-model="pword"/>
        <input type="checkbox" name="showPass" id="showPass" :checked="checkboxState" @input="triggerPassword()" />
        <Transition name="invalid">
            <p id="invalidReq" v-if="invalidReq">Invalid email or Password</p>
        </Transition>
        <input type="submit" id="login" value="Login" @click="triggerLogin()"/>

        <p>New to this site? <RouterLink to="./register">SignUp</RouterLink></p>
        <p>Hotel Manager? <RouterLink to="./loginhotel">Hotel Login</RouterLink></p>
    </form>
</template>

<script>
import axios from "axios";
import { defineComponent, onMounted, ref } from "vue";
import { RouterLink, useRouter } from "vue-router";
import { useStore } from "vuex";

export default defineComponent({
    components: {
    RouterLink,
},
    name: "LoginBox",
    setup() {
        const checkboxState = ref(false);
        let passwordField = ref(null);
        const email = ref("");
        const pword = ref("");
        const invalidReq = ref(false);

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

        const router = useRouter();

        const store = useStore();

        const triggerLogin = ref(async () => {
            const config = {
                headers: {
                    "Content-Type": "application/json",
                },
            }

            if (!email.value || !pword.value) {
                invalidReq.value = true;
                return;
            }

            try {
                const server_url = process.env.VUE_APP_SERVER;

                const {data} = await axios.post(`${ server_url }login`, {
                    email: email.value,
                    password: pword.value,
                }, config);

                if (!data) {
                    invalidReq.value = true;
                    return;
                };

                if (data.name) {
                    store.commit("updateLogin", {name: data.name, email: data.email, type: "user", id: data.userID})
                    localStorage.setItem("UserData", JSON.stringify({
                        name: data.name, email: data.email, type: "user", id: data.userID
                    }))
                    router.push("allrooms");
                } else {
                    invalidReq.value = true;
                }
            } catch(_error) {
                invalidReq.value = true;
                return;
            }
        })

        return {
            checkboxState,
            triggerPassword,
            triggerLogin,
            email,
            pword,
            invalidReq
        };
    }
});
</script>

<style lang="scss" scoped>
form {
    background: #eee;
    height: 40%;
    width: 35%;
    display: flex;
    flex-flow: column;
    justify-content: center;
    align-items: center;

    p:nth-last-of-type(2) {
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

    .userInfo {
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

    .userInfo:focus {
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
        cursor: pointer;
    }

    #showPass {
        width: 4vh;
        height: 2vh;
        position: absolute;
        transform: translate(220px, -20px);
    }

    #invalidReq {
        color: red;
        margin-bottom: 12px;
    }

    .invalid-enter-from {
        opacity: 0;
        transform: translateY(-30px);
    }

    .invalid-enter-active {
        transition: all 0.3s ease-out;
    }

    .invalid-leave-to {
        opacity: 0;
        transform: translateY(30px);
    }

    .invalid-leave-active {
        transition: all 0.3s ease-in;
    }
}
</style>