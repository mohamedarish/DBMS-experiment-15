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
            <p  class="username">SignedInUser</p>
            <img src="https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png" class="user" />
        </div>
    </nav>
    <router-view v-slot="{ Component }" class="main">
        <transition name="route" mode="in-out">
            <component :is="Component"></component>
        </transition>
    </router-view>
</template>

<script>
import { useRoute } from 'vue-router';
import { computed, ref } from 'vue';
export default {
    setup() {
        const route = ref(useRoute());

        const subdir = computed(() => route.value.path);

        console.log(subdir.value);

        return {
            subdir
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
