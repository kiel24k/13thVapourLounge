<script setup>
import { onMounted } from 'vue';


const user = async () => {
    try {
        const response = await axios.get('api/user')
        console.log(response.data);
    } catch (error) {
        console.log(error);
    }

}

onMounted(() => {
    user()
})

</script>

<template>
    <div id="loader">
        <div class="loader">
            <small>loading...</small>
        </div>
    </div>
</template>

<style scoped>
#loader {
    position: fixed;
    width: 100%;
    height: 100%;
    background: rgb(255, 255, 255, 0.9);
    display: grid;
    justify-content: center;
    align-items: center;
    z-index: 999;
}

.loader {
    height: 4px;
    width: 15rem;
    --c: no-repeat linear-gradient(#6100ee 0 0);
    background: var(--c), var(--c), #d7b8fc;
    background-size: 60% 100%;
    animation: l16 3s infinite;
}

@keyframes l16 {
    0% {
        background-position: -150% 0, -150% 0
    }

    66% {
        background-position: 250% 0, -150% 0
    }

    100% {
        background-position: 250% 0, 250% 0
    }
}
</style>