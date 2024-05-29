<template>
  <div class="bookingHolder">
    <div class="header-text">Currently booked</div>
    <div v-if="bookedRooms.length < 1">No Bookings :(</div>
    <div v-else>
      <div v-for="room in bookedRooms" :key="room">
        <BookedListingVue :bookingInfo="room" />
      </div>
    </div>

    <div class="header-text">Previous Bookings</div>
    <div v-if="oldRooms.length < 1">No Bookings :(</div>
    <div v-else>
      <div v-for="old in oldRooms" :key="old">
        <PreviousListingVue :bookingInfo="old" />
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { defineComponent, ref } from "vue";
import { useStore } from "vuex";
import BookedListingVue from "./BookedListing.vue";
import PreviousListingVue from "./PreviousListing.vue";
export default defineComponent({
  async setup() {
    const config = {
      headers: {
        "Content-Type": "application/json",
      },
    };

    let oldRooms;
    let bookedRooms;

    const server_url = process.env.VUE_APP_SERVER;

    const store = useStore();

    const user = store.state.user;

    try {
      const { data } = await axios.post(
        `${server_url}oldbookings`,
        {
          customerID: user.id,
          currentDate: new Date(),
        },
        config
      );
      if (!data.rooms) {
        throw Error("No listings");
      }
      oldRooms = ref(data.rooms);
    } catch (_error) {
      oldRooms = ref([]);
    }

    try {
      const { data } = await axios.post(
        `${server_url}currentbookings`,
        {
          customerID: user.id,
          currentDate: new Date(),
        },
        config
      );

      if (!data.rooms) {
        throw Error("No listings");
      }

      bookedRooms = ref(data.rooms);
    } catch (_error) {
      bookedRooms = ref([]);
    }

    return {
      bookedRooms,
      oldRooms,
    };
  },
  name: "ViewBookings",
  components: {
    BookedListingVue,
    PreviousListingVue,
  },
});
</script>

<style lang="scss" scoped>
.bookingHolder {
  margin: 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  .header-text {
    font-size: xx-large;
    width: 60%;
    margin: 10px;
    border-bottom: solid #666 1px;
  }
}
</style>

