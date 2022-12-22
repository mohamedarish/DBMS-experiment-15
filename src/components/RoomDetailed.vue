<template>
    <div class="roomDetails">
        <div class="image-holders">
            <div class="img1" v-if="roomInfo.images.length == 1">
                <div class="first-img" />
            </div>
            <div class="img2" v-else-if="roomInfo.images.length == 2">
                <div class="first-img" />
                <div class="second-img" @click="replaceMain(2)"/>
            </div>
            <div class="img3" v-else-if="roomInfo.images.length == 3">
                <div class="first-img" />
                <div class="sub">
                    <div class="second-img" @click="replaceMain(2)"/>
                    <div class="third-img" @click="replaceMain(3)"/>
                </div>
            </div>
        </div>
        <div class="address-book">
            <div class="details">
                <div class="row1">
                    <div class="name">
                        {{ roomInfo.name }}
                    </div>
                    <div class="rating">
                        {{ roomInfo.rating }} ⭐️
                    </div>
                </div>
                <div class="row2">
                    <p>{{ roomInfo.address }}</p>
                </div>
            </div>
            <div class="booker">
                <div class="top">
                    <div class="listPrice">
                        <div class="label">
                            Original Price:
                        </div>
                        <div class="OPrice">
                            {{ parseInt(roomInfo.price.split()[0]) }}
                        </div>
                    </div>
                    <div class="tax">
                        <div class="label">
                            Tax (30%)
                        </div>
                        <div class="taxAmt">
                            {{ (parseInt(roomInfo.price.split()[0]) * 0.3).toFixed(2) }}
                        </div>
                    </div>
                </div>
                <div class="bottom">
                    <div class="total">
                        <div class="label">
                            Total
                        </div>
                        <div class="totalP">
                            {{ (parseInt(roomInfo.price.split()[0]) * 1.3).toFixed(2) }}
                        </div>
                    </div>
                    <div class="booker">
                        <button class="pay" @click="triggerBook()">Pay & Book</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="reviews">
            <div class="review-holder" v-for="review in reviews" :key="review">
                <ReviewHolderVue class="review" :review="review"/>
            </div>
        </div>
    </div>
</template>

<script>
import { defineComponent, onMounted, ref } from 'vue';
import { useRouter } from 'vue-router';
import ReviewHolderVue from './ReviewHolder.vue';
export default defineComponent({
    components: { ReviewHolderVue },
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

        const reviews = ref([
            {
                id: 1,
                rate: 2,
                head: "bad",
                content: "very bad",
                user: "anon"
            },
            {
                id: 2,
                rate: 4,
                head: "ok",
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent lacinia venenatis imperdiet. Aliquam erat volutpat. Aenean tempus velit turpis. Ut sagittis, diam et accumsan imperdiet, ipsum diam viverra nibh, luctus sagittis risus ex at dolor. Fusce nunc leo, posuere eget enim pellentesque, dignissim accumsan leo. Aliquam eleifend odio quam, id efficitur orci pretium ac. Phasellus maximus ac leo sed egestas.\
Donec quis metus et eros eleifend ullamcorper pharetra id nulla. In ac lorem magna. Aenean pharetra metus nunc, id malesuada ex auctor a. Sed eu viverra enim, vitae mollis nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus mollis nec mauris et aliquam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur sodales lacus non mi interdum, a euismod quam sodales. Pellentesque accumsan consectetur mauris eu posuere. Nulla commodo enim ac orci malesuada venenatis.\
Nullam volutpat fermentum purus non pellentesque. Fusce pretium lorem purus, vitae scelerisque tortor laoreet quis. Mauris nibh sem, aliquam eget nulla quis, accumsan auctor velit. Suspendisse porta blandit elit, at ullamcorper ex egestas et. Etiam pellentesque felis at purus gravida placerat. Sed hendrerit ut enim non sodales. Donec eu lectus auctor, pretium velit eu, convallis mi.\
Proin ut malesuada turpis. In et luctus est. Maecenas est lectus, lacinia tempus turpis ut, imperdiet mollis risus. Etiam ut erat sed odio aliquet pellentesque nec at elit. Pellentesque ultricies lacus sit amet dui scelerisque congue. Sed ac placerat mi, et rhoncus nibh. Curabitur ut justo ac nulla blandit gravida non id quam. Nulla sagittis et nisi ut gravida. Mauris lacinia dui a neque consequat scelerisque nec vitae mi. Vestibulum tincidunt ipsum et est faucibus, eu dictum lorem consectetur. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam ultrices ligula at neque tincidunt porttitor. Praesent pellentesque vestibulum mauris, eget placerat odio feugiat vel. Vivamus congue, odio nec porttitor dapibus, velit quam ornare mi, sed ullamcorper sapien nisl ac velit. Etiam lacinia consequat ultricies. Aliquam fermentum ligula diam, quis pretium urna congue quis.\
Maecenas sit amet dignissim elit. Donec in leo sit amet arcu ullamcorper accumsan. Aenean porttitor ante imperdiet leo interdum aliquet. Aenean in dui lacinia, egestas libero in, sagittis risus. Fusce commodo imperdiet lorem sed scelerisque. Mauris sit amet enim at risus pellentesque sodales a eu libero. Fusce nec ante non nunc gravida congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis tellus in molestie tempor. Nam vulputate congue urna. Quisque sit amet consectetur ligula. Proin id odio eu arcu accumsan vehicula. Quisque semper blandit massa sit amet facilisis. Aenean bibendum vel lacus vel cursus.",
                user: "not anon"
            },
            {
                id: 3,
                rate: 5,
                head: "nice",
                content: "It's a nice hotel",
                user: "Very anon"
            },
            {
                id: 4,
                rate: 1,
                head: "very bad",
                content: "Vey bad hotel",
                user: "cool person"
            },
            {
                id: 5,
                rate: 3,
                head: "sub-par",
                content: "It's just below okay but not very bad",
                user: "guy"
            }
        ])

        const router = useRouter();

        const triggerBook = ref(() => {
            router.push("bookings")
        })

        return {
            replaceMain,
            triggerBook,
            reviews
        }
    },
    name: "RoomDetailed"
})
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
            background-color: antiquewhite;
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
            background: pink;
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

                .booker {
                    width: 100%;
                    height: 100%;

                    .pay {
                        width: 100%;
                        height: 5vh;
                        border: none;
                        border-radius: 15px;
                        background: #82500A;
                        color: #fff;
                        font-size: 2vh;
                    }
                }
            }
        }
    }

    .reviews {
        background-color: #bee;
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