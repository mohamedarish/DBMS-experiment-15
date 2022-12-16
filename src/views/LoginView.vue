<template>
    <div class="home">
        <LoginBoxVue />
    </div>
</template>

<script>
import { defineComponent } from "vue";
import LoginBoxVue from "@/components/LoginBox.vue";
export default defineComponent({
    name: "LoginView",
    components: {
        LoginBoxVue,
    },
});
</script>