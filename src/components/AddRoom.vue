<template>
    <div class="addroom">
        <div v-if="!roomAddFlag" class="newRoom" @click="triggerAddFlag()">
            <div class="addSymbol"></div>
            <div class="labelText">Add a new Room</div>
        </div>
        <div v-else class="roomForm">
            <form>
                <p>Image 1</p>
                <input type="text" name="image1" id="img1" class="userInfo" required />

                <p>Image 2</p>
                <input type="text" name="image2" id="img2" class="userInfo" />

                <p>Image 3</p>
                <input type="text" name="image3" id="img3" class="userInfo" />

                <p>Room Type</p>
                <input type="text" name="type" id="type" class="userInfo" required/>

                <p>Room Desctiption</p>
                <textarea name="description" id="description" cols="30" rows="10" class="userInfo" required />

                <p>Room Type</p>
                <input type="text" name="type" id="type" class="userInfo">

                <p>Quoted Price</p>
                <input type="number" name="price" id="price" class="userInfo" required />

                <input type="submit" value="Submit" id="submit" @click="triggerAddFlag()"/>
            </form>
        </div>
    </div>
</template>
  
<script>
import { defineComponent, ref } from "vue";
export default defineComponent({
    name: "AddRoom",
    setup() {
        const roomAddFlag = ref(false);

        const triggerAddFlag  = ref(() => {
            roomAddFlag.value = !roomAddFlag.value;
        })

        return {
            roomAddFlag,
            triggerAddFlag
        }
    }
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
            background-color: #82500A;
            color: #ccc;
            font-size: 3vh;
        }
    }
}
</style>