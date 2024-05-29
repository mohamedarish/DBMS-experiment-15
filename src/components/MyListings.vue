<template>
  <div class="listings" v-if="listedRooms.length < 1">
    <div class="noListing">No listings added yet yet</div>
    <AddRoomVue />
  </div>
  <div class="listings" v-else>
    <div v-for="listing in listedRooms" :key="listing">
      <HotelListingVue :roomInfo="listing" />
    </div>
    <AddRoomVue />
  </div>
</template>

<script>
import { defineComponent } from "vue";
import HotelListingVue from "./HotelListing.vue";
import AddRoomVue from "./AddRoom.vue";
import { useStore } from "vuex";
import axios from "axios";

export default defineComponent({
  name: "MyListings",
  async setup() {
    const config = {
      headers: {
        "Content-Type": "application/json",
      },
    };

    const server_url = process.env.VUE_APP_SERVER;

    const store = useStore();

    const user = store.state.user;

    let listedRooms;

    try {
      const { data } = await axios.post(
        `${server_url}myrooms`,
        {
          hotelID: user.id,
        },
        config
      );

      listedRooms = data.rooms;
    } catch (_error) {
      listedRooms = [];
    }

    return {
      listedRooms,
    };
  },
  components: {
    HotelListingVue,
    AddRoomVue,
  },
});
</script>

<style lang="scss" scoped>
.noListing {
  width: 60%;
  margin: 10px;
  padding: 10px;
}

.listings {
  display: flex;
  flex-direction: column;
  width: 100%;
  align-items: center;
  height: 100vh;
  padding-top: 20px;
}
</style>

