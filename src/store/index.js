import { createStore } from "vuex";

const store = createStore({
    state: {
        user: {
            name: "",
            email: "",
            type: "",
        },
    },
    mutations: {
        updateLogin(state, payload) {
            state.user.name = payload.name;
            state.user.email = payload.email;
            state.user.type = payload.type;
        },
    },
});

export default store;
