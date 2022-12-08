import { createRouter, createWebHistory, RouteRecordRaw } from "vue-router";
import LoginView from "../views/LoginView.vue";
import RegisterView from "../views/RegisterView.vue";
import AddroomView from "../views/AddroomView.vue";
import UserRegister from "../views/UregisterView.vue";
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
    path: "/registeremployee",
    name: "registeremployee",
    component: UserRegister,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
