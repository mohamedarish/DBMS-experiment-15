<template>
    <div class="roomDetails">
        <div class="image-holders">
            <div class="img1" v-if="roomInfo.images.length == 1">
                <img class="first-img" />
            </div>
            <div class="img2" v-else-if="roomInfo.images.length == 2">
                <img class="first-img" />
                <img class="second-img" @click="replaceMain(2)"/>
            </div>
            <div class="img3" v-else-if="roomInfo.images.length == 3">
                <img :src="roomInfo.images[0]" class="first-img" />
                <div class="sub">
                    <div class="second-img" @click="replaceMain(2)"/>
                    <img class="third-img" @click="replaceMain(3)"/>
                </div>
            </div>
        </div>
        <div class="address-book">
            <div class="details"></div>
            <div class="booker"></div>
        </div>
        <div class="reviews">
            <div class="review-holder"></div>
        </div>
    </div>
</template>

<script>
import { defineComponent, onMounted, ref } from 'vue';
export default defineComponent({
    props: ["roomInfo", "available"],
    setup(props) {
        let firstImg = ref(null);
        let secondImg = ref(null);
        let thirdImg = ref(null);


        const replaceMain = ref((num) => {
            if (num == 2) {
                const tempSrc = secondImg.value.style.backgroundImage;
                secondImg.value.style.backgroundImage = firstImg.value.style.backgroundImage;
                firstImg.value.style.backgroundImage = tempSrc;
            } else if (num == 3) {
                const tempSrc = thirdImg.value.style.backgroundImage;
                thirdImg.value.style.backgroundImage = firstImg.value.style.backgroundImage;
                firstImg.value.style.backgroundImage = tempSrc;
            }
        })

        onMounted(() => {
            firstImg = ref(document.querySelector(".first-img"));
            secondImg = ref(document.querySelector(".second-img"));
            thirdImg = ref(document.querySelector(".third-img"));

            if (firstImg.value) {
                firstImg.value.style.backgroundImage = `url("${props.roomInfo.images[0]}")`;
            }

            if (secondImg.value) {
                secondImg.value.style.backgroundImage = `url("${props.roomInfo.images[1]}")`;
            }

            if (thirdImg.value) {
                thirdImg.value.style.backgroundImage = `url("${props.roomInfo.images[2]}")`;
            }
        })

        return {
            replaceMain
        }
    },
    name: "RoomDetailed"
})
</script>

<style lang="scss" scoped>
.roomDetails {
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;

    .image-holders {
        height: 50%;
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: center;
        margin-bottom: 12px;

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
            background: gray;
            border-radius: 24px;
        }

        .booker {
            background: pink;
            height: 100%;
            width: 20%;
            border-radius: 24px;
        }
    }

    .reviews {
        height: 40%;
        width: 100%;
        display: flex;
        justify-content: center;

        .review-holder {
            background: cyan;
            height: 100%;
            width: 60%;
            border-radius: 24px;
        }
    }
}
</style>