<template>
    <nav>
        <div class="links">
            <router-link to="/">Home</router-link>
            <router-link to="/allrooms" v-if="creds.name">All rooms</router-link>
        </div>
        <div class="state-login" @click="triggerPop()">
            <p class="username" v-if="creds.name">{{ creds.name }}</p>
            <img src="./assets/hotel.png" class="user" v-if='creds.name && creds.type == "hotel"'/>
            <img src="./assets/user.png" class="user" v-else-if='creds.name && creds.type=="user"'/>
            <router-link to="/login" v-else>login</router-link>
        </div>
    </nav>
    <div class="popup-module" v-if="popupFlag && creds.name" @click="triggerPop()">
        <div class="popup">
            <ul>
                <li v-if="creds.type == 'hotel'"><router-link to="/mylistings">My Listings</router-link></li>
                <li v-else-if="creds.type == 'user'"><router-link to="/bookings">My Bookings</router-link></li>
                <li @click="logOut()">Log out</li>
            </ul>
        </div>
    </div>
    <router-view v-slot="{ Component }" class="main">
        <transition name="route" mode="out-in">
            <component :is="Component"></component>
        </transition>
    </router-view>
</template>

<script>
import { useRoute, useRouter } from 'vue-router';
import { computed, ref } from 'vue';
import { useStore } from 'vuex';
export default {
    setup() {
        const route = ref(useRoute());

        const store = useStore();

        const localStorageData = JSON.parse(localStorage.getItem("UserData")) ? JSON.parse(localStorage.getItem("UserData")) : {name: "", email: "", type: ""};

        store.commit("updateLogin", localStorageData);

        const creds = computed(() => store.state.user);

        const router = ref(useRouter());

        const logOut = ref(() => {
            store.commit("updateLogin", {name: "", email: "", type: ""});
            localStorage.removeItem("UserData");
            router.value.push({path: "/"});
        })

        const subdir = computed(() => route.value.path);

        const popupFlag = ref(false);

        const triggerPop = ref(() => {
            popupFlag.value = !popupFlag.value;
        })


        return {
            subdir,
            popupFlag,
            triggerPop,
            creds,
            logOut
        }
    }
}
</script>

<style lang="scss" scoped>
nav {
    display: flex;
    width: 100vw;
    justify-content: space-between;
    background: #82500a;
    padding: 20px;
    height: 64px;

    .links {
        a {
            margin-right: 6px;
        }
    }

    .state-login {
        display: flex;
        justify-content: flex-end;
        height: 100%;
        align-items: center;

        .username {
            color: #ebeff4;
            margin-right: 5px;
        }

        .user {
            height: 44px;
            width: 44px;
            border-radius: 50%;
            border: solid #ebeff4 0.5px;
        }
    }
}

nav a {
    font-weight: bold;
    color: #ebeff4;
    text-decoration: none;
}

nav a.router-link-exact-active {
    color: #42b983;
}

.popup-module {
    position: fixed;
    height: 100vh;
    width: 100vw;
    display: flex;
    justify-content: flex-end;

    .popup {
        background: #ebeff4;
        width: 10%;
        height: 47px;
        ul {
            list-style: none;

            a {
                text-decoration: none;
                color: #292929;

                &:visited {
                    text-decoration: none;
                }

                &:active {
                    text-decoration: none;
                }
            }

            li {
                border-top: solid #999 1px;
                border-bottom: solid #999 1px;
                cursor: pointer;
            }
        }
    }
}

// Route transitions

.route-enter-from {
    opacity: 0;
    transform: translateY(100px);
}

.route-enter-active {
    transition: all 0.3s ease-out;
}

.route-leave-to {
    opacity: 0;
    transform: translateY(-100px);
}

.route-leave-active {
    transition: all 0.3s ease-in;
}
</style>
