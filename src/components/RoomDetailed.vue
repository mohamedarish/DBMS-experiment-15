<template>
  <div class="roomDetails">
    <div class="image-holders">
      <div class="img1" v-if="roomInfo.images.length == 1">
        <div class="first-img" />
      </div>
      <div class="img2" v-else-if="roomInfo.images.length == 2">
        <div class="first-img" />
        <div class="second-img" @click="replaceMain(2)" />
      </div>
      <div class="img3" v-else-if="roomInfo.images.length == 3">
        <div class="first-img" />
        <div class="sub">
          <div class="second-img" @click="replaceMain(2)" />
          <div class="third-img" @click="replaceMain(3)" />
        </div>
      </div>
    </div>
    <div class="address-book">
      <div class="details">
        <div class="row1">
          <div class="name">
            {{ roomInfo.name }}
          </div>
          <div class="rating">{{ roomInfo.rating }} ⭐️</div>
        </div>
        <div class="row2">
          <p>{{ roomInfo.address }}</p>
        </div>
      </div>
      <div class="booker" v-if="!bookFlag">
        <div class="top">
          <div class="listPrice">
            <div class="label">Original Price:</div>
            <div class="OPrice">
              {{ roomInfo.price.toFixed(2) }}
            </div>
          </div>
          <div class="tax">
            <div class="label">Tax (30%)</div>
            <div class="taxAmt">
              {{ (roomInfo.price * 0.3).toFixed(2) }}
            </div>
          </div>
        </div>
        <div class="bottom">
          <div class="total">
            <div class="label">Total</div>
            <div class="totalP">
              {{ (roomInfo.price * 1.3).toFixed(2) }}
            </div>
          </div>
          <div class="payer">
            <button class="pay" @click="triggerBookFlag()">Pay & Book</button>
          </div>
        </div>
      </div>
      <BookingMenu
        :amount="roomInfo.price"
        :hotelID="roomInfo.hotelID"
        v-else
      />
    </div>
    <div class="reviews">
      <div class="review-holder" v-if="reviews.length < 1">No Reviews</div>
      <div class="review-holder" v-else v-for="review in reviews" :key="review">
        <ReviewHolderVue class="review" :review="review" />
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent, ref } from "vue";
import { useRoute } from "vue-router";
import ReviewHolderVue from "./ReviewHolder.vue";
import axios from "axios";
import BookingMenu from "./BookingMenu.vue";

export default defineComponent({
  components: { ReviewHolderVue, BookingMenu },
  async setup() {
    const route = useRoute();

    const roomID = parseInt(route.params.id.slice(1));

    let roomInfo;

    const config = {
      headers: {
        "Content-Type": "application/json",
      },
    };

    const server_url = process.env.VUE_APP_SERVER;

    let reviews = ref([]);

    try {
      const { data } = await axios.post(
        `${server_url}viewreview`,
        {
          roomID,
        },
        config
      );

      if (!data.reviews) {
        throw Error("Reviews not found");
      }

      reviews = data.reviews;
    } catch (error) {
      reviews = ref([]);
    }

    try {
      const { data } = await axios.post(
        `${server_url}oneroom`,
        {
          roomID,
        },
        config
      );

      if (!data.room) {
        throw Error("Room not found");
      }

      roomInfo = data.room;
    } catch (error) {
      roomInfo = ref({
        roomID: 0,
        name: "Not Found",
        description: "Failed to load the room",
        price: -1,
        type: "Not found",
        address: "MissingNo",
        rating: 6,
        number_of_reviews: -1,
        images: [
          "https://static.wikia.nocookie.net/fcoc-vs-battles/images/e/e0/MissingNo.1.png/revision/latest?cb=20200404195127",
        ],
      });
    }

    const replaceMain = ref((num) => {
      const firstImg = ref(document.querySelector(".first-img"));
      const secondImg = ref(document.querySelector(".second-img"));
      const thirdImg = ref(document.querySelector(".third-img"));
      if (num == 2) {
        const tempSrc = secondImg.value.style.backgroundImage;
        secondImg.value.style.backgroundImage =
          firstImg.value.style.backgroundImage;
        firstImg.value.style.backgroundImage = tempSrc;
      } else if (num == 3) {
        const tempSrc = thirdImg.value.style.backgroundImage;
        thirdImg.value.style.backgroundImage =
          firstImg.value.style.backgroundImage;
        firstImg.value.style.backgroundImage = tempSrc;
      }
    });

    return {
      replaceMain,
      reviews,
      roomInfo,
    };
  },
  name: "RoomDetailed",
  mounted() {
    const firstImg = document.querySelector(".first-img");
    const secondImg = document.querySelector(".second-img");
    const thirdImg = document.querySelector(".third-img");

    if (firstImg) {
      firstImg.style.backgroundImage = `url("${this.roomInfo.images[0]}")`;
    }

    if (secondImg) {
      secondImg.style.backgroundImage = `url("${this.roomInfo.images[1]}")`;
    }

    if (thirdImg) {
      thirdImg.style.backgroundImage = `url("${this.roomInfo.images[2]}")`;
    }
  },
  data() {
    return {
      bookFlag: false,
    };
  },
  methods: {
    triggerBookFlag() {
      this.bookFlag = !this.bookFlag;
    },
  },
});
</script>

<style lang="scss" scoped>
.roomDetails {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  .image-holders {
    height: 50vh;
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-bottom: 20px;

    .img1 {
      width: 65%;
      height: 100%;
      border: solid #999 2px;
      padding: 10px;
      margin: 10px 10px 10px 10px;
      display: flex;
      justify-content: center;
      align-items: center;

      .first-img {
        width: 98%;
        height: 98%;
        background-repeat: no-repeat;
        background-size: cover;
      }
    }

    .img2 {
      width: 65%;
      height: 100%;
      border: solid #999 2px;
      padding: 10px;
      margin: 10px 10px 10px 10px;
      display: flex;
      justify-content: center;
      align-items: center;

      .first-img {
        width: 59%;
        height: 100%;
        margin-right: 3px;
        background-repeat: no-repeat;
        background-size: cover;
      }

      .second-img {
        width: 39%;
        height: 100%;
        background-repeat: no-repeat;
        background-size: cover;
      }
    }

    .img3 {
      width: 65%;
      height: 100%;
      border: solid #999 2px;
      padding: 10px;
      margin: 10px 10px 10px 10px;
      display: flex;

      .first-img {
        width: 60%;
        height: 100%;
        background-repeat: no-repeat;
        background-size: cover;
        margin-right: 2px;
      }

      .sub {
        width: 40%;
        .second-img {
          width: 100%;
          height: 50%;
          background-repeat: no-repeat;
          background-size: cover;
          margin-bottom: 2px;
        }

        .third-img {
          width: 100%;
          height: 50%;
          background-repeat: no-repeat;
          background-size: cover;
        }
      }
    }
  }

  .address-book {
    width: 100%;
    height: 40%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-bottom: 12px;

    .details {
      height: 100%;
      width: 40%;
      margin-right: 12px;
      border-radius: 24px;
      padding: 10px;
      display: flex;
      flex-direction: column;
      justify-content: space-evenly;

      .row1 {
        height: 50%;
        width: 100%;
        padding: 10px;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        .name {
          font-size: xx-large;
        }

        .rating {
          font-size: x-large;
        }
      }

      .row2 {
        padding: 10px;
        display: flex;
        width: 100%;
        justify-content: flex-start;
        font-size: x-large;
      }
    }

    .booker {
      border: solid #999 2px;
      height: 100%;
      width: 20%;
      padding: 30px;
      border-radius: 12px;
      display: flex;
      flex-direction: column;
      font-size: larger;
      justify-content: space-between;

      .top {
        .listPrice {
          display: flex;
          flex-direction: row;
          width: 100%;
          justify-content: space-between;
        }

        .tax {
          display: flex;
          flex-direction: row;
          width: 100%;
          justify-content: space-between;
        }
      }

      .bottom {
        height: 50%;
        width: 100%;
        .total {
          display: flex;
          flex-direction: row;
          width: 100%;
          justify-content: space-between;
        }

        .payer {
          width: 100%;
          height: 100%;

          .pay {
            width: 100%;
            height: 5vh;
            border: none;
            border-radius: 15px;
            border: solic #999 2px;
            color: #333;
            font-size: 2vh;
            cursor: pointer;
          }
        }
      }
    }
  }

  .reviews {
    width: 60%;
    display: flex;
    flex-direction: column;

    .review-holder {
      width: 100%;

      .review {
        width: 98%;
      }
    }
  }
}
</style>

