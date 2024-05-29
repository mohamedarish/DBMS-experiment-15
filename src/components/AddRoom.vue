<template>
  <div class="addroom">
    <div v-if="!roomAddFlag" class="newRoom" @click="triggerAddFlag()">
      <div class="addSymbol"></div>
      <div class="labelText">Add a new Room</div>
    </div>
    <div v-else class="roomForm">
      <form v-on:submit.prevent>
        <p>Image 1</p>
        <input
          type="text"
          name="image1"
          id="img1"
          class="userInfo"
          required
          v-model="img1"
        />

        <p>Image 2</p>
        <input
          type="text"
          name="image2"
          id="img2"
          class="userInfo"
          v-model="img2"
        />

        <p>Image 3</p>
        <input
          type="text"
          name="image3"
          id="img3"
          class="userInfo"
          v-model="img3"
        />

        <p>Room Type</p>
        <input
          type="text"
          name="type"
          id="type"
          class="userInfo"
          required
          v-model="type"
        />

        <p>Room Description</p>
        <textarea
          name="description"
          id="description"
          cols="30"
          rows="10"
          class="userInfo"
          required
          v-model="description"
        />

        <p>Quoted Price</p>
        <input
          type="number"
          name="price"
          id="price"
          class="userInfo"
          required
          v-model="price"
        />

        <Transition name="invalid">
          <p id="invalidReq" v-if="invalidReq">Invalid Information Provided</p>
        </Transition>

        <input type="submit" value="Submit" id="submit" @click="addRoom()" />
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { defineComponent, ref } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
export default defineComponent({
  name: "AddRoom",
  setup() {
    const roomAddFlag = ref(false);
    const img1 = ref("");
    const img2 = ref("");
    const img3 = ref("");

    const type = ref("");
    const description = ref("");
    const price = ref(0);

    const invalidReq = ref(false);

    const store = useStore();

    const user = store.state.user;

    const triggerAddFlag = ref(() => {
      roomAddFlag.value = !roomAddFlag.value;
    });

    const router = useRouter();

    const addRoom = ref(async () => {
      if (!img1.value || !type.value || !description.value || !price) {
        invalidReq.value = true;
        return;
      }

      const config = {
        headers: {
          "Content-Type": "application/json",
        },
      };

      try {
        const server_url = process.env.VUE_APP_SERVER;

        const images = [img1.value];

        if (img2.value) {
          images.push(img2.value);
        }
        if (img3.value) {
          images.push(img3.value);
        }

        const { data } = await axios.post(
          `${server_url}addroom`,
          {
            description: description.value,
            price: price.value,
            type: type.value,
            hotelID: user.id,
            images,
          },
          config
        );

        if (!data) return;
        if (!data.report) {
          invalidReq.value = true;
          return;
        } else {
          roomAddFlag.value = !roomAddFlag.value;
          router.go();
        }
      } catch (_error) {
        invalidReq.value = true;
        return;
      }
    });

    return {
      roomAddFlag,
      triggerAddFlag,
      img1,
      img2,
      img3,
      type,
      description,
      price,
      invalidReq,
      addRoom,
    };
  },
});
</script>

<style lang="scss" scoped>
.addroom {
  width: 60vw;
  margin: 10px;

  .newRoom {
    height: 40px;
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    background-color: #ccc;
    border-radius: 5px;

    .addSymbol {
      background-image: url("../assets/add.png");
      background-repeat: no-repeat;
      background-size: contain;
      height: 30px;
      width: 30px;
      margin-right: 12px;
    }

    .labelText {
      font-size: larger;
    }
  }

  .roomForm {
    border: solid #777 2px;
    padding: 5%;
    display: flex;
    flex-direction: row;
    justify-content: center;

    p {
      display: flex;
      align-items: flex-end;
      justify-content: flex-start;
    }

    .userInfo {
      background-color: #eee;
      border: none;
      border-bottom: solid #777 0.2px;
      width: 100%;
      height: 7%;
      font-size: 2vh;
      box-decoration-break: none;
      outline: none;
      margin-bottom: 9px;
      padding: 5px;
      border-radius: 8px;
    }

    #description {
      height: 21%;
    }

    .userInfo:focus {
      border-bottom: solid #555 0.4px;
      transition: all 0.5s ease-in-out;
      background: #ddd;
    }

    #submit {
      width: 100%;
      border-radius: 8px;
      height: 8%;
      background-color: #82500a;
      color: #ccc;
      font-size: 3vh;
      cursor: pointer;
    }

    #invalidReq {
      color: red;
      margin-bottom: 12px;
    }

    .invalid-enter-from {
      opacity: 0;
      transform: translateY(-30px);
    }

    .invalid-enter-active {
      transition: all 0.3s ease-out;
    }

    .invalid-leave-to {
      opacity: 0;
      transform: translateY(30px);
    }

    .invalid-leave-active {
      transition: all 0.3s ease-in;
    }
  }
}
</style>

