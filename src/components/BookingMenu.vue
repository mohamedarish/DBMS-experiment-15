<template>
    <form v-on:submit.prevent>
        <p>CheckIn Date</p>
        <input type="date" name="checkIn" id="checkIn" class="userInput" v-model="checkIn"/>

        <p>Checkout Date</p>
        <input type="date" name="checkOut" id="checkOut" class="userInput" v-model="checkOut"/>

        <input type="submit" value="Book Room" class="userInput" id="book" @click="makeBooking()"/>
    </form>
</template>

<script>
import axios from 'axios';
import { defineComponent, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { useStore } from 'vuex';
export default defineComponent({
    props: ["amount", "hotelID"],
    name: "BookingMenu",
    setup(props) {
        const checkIn = ref("");
        const checkOut = ref("");
        const route = useRoute();
        const store = useStore();
        const router = useRouter();

        const roomID = parseInt(route.params.id.slice(1))
        const user = store.state.user;

        const makeBooking = ref(async () => {
            const config = {
                headers: {
                    "Content-Type": "application/json",
                },
            }

            try {
                const server_url = process.env.VUE_APP_SERVER;

                const { data } = await axios.post(`${ server_url }bookroom`, {
                    roomID: roomID,
                    customerID: user.id,
                    paymentDate: new Date(),
                    checkinDate: new Date(checkIn.value),
                    checkoutDate: new Date(checkOut.value),
                    amount: props.amount,
                    hotelID: props.hotelID,
                }, config);

                if (!data) return;

                if (data.report) {
                    router.push("bookings");
                }
            } catch (_error) {
                return;
            }
        });

        return {
            checkIn,
            checkOut,
            makeBooking
        }
    },
})
</script>

<style lang="scss" scoped>
form {
    border: solid #999 2px;
    height: 100%;
    width: 20%;
    padding: 30px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    p {
        width: 70%;
        height: 10%;
        display: flex;
        align-items: flex-start;
        justify-content: flex-start;
        margin-bottom: 10px;
    }

    .userInput {
        padding: 5px;
        background-color: #eee;
        border: none;
        border-bottom: solid #777 0.2px;
        width: 100%;
        height: 15%;
        margin-bottom: 10px;
        font-size: 2vh;
        box-decoration-break: none;
        outline: none;
        border-radius: 4px;
    }

    #book {
        background-color: #82500A;
        color: #ccc;
        cursor: pointer;
    }
}
</style>