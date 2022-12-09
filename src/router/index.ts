import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
import LoginView from "../views/LoginView.vue";
import RegisterView from "../views/RegisterView.vue";
import AddroomView from "../views/RoomView.vue";
import HotelView from "../views/HotelView.vue";
import RegView from "../views/RegView.vue";

const routes: Array<RouteRecordRaw> = [
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
    component: AddroomView,
  },
  {
    path: "/loginhotel",
    name: "loginhotel",
    component: HotelView,
  },
  {
    path: "/registerhotel",
    name: "registerhotel",
    component: RegView,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
