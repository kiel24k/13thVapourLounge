<script setup>
import axios from 'axios';
import { onMounted } from 'vue';
import Cookies from 'js-cookie';


const logoutBtn = async () => {
    try {
        const response = await axios('api/logout')
        console.log(response);
    } catch (error) {
        console.log(error);
    }

}

onMounted(  () => {
    const cookie =  Cookies.get('username')    
    console.log(cookie);
    
})
</script>

<template>
    <nav>
        <div id="nav">
            <div class="nav-main">
                <div class="">
                    <img src="/public/image/burder-menu1.png" alt="" width="40px" height="40px" />
                </div>
                <div class="">
                    <img src="/public/image/1920525_gogle_google_logo_network_icon.png" alt="" width="40">
                </div>
                <div class="">
                    <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="" width="30">
                    <img src="/public/image/cart1-icon.png" alt="" width="30">
                    <button class="logoutBtn" @click="logoutBtn">
                        <img src="/public/image/logout.png" width="25" alt="">
                        <b>Logout</b>
                    </button>
                </div>

            </div>
        </div>
    </nav>
</template>

<style scoped>
.nav-main {
    display: flex;
    justify-content: space-between;
    box-shadow: 0px 0px 10px 0px gray;
    padding: 10px;
    align-items: center;
    background: rgb(255, 255, 255);
}

.logoutBtn {
    background-color: rgb(204, 7, 7);
    padding: 5px;
    border-radius: 15px;
    border: 0px;
    color: white;
}

.logoutBtn img {
    filter: invert(1);
}
</style>