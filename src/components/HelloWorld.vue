<template>
    <div class="hello">
        <div class="site-name">
            DBMS15
        </div>
        <div class="motto">
            Book Hotels
        </div>
        <div class="motto">
            Today!!
        </div>
    </div>
</template>

<script>
import { defineComponent } from 'vue';
import { RouterLink } from 'vue-router';
export default defineComponent({
    name: 'HelloWorld',
    components: {
        RouterLink
    }
})
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>
.hello {
    height: calc(100vh - 64px);
    background-image: url("https://www.gannett-cdn.com/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    color: aliceblue;
    -webkit-text-stroke-width: 0.2vh;
    -webkit-text-stroke-color: black;
    padding-left: 40px;
    font-weight: 900;
    font-size: 15vh;

    .site-name {
        margin-bottom: 8px;
    }

    .motto {
        font-weight: 700;
        font-size: 33%;
    }
}
</style>
