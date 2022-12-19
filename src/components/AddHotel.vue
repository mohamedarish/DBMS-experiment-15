<template>
    <div class="login">
        <form>
            <p>Email</p>
            <input type="email" name="email" id="email" placeholder="john@hotel.com" required/>
            <p>Hotel Name</p>
            <input type="text" name="hotelname" id="hotelname" placeholder="HotelName" required/>
            <p>Address</p>
            <textarea name="address" id="address" cols="5" rows="20" placeholder="Hotel
street
city" />
            <p>Password</p>
            <input type="password" name="password" id="password" placeholder="SuperSecurePassword" required/>
            <input type="checkbox" name="showPass" id="showPass"  :checked="passwordView" @input="triggerPass()" />
            <p>Confirm Password</p>
            <input type="password" name="confirmp" id="confirmp" placeholder="SuperSecurePassword" required/>
            <input type="checkbox" name="showConf" id="showConf" :checked="confirmView" @input="triggerConf()" />
            <input type="submit" id="register" value="Register" />
            <p>Have an account? <a href="./loginhotel">Sign In</a></p>
            <p>New Customer? <a href="./register">Sign Up</a></p>
        </form>
    </div>
</template>

<script>
import { defineComponent, ref, onMounted } from "vue";
export default defineComponent({
    name: "AddHotel",
    setup() {
        const passwordView = ref(false);
        const confirmView = ref(false);
        let passwordMount = ref(null);
        let confirmMount = ref(null);

        const triggerPass = ref(() => {
            passwordView.value = !passwordView.value;

            if (passwordView.value) {
                passwordMount.value.type = "text";
            } else {
                passwordMount.value.type = "password";
            }
        })

        const triggerConf = ref(() => {
            confirmView.value = !confirmView.value;

            if (confirmView.value) {
                confirmMount.value.type = "text";
            } else {
                confirmMount.value.type = "password";
            }

        })

        onMounted(() => {
            passwordMount = ref(document.querySelector("#password"));
            confirmMount = ref(document.querySelector("#confirmp"));
        })

        return {
            passwordView,
            confirmView,
            triggerPass,
            triggerConf
        }
    },
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

        #email, #password, #hotelname, #confirmp, #address {
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

        #name:focus, #password:focus, #fullname:focus, #DOB:focus, #confirmp:focus, #address:focus {
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
            right: 37.5%;
        }

        #showPass {
            bottom: 41.7%;
        }

        #showConf {
            bottom: 36%;
        }

    }
}
</style>