<template>
    <div class="roomDetails">
        <div class="image-holders">
            <img src="https://a0.muscache.com/im/pictures/miso/Hosting-722179355353877964/original/0c5adc5c-5351-4726-9275-0325a2183e1a.jpeg" class="main-image" />
            <div class="sub-holder">
                <div class="sub-image">
                    <img src="https://a0.muscache.com/im/pictures/miso/Hosting-722179355353877964/original/0c5adc5c-5351-4726-9275-0325a2183e1a.jpeg" class="imgur" />
                    <img src="https://a0.muscache.com/im/pictures/miso/Hosting-722179355353877964/original/0c5adc5c-5351-4726-9275-0325a2183e1a.jpeg" class="imgur" />
                </div>
                <div class="sub-image">
                    <img src="https://a0.muscache.com/im/pictures/miso/Hosting-722179355353877964/original/0c5adc5c-5351-4726-9275-0325a2183e1a.jpeg" class="imgur" />
                    <img src="https://a0.muscache.com/im/pictures/miso/Hosting-722179355353877964/original/0c5adc5c-5351-4726-9275-0325a2183e1a.jpeg" class="imgur" />
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
import { defineComponent } from 'vue';
export default defineComponent({
    props: ["RoomInfo", "available"],
    setup(props) {},
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

        .main-image {
            width: 35%;
            height: 100%;
            background: green;
            margin-right: 12px;
            border-radius: 12px;
        }

        .sub-holder {
            width: 25%;
            height: 100%;
            border-radius: 12px;
            display: flex;
            flex-direction: column;

            .sub-image:first-of-type {
                margin-bottom: 12px;
            }

            .sub-image {
                display: flex;
                flex-direction: row;
                width: 100%;
                height: 50%;

                .imgur {
                    width: 50%;
                    height: 100%;
                    margin-right: 12px;
                    border-radius: 12px;
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