import { createStore } from "vuex";

const store = createStore({
  state: {
    user: {
      name: "",
      email: "",
      type: "",
      id: 0,
    },
  },
  mutations: {
    updateLogin(state, payload) {
      state.user.name = payload.name;
      state.user.email = payload.email;
      state.user.type = payload.type;
      state.user.id = payload.id;
    },
  },
});

export default store;
