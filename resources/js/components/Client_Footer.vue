<script setup>
import { onMounted, ref } from 'vue'

//API VARIABLES
const titleData = ref({})

//API FUNCTIONS
const GET_TITLE_API = async () => {
    await axios({
        method: 'GET',
        url: '/api/get-published-title-tag'
    }).then(response => {
        titleData.value = response.data
    })
}

onMounted(() => {
    GET_TITLE_API()
})
</script>

<template>
    <footer>
        <div class="footer-content">
            <div class="footer-title text-center text-white" v-if="titleData[0]">
                <h1>{{ titleData[0].caption }} Trece Martirez Cavite </h1>
            </div>
            <div class="footer-links">
                <div class="row">
                    <div class="col text-center social-media-img">
                        <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" alt="">
                        <img src="/public/image/1920525_gogle_google_logo_network_icon.png" alt="">
                        <img src="/public/image/gmail-icon.png" alt="">
                    </div>
                </div>
                <div class="col"></div>
                <div class="col"></div>
            </div>
        </div>
    </footer>
</template>

<style scoped>
footer {
    margin-top: 5rem;
    width: 100%;
    height: 20rem;
    background: rgb(59, 58, 58);
    display: grid;
    justify-content: center;
    align-items: center;

}

.footer-links .social-media-img img {
    width: 30px;
    margin: 10px;
}
</style>
