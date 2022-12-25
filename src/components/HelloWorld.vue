<template>
    <div class=" hello site-name">
        DBMS15
    </div>
    <div class="hello motto">
        Book Hotels
    </div>
    <div class="hello motto">
        Today!!
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
    color: aliceblue;
    -webkit-text-stroke-width: 0.2vh;
    -webkit-text-stroke-color: black;
    padding-left: 40px;
    font-weight: 900;
    font-size: 15vh;
}
.site-name {
    margin-bottom: 8px;
}

.motto {
    font-weight: 700;
    font-size: 3.3vw;
}
</style>
