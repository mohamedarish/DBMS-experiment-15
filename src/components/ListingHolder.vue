<template>
  <div v-if="listings.length < 1">No Listings Currently Available</div>
  <div class="listings" v-else>
    <div v-for="room in listings" :key="room">
      <SingleListing :roomInfo="room" />
    </div>
  </div>
</template>

<script>
import { defineComponent, ref } from "vue";
import SingleListing from "./SingleListing.vue";
import axios from "axios";
export default defineComponent({
  async setup() {
    const config = {
      headers: {
        "Content-Type": "application/json",
      },
    };

    const server_url = process.env.VUE_APP_SERVER;

    let listings;

    try {
      const { data } = await axios.post(`${server_url}allrooms`, {}, config);

      if (!data.rooms) {
        throw Error("No listings");
      }

      listings = ref(data.rooms);
    } catch (error) {
      listings = ref([]);
    }

    // const listings = ref([
    //     {
    //         id: 12,
    //         name: "Aussie-innit",
    //         description: "It's australia innit?",
    //         price: "6",
    //         type: "Single Mouse",
    //         address: "New Zealand",
    //         rating: 2,
    //         number_of_reviews: 6000,
    //         images: ["https://pix10.agoda.net/hotelImages/124/1246280/1246280_16061017110043391702.jpg", "https://www.ohotelsindia.com/pune/images/b32d5dc553ee2097368bae13f83e93cf.jpg"]
    //     },
    //     {
    //         id: 1979,
    //         name: "French🤢",
    //         description: "It's France🤮 baguette?",
    //         price: "-6",
    //         type: "MultiCuisine",
    //         address: "France 🤮🤮🤮",
    //         rating: 1,
    //         number_of_reviews: 40000,
    //         images: ["https://www.goseewrite.com/wp-content/uploads/2011/01/bad-manangue-hotel.jpg"]
    //     }
    // ]);

    return {
      listings,
    };
  },
  components: { SingleListing },
  name: "ListingHolder",
});
</script>

<style lang="scss" scoped>
.listings {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}
</style>

