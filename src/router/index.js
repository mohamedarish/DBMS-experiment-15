import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import ListingsView from "../views/ListingsView.vue";
import BookedView from "../views/BookedView.vue";
import ListedRooms from "../views/ListedRooms.vue";
import SingleRoomView from "../views/SingleRoomView.vue";
import ErrorView from "../views/ErrorView.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/login",
    name: "login",
    component: HomeView,
  },
  {
    path: "/register",
    name: "register",
    component: HomeView,
  },
  {
    path: "/loginhotel",
    name: "loginhotel",
    component: HomeView,
  },
  {
    path: "/registerhotel",
    name: "registerhotel",
    component: HomeView,
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
    path: "/room:id",
    name: "room",
    params: true,
    component: SingleRoomView,
  },
  {
    path: "/404",
    name: "error",
    component: ErrorView,
  },
  {
    path: "/:pathmatch(.*)",
    redirect: "/404",
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
