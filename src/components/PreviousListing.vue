<template>
  <div class="listing" v-if="!leaveReview">
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
        <button class="rate" @click="triggerReview()">Rate Now</button>
      </div>
    </div>
  </div>
  <form class="ratingbox" v-on:submit.prevent v-else>
    <div class="stars">
      <input
        type="checkbox"
        name="1"
        id="one"
        class="star"
        @change="handleRating(1)"
      />
      <label for="one"></label>
      <input
        type="checkbox"
        name="2"
        id="two"
        class="star"
        @change="handleRating(2)"
      />
      <label for="two"></label>
      <input
        type="checkbox"
        name="3"
        id="three"
        class="star"
        @change="handleRating(3)"
      />
      <label for="three"></label>
      <input
        type="checkbox"
        name="4"
        id="four"
        class="star"
        @change="handleRating(4)"
      />
      <label for="four"></label>
      <input
        type="checkbox"
        name="5"
        id="five"
        class="star"
        @change="handleRating(5)"
      />
      <label for="five"></label>
    </div>

    <input type="text" name="title" id="title" v-model="title" />

    <textarea name="review" id="review" cols="70" rows="2" v-model="review" />

    <input
      type="button"
      value="Submit"
      id="submit-review"
      @click="makeReview()"
    />
  </form>
</template>

<script>
import axios from "axios";
import { defineComponent, onMounted, ref } from "vue";
import { RouterLink, useRouter } from "vue-router";
import { useStore } from "vuex";
export default defineComponent({
  props: ["bookingInfo"],
  setup(props) {
    const leaveReview = ref(false);

    const store = useStore();
    const user = store.state.user;
    const router = useRouter();

    const config = {
      headers: {
        "Content-Type": "application/json",
      },
    };

    let rating = ref(0);
    let review = ref("");
    let title = ref("");

    const server_url = process.env.VUE_APP_SERVER;

    const triggerReview = ref(async () => {
      leaveReview.value = !leaveReview.value;
    });

    const roomLink = ref(`./room:${props.bookingInfo.roomID}`);

    onMounted(() => {
      const img_holder = ref(document.querySelectorAll(".main-image"));

      img_holder.value.forEach((entry) => {
        if (entry.id.includes(props.bookingInfo.bookingID.toString())) {
          entry.style.backgroundImage = `url("${props.bookingInfo.image}")`;
        }
      });
    });

    const handleRating = ref((num) => {
      const ratingHolders = document.querySelectorAll(".star");

      rating = ref(6 - num);

      for (let i = 0; i < ratingHolders.length; i += 1) {
        if (i != num - 1) {
          ratingHolders[i].checked = false;
        } else {
          ratingHolders[i].checked = true;
        }
      }
    });

    const makeReview = ref(async () => {
      if (rating.value < 1 || title.value.length < 1) return;

      try {
        const { data } = await axios.post(
          `${server_url}createreview`,
          {
            customerID: user.id,
            roomID: props.bookingInfo.roomID,
            title: title.value,
            description: review.value,
            review: rating.value,
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

    return {
      leaveReview,
      triggerReview,
      roomLink,
      rating,
      review,
      handleRating,
      title,
      makeReview,
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

      .rate {
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

.ratingbox {
  height: 20vh;
  width: 60vw;
  display: flex;
  flex-direction: column;
  padding: 10px;
  margin: 10px;
  border: solid #777 2px;
  border-radius: 4px;
  justify-content: center;
  align-items: center;

  .stars {
    position: relative;
    display: inline-block;
    border: none;
    font-size: 14px;
    margin: 10px auto;

    input {
      border: 0;
      width: 1px;
      height: 1px;
      overflow: hidden;
      position: absolute !important;
      clip: rect(1px 1px 1px 1px);
      clip: rect(1px, 1px, 1px, 1px);
      opacity: 0;
    }

    label {
      position: relative;
      float: right;
      color: #c8c8c8;
    }

    label:before {
      content: "\2605";
      display: inline-block;
      font-size: 2vh;
      color: #ccc;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    input:checked ~ label:before {
      color: #ffc107;
    }

    label:hover ~ label:before {
      color: #ffdb70;
    }

    label:hover:before {
      color: #ffc107;
    }
  }

  #review,
  #title {
    border: none;
    border-bottom: solid #777 2px;
    padding: 5px;
    margin-bottom: 10px;
    width: 70%;

    &:focus {
      outline: none;
      border: solid #777 2px;
      border-radius: 5px;
    }
  }

  #submit-review {
    width: 20%;
    height: 30px;
    background-color: #82500a;
    color: #c8c8c8;
    outline: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
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

