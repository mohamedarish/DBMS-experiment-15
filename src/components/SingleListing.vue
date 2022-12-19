<template>
    <div class="listing" v-if="!makePopupAppear">
        <div v-if="!booked && !manager">
            <h3 class="heading">{{ roomInfo.name }}</h3>
            <p class="description">{{ roomInfo.descriptiom }}</p>
            <h3 class="price">{{ roomInfo.price }}</h3>
            <p class="type">{{ roomInfo.type }}</p>
            <p class="address">{{ roomInfo.address }}</p>
            <button @click="triggerPopUp()">Book Now</button>
        </div>
        <div v-else-if="!manager">
            <div v-if="!leaveReview">
                <h3 class="heading">{{ roomInfo.name }}</h3>
                <p class="description">{{ roomInfo.descriptiom }}</p>
                <h3 class="price">{{ roomInfo.price }}</h3>
                <p class="type">{{ roomInfo.type }}</p>
                <p class="address">{{ roomInfo.address }}</p>
                <button @click="triggerPopUp()">Cancel</button>
                <button @click="triggerReview()">Add a review</button>
            </div>
            <div v-else>
                <div class="rating">
                    <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                    <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label>
                    <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                    <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                    <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                </div>
                <label for="details">Details</label>
                <input type="text" name="details" id="details" placeholder="(optional)"/>

                <button @click="triggerReview()">Submit</button>
                <button @click="triggerReview()">Cancel</button>
            </div>
        </div>
        <div v-else>
            <div v-if="!confirmRemove">
                <p class="description">{{ roomInfo.descriptiom }}</p>
                <h3 class="price">{{ roomInfo.price }}</h3>
                <p class="type">{{ roomInfo.type }}</p>
                <p class="address">{{ roomInfo.address }}</p>
                <button @click="triggerConfirm">Remove Listing</button>
            </div>
            <div v-else>
                <p class="id">{{ roomInfo.id }}</p>
                <button @click="triggerConfirm">I am Sure</button>
            </div>
        </div>
    </div>
    <div class="confirmation" v-else>
        <p class="id">{{ roomInfo.id }}</p>

        <div v-if="!booked">
            <label for="date">Date</label>
            <input type="date" name="date" id="date" />

            <button @click="triggerPopUp()">Book</button>
            <button @click="triggerPopUp()">Cancel</button>
        </div>
        <div v-else>
            <button @click="triggerPopUp()">Confirm Cancellation</button>
        </div>
    </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
export default defineComponent({
    props: ["roomInfo", "booked", "manager"],
    setup() {
        const makePopupAppear = ref(false);
        const leaveReview = ref(false);
        const confirmRemove = ref(false);

        const triggerPopUp = ref(() => {
            makePopupAppear.value = !makePopupAppear.value;
        })

        const triggerReview = ref(() => {
            leaveReview.value = !leaveReview.value;
        })

        const triggerConfirm = ref(() => {
            confirmRemove.value = !confirmRemove.value;
        })

        return {
            makePopupAppear,
            triggerPopUp,
            leaveReview,
            triggerReview,
            confirmRemove,
            triggerConfirm
        }
    },
    name: "SingleListing",
});
</script>

<style lang="scss" scoped>
.rating {
display: flex;
flex-direction: row-reverse;
justify-content: center;
}


.rating > input{ display:none;}

.rating > label {
position: relative;
width: 1.1em;
font-size: 1.5vw;
color: #FFD700;
cursor: pointer;
}

.rating > label::before{
content: "\2605";
position: absolute;
opacity: 0;
}

.rating > label:hover:before,
.rating > label:hover ~ label:before {
opacity: 1 !important;
}

.rating > input:checked ~ label:before{
opacity:1;
}

.rating:hover > input:checked ~ label:before{ opacity: 0.4; }
</style>