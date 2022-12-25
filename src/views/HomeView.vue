<template>
    <div class="home">
        <HelloWorld v-if="currentPath == '/'"/>
        <div class="comp-holder" v-else>
            <Transition name="comp" mode="out-in">
                <LoginBoxVue v-if="currentPath == '/login'" />
            </Transition>
            <Transition name="comp">
                <RegisterBoxVue v-if="currentPath == '/register'" />
            </Transition>
            <Transition name="comp">
                <HotelLoginVue v-if="currentPath == '/loginhotel'" />
            </Transition>
            <Transition name="comp">
                <AddHotelVue v-if="currentPath == '/registerhotel'" />
            </Transition>
        </div>
    </div>
</template>

<script>
// @ is an alias to /src
import RegisterBoxVue from '@/components/RegisterBox.vue';
import HelloWorld from "@/components/HelloWorld.vue";
import LoginBoxVue from "@/components/LoginBox.vue";
import AddHotelVue from "@/components/AddHotel.vue";
import HotelLoginVue from "@/components/HotelLogin.vue";
import { useRoute, useRouter } from 'vue-router';
import { computed } from '@vue/runtime-core';
import { useStore } from 'vuex';

export default {
    name: 'HomeView',
    setup () {
        const route = useRoute();

        const currentPath = computed(() => route.path);

        const store = useStore();

        const user = store.state.user;

        const router = useRouter();

        if (user.name && route.path != "/") {
            console.log("Redirecting");
            router.push("allrooms");
        }

        return {
            currentPath
        }
    },
    components: {
    HelloWorld,
    LoginBoxVue,
    RegisterBoxVue,
    AddHotelVue,
    HotelLoginVue
}
}
</script>

<style lang="scss" scoped>
.home {
    height: calc(100vh - 64px);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    background-image: url("https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg");
    background-repeat: no-repeat;
    background-size: cover;

    .comp-holder {
        height: calc(100vh - 64px);
        width: 100vw;
        display: flex;
        justify-content: center;
        align-items: center;


            .comp-enter-from {
                opacity: 0;
                transform: translateY(100px);
            }

            .comp-enter-active {
                transition: all 0.3s ease-in;
            }

            .comp-leave-to {
                opacity: 0;
                transform: translateY(-100px);
            }

            .comp-leave-active {
                transition: all 0.3s ease-out;
            }
    }
}
</style>