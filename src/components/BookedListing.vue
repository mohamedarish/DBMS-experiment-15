<template>
  <div class="listing">
    <div class="main-image" :id="bookingInfo.bookingID"></div>
    <div class="details-holder">
      <div class="name-rating">
        <RouterLink :to="roomLink">
          <div class="hotel-name">{{ bookingInfo.name }}</div>
        </RouterLink>
        <div class="rating" :id="bookingInfo.bookingID">
          {{ bookingInfo.checkinDate.slice(0, 10) }}
        </div>
      </div>
      <div class="type-address">
        <div class="type">{{ bookingInfo.type }}</div>
        <div class="address">{{ bookingInfo.address }}</div>
      </div>
      <div class="price-booking">
        <div class="price">{{ bookingInfo.checkoutDate.slice(0, 10) }}</div>
        <button class="cancel" @click="cancelBooking()">Cancel Booking</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { defineComponent, onMounted, ref } from "vue";
import { useRouter } from "vue-router";
import { RouterLink } from "vue-router";
export default defineComponent({
  props: ["bookingInfo"],
  setup(props) {
    const makePopupAppear = ref(false);
    const leaveReview = ref(false);
    const confirmRemove = ref(false);

    const roomLink = ref(`./room:${props.bookingInfo.roomID}`);

    const triggerPopUp = ref(() => {
      makePopupAppear.value = !makePopupAppear.value;
    });

    const triggerReview = ref(() => {
      leaveReview.value = !leaveReview.value;
    });

    const triggerConfirm = ref(() => {
      confirmRemove.value = !confirmRemove.value;
    });

    const router = useRouter();

    const cancelBooking = ref(async () => {
      const config = {
        headers: {
          "Content-Type": "application/json",
        },
      };

      try {
        const server_url = process.env.VUE_APP_SERVER;

        const { data } = await axios.post(
          `${server_url}cancelbooking`,
          {
            bookingID: props.bookingInfo.bookingID,
          },
          config
        );

        if (!data) return;

        if (data.report) {
          router.go();
        }
      } catch (_error) {
        return;
      }
    });

    onMounted(() => {
      const img_holder = ref(document.querySelectorAll(".main-image"));

      img_holder.value.forEach((entry) => {
        if (entry.id.includes(props.bookingInfo.bookingID.toString())) {
          entry.style.backgroundImage = `url("${props.bookingInfo.image}")`;
        }
      });
    });

    return {
      makePopupAppear,
      triggerPopUp,
      leaveReview,
      triggerReview,
      confirmRemove,
      triggerConfirm,
      cancelBooking,
      roomLink,
    };
  },
  name: "SingleListing",
});
</script>

<style lang="scss" scoped>
.listing {
  height: 15vh;
  width: 60vw;
  display: flex;
  flex-direction: row;
  padding: 10px;
  margin: 10px;
  border: solid #777 2px;
  border-radius: 4px;
  .main-image {
    background-repeat: no-repeat;
    background-size: cover;
    height: 100%;
    width: 20%;
  }

  .details-holder {
    height: 100%;
    width: 80%;
    padding: 10px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;

    .name-rating {
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      .hotel-name {
        font-size: 4vh;
      }

      .rating {
        width: max-content;
        padding: 4px;
        height: ma;
        border-radius: 5px;

        p {
          font-size: small;
        }
      }
    }

    .type-address {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      .type {
        font-size: large;
      }

      .address {
        font-size: large;
      }
    }

    .price-booking {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      .price {
        font-size: x-large;
      }

      .cancel {
        background-color: #82500a;
        color: #fff;
        padding: 7px;
        border: none;
        font-size: x-large;
        cursor: pointer;
      }
    }
  }
}

a {
  text-decoration: none;

  &:visited {
    text-decoration: none;
    color: #2c3e50;
  }
}
</style>

