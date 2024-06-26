<template>
  <div class="listing">
    <div class="main-image" :id="roomInfo.roomID"></div>
    <div class="details-holder">
      <div class="name-rating">
        <div class="hotel-name">{{ roomInfo.name }}</div>
        <div class="rating" :id="roomInfo.roomID">
          {{ roomInfo.rating }} ★
          <p>
            {{
              roomInfo.number_of_reviews ? roomInfo.number_of_reviews : "no"
            }}
            reviews
          </p>
        </div>
      </div>
      <div class="type-address">
        <div class="type">{{ roomInfo.type }}</div>
        <div class="address">{{ roomInfo.address }}</div>
      </div>
      <div class="price-booking">
        <div class="price">{{ roomInfo.price }}</div>
        <button class="remove" @click="removeListing()">Remove Listing</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { defineComponent, onMounted, ref } from "vue";
import { useRouter } from "vue-router";
export default defineComponent({
  props: ["roomInfo"],
  setup(props) {
    const makePopupAppear = ref(false);
    const leaveReview = ref(false);
    const confirmRemove = ref(false);

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

    const removeListing = ref(async () => {
      const config = {
        headers: {
          "Content-Type": "application/json",
        },
      };

      try {
        const server_url = process.env.VUE_APP_SERVER;

        const { data } = await axios.post(
          `${server_url}removeroom`,
          {
            roomID: props.roomInfo.roomID,
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
      const rating_box = ref(document.querySelectorAll(".rating"));

      img_holder.value.forEach((entry) => {
        if (entry.id.includes(props.roomInfo.roomID.toString())) {
          entry.style.backgroundImage = `url("${props.roomInfo.image}")`;
        }
      });

      rating_box.value.forEach((entry) => {
        if (entry.id.includes(props.roomInfo.roomID.toString())) {
          if (props.roomInfo.rating > 3) {
            entry.style.backgroundColor = "green";
          } else if (props.roomInfo.rating > 2) {
            entry.style.backgroundColor = "yellow";
          } else {
            entry.style.backgroundColor = "red";
          }
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
      removeListing,
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
        background: #82500a;
        color: #fff;
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

      .remove {
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
</style>

