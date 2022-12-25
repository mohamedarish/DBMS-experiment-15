<template>
    <nav>
        <div class="links">
            <router-link to="/" v-if="['/'].includes(subdir)">Home</router-link>
            <router-link to="/login" v-if="['/', '/login', '/register', '/loginhotel', '/registerhotel'].includes(subdir)">Login</router-link>
            <router-link to="/register" v-if="['/', '/login', '/register', '/loginhotel', '/registerhotel'].includes(subdir)">Register</router-link>
            <router-link to="/loginhotel" v-if="['/', '/login', '/register', '/loginhotel', '/registerhotel'].includes(subdir)">LoginHotel</router-link>
            <router-link to="/registerhotel" v-if="['/', '/login', '/register', '/loginhotel', '/registerhotel'].includes(subdir)">RegisterHotel</router-link>
            <router-link to="/allrooms" v-if="!['/', '/login', '/register', '/loginhotel', '/registerhotel'].includes(subdir)">AllRooms</router-link>
            <router-link to="/bookings" v-if="!['/', '/login', '/register', '/loginhotel', '/registerhotel'].includes(subdir)">Booked</router-link>
            <router-link to="/mylistings" v-if="!['/', '/login', '/register', '/loginhotel', '/registerhotel'].includes(subdir)">MyListings</router-link>
        </div>

        <div class="state-login">
            <p class="username" v-if="loggedIn">{{ name }}</p>
            <img src="./assets/hotel.png" class="user" v-if='loggedIn && type == "hotel"'/>
            <img src="./assets/user.png" class="user" v-if='loggedIn && type=="user"'/>
            <router-link to="/login" v-else>login</router-link>
        </div>
    </nav>
    <div class="popup-module">
        
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
export default {
    setup() {
        const route = ref(useRoute());

        const data = JSON.parse(localStorage.getItem("UserDetails"));

        let name = data ? ref(data.name) : ref("");
        let email = data ? ref(data.email) : ref("");
        let type = data ? ref(data.type) : ref("");

        let loggedIn = data ? ref(true) : ref(false);

        const subdir = computed(() => route.value.path);

        const router = useRouter();

        router.afterEach(() => {
            console.log(name.value, email.value, type.value, loggedIn.value);

            const data = JSON.parse(localStorage.getItem("UserDetails"));

            console.log(data);

            if (!data) {
                name = ref("");
                email = ref("");
                type = ref("");
                loggedIn = ref(false);
                return;
            }

            name = ref(data.name);
            email = ref(data.email);
            type = (data.type);

            loggedIn = ref(true);

            console.log(name.value, email.value, type.value, loggedIn.value);
        })


        return {
            subdir,
            name,
            email,
            type,
            loggedIn
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
