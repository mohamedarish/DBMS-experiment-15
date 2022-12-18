import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import LoginView from "../views/LoginView.vue";
import NewHotelView from "../views/NewHotelView.vue";
import NewRoomView from "../views/NewRoomView.vue";
import OldHotelView from "../views/OldHotelView.vue";
import RegisterView from "../views/RegisterView.vue";
import ListingsView from "../views/ListingsView.vue";
import BookedView from "../views/BookedView.vue";
import ListedRooms from "../views/ListedRooms.vue";
import SingleRoomView from "../views/SingleRoomView.vue";

const routes = [
    {
        path: "/",
        name: "home",
        component: HomeView,
    },
    {
        path: "/login",
        name: "login",
        component: LoginView,
    },
    {
        path: "/register",
        name: "register",
        component: RegisterView,
    },
    {
        path: "/addroom",
        name: "addroom",
        component: NewRoomView,
    },
    {
        path: "/loginhotel",
        name: "loginhotel",
        component: OldHotelView,
    },
    {
        path: "/registerhotel",
        name: "registerhotel",
        component: NewHotelView,
    },
    {
        path: "/allrooms",
        name: "allroooms",
        component: ListingsView,
    },
    {
        path: "/bookings",
        name: "bookings",
        component: BookedView,
    },
    {
        path: "/mylistings",
        name: "mylistings",
        component: ListedRooms,
    },
    {
        path: "/room",
        name: "room",
        component: SingleRoomView,
    },
];

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes,
});

export default router;
