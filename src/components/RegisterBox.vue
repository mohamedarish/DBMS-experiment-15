<template>
    <div class="login">
        <form v-on:submit.prevent>
            <p>Email</p>
            <input type="email" name="email" id="email" placeholder="john@doe.com" class="userInfo" required v-model="email"/>
            <p>Full Name</p>
            <input type="text" name="fullname" id="fullname" placeholder="John Doe" class="userInfo" required v-model="name"/>
            <p>Date of Birth</p>
            <input type="date" name="DOB" id="DOB" class="userInfo" required v-model="DOB"/>
            <p>Address</p>
            <textarea name="address" id="address" cols="5" rows="20" class="userInfo" placeholder="House
street
city" required v-model="address"/>
            <p>Password</p>
            <input type="password" name="password" id="password" placeholder="SuperSecurePassword" class="userInfo" required v-model="pword"/>
            <input type="checkbox" name="showPass" id="showPass" :checked="passwordView" @input="triggerPass()" />
            <p>Confirm Password</p>
            <input type="password" name="confirmp" id="confirmp" placeholder="SuperSecurePassword" class="userInfo" required v-model="cpword"/>
            <input type="checkbox" name="showConf" id="showConf" :checked="confirmView" @input="triggerConf()" />
            <Transition name="invalid">
                <p id="invalidReq" v-if="invalidReq">Invalid Information Provided</p>
            </Transition>
            <input type="submit" id="register" value="Register" @click="triggerRegister()"/>

            <p>Have an account? <RouterLink to="./login">Sign In</RouterLink></p>
            <p>Manage a Hotel? <RouterLink to="./registerhotel">Hotel Sign Up</RouterLink></p>
        </form>
    </div>
</template>

<script>
import axios from "axios";
import { defineComponent, onMounted, ref } from "vue";
import { RouterLink, useRouter } from "vue-router";
export default defineComponent({
    name: "LoginBox",
    setup() {
        const passwordView = ref(false);
        const confirmView = ref(false);
        let passwordMount = ref(null);
        let confirmMount = ref(null);
        const email = ref("");
        const name = ref("");
        const DOB = ref("");
        const address = ref("");
        const pword = ref("");
        const cpword = ref("");
        const invalidReq = ref(false);

        const triggerPass = ref(() => {
            passwordView.value = !passwordView.value;
            if (passwordView.value) {
                passwordMount.value.type = "text";
            }
            else {
                passwordMount.value.type = "password";
            }
        });
        const triggerConf = ref(() => {
            confirmView.value = !confirmView.value;
            if (confirmView.value) {
                confirmMount.value.type = "text";
            }
            else {
                confirmMount.value.type = "password";
            }
        });
        onMounted(() => {
            passwordMount = ref(document.querySelector("#password"));
            confirmMount = ref(document.querySelector("#confirmp"));
        });

        const router = useRouter();

        const triggerRegister = ref(async () => {
            if (pword.value !== cpword.value) {
                invalidReq.value = true;
                reutrn;
            }

            if (!email.value || !name.value || !DOB.value || !address.value || !pword.value) {
                invalidReq.value = true;
                return;
            }

            const config = {
                headers: {
                    "Content-Type": "application/json",
                },
            }

            try {
                const { data } = await axios.post("http://localhost:8000/api/user/register", {
                    email: email.value,
                    name: name.value,
                    DOB: DOB.value,
                    address: address.value,
                    password: pword.value
                }, config);

                if (!data) return;

                if (data.email) {
                    localStorage.setItem({
                        email: data.email,
                        name: data.name,
                        type: "user"
                    });
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
            passwordView,
            confirmView,
            triggerPass,
            triggerConf,
            triggerRegister,
            email,
            name,
            DOB,
            address,
            pword,
            cpword,
            invalidReq
        };
    },
    components: { RouterLink }
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
        height: 70%;
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
            height: 3%;
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
            padding: 5px;
            background-color: #eee;
            border: none;
            border-bottom: solid #777 0.2px;
            width: 70%;
            height: 4.5%;
            font-size: 2vh;
            box-decoration-break: none;
            outline: none;
            margin-bottom: 9px;
        }

        #address {
            height: 13.5%;
        }

        .userInfo:focus {
            border-bottom: solid #555 0.4px;
            transition: all 0.5s ease-in-out;
            background: #ddd;
        }

        #register {
            width: 70%;
            height: 7%;
            background-color: #82500A;
            color: #ccc;
            font-size: 3vh;
        }

        #showPass, #showConf {
            width: 4vh;
            height: 2vh;
            position: absolute;
        }

        #showPass {
            transform: translate(220px, 80px);
        }

        #showConf {
            transform: translate(220px, 140px);
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
}

</style>