<template>
  <div class="home">
    <!-- render? -->
    <Suspense>
      <template #default>
        <MyListingsVue />
      </template>
      <template #fallback> Loading... </template>
    </Suspense>
  </div>
</template>

<script>
import { defineComponent } from "vue";
import MyListingsVue from "@/components/MyListings.vue";
import { useStore } from "vuex";
import { useRouter } from "vue-router";
export default defineComponent({
  name: "ListedRooms",
  setup() {
    const store = useStore();
    const router = useRouter();

    const user = store.state.user;

    if (!user.name || user.type == "user") {
      router.push({ path: "/" });
    }
  },
  components: {
    MyListingsVue,
  },
});
</script>

