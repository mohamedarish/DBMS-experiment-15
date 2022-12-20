<template>
    <div class="listing">
        <div class="main-image" :id="roomInfo.id"></div>
        <div class="details-holder">
            <div class="name-rating">
                <div class="hotel-name">{{ roomInfo.name }}</div>
                <div class="rating">
                    {{ roomDetails.rating }} ★ <p>x reviews</p>
                </div>
            </div>
            <div class="type-address">
                <div class="type">{{ roomInfo.type }}</div>
                <div class="address">{{ roomInfo.address }}</div>
            </div>
            <div class="price-booking">
                <div class="price">{{ roomInfo.price }}</div>
                <button class="book">Book Now</button>
            </div>
        </div>
    </div>
</template>

<script>
import { defineComponent, onMounted, ref } from 'vue';
export default defineComponent({
    props: ["roomInfo", "booked", "manager"],
    setup(props) {
        const makePopupAppear = ref(false);
        const leaveReview = ref(false);
        const confirmRemove = ref(false);
        console.log(props.roomInfo);
        const roomDetails = ref(props.roomInfo);
        console.log(roomDetails.value);

        const triggerPopUp = ref(() => {
            makePopupAppear.value = !makePopupAppear.value;
        })

        const triggerReview = ref(() => {
            leaveReview.value = !leaveReview.value;
        })

        const triggerConfirm = ref(() => {
            confirmRemove.value = !confirmRemove.value;
        })


        onMounted(() => {
            const img_holder = ref(document.querySelectorAll(".main-image"));

            img_holder.value.forEach(entry => {
                if (entry.id.includes(props.roomInfo.id.toString())) {
                    entry.style.backgroundImage = `url("${ props.roomInfo.images[0] }")`
                }
            })
        });

        return {
            makePopupAppear,
            triggerPopUp,
            leaveReview,
            triggerReview,
            confirmRemove,
            triggerConfirm,
            roomDetails
        }

    },
    name: "SingleListing"
});
</script>

<style lang="scss" scoped>
.listing {
    height: 15vh;
    width: 60%;
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
                background: #82500A;
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

            .book {
                background: #82500A;
                color: #fff;
                padding: 7px;
                border: none;
                font-size: x-large;
            }
        }
    }
}
</style>