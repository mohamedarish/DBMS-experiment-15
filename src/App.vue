<template>
    <nav>
        <div class="links">
            <router-link to="/">Home</router-link> |
            <router-link to="/login">Login</router-link> |
            <router-link to="/register">Register</router-link> |
            <router-link to="/loginhotel">LoginHotel</router-link> |
            <router-link to="/registerhotel">RegisterHotel</router-link> |
            <router-link to="/allrooms">AllRooms</router-link> |
            <router-link to="/bookings">Booked</router-link> |
            <router-link to="/mylistings">MyListings</router-link> |
            <router-link to="/room">SingleRoom</router-link>
        </div>

        <div class="state-login">
            <p  class="username">SignedInUser</p>
            <img src="https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png" class="user" />
        </div>
    </nav>
    <router-view/>
</template>

<style lang="scss">
#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
}

nav {
    display: flex;
    width: 100vw;
    justify-content: space-between;
    background: #82500a;
    padding: 20px;
    height: 64px;

    .state-login {
        display: flex;
        justify-content: flex-end;
        height: 100%;
        align-items: center;

        .username {
            color: #ebeff4;
            margin-right: 5px;
        }

        .user {
            height: 44px;
        }
    }
}

nav a {
    font-weight: bold;
    color: #ebeff4;
    text-decoration: none;
}

nav a.router-link-exact-active {
    color: #42b983;
}
</style>
