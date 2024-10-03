<script setup>
const props = defineProps(['cart'])
const cartStorage = localStorage.getItem('cart_value')
</script>

<template>
    <nav>
        <div class="row">
            <div class="col nav-main">
                <div class="">
                    <img src="/public/image/search-glassess copy.png" alt="" width="30">
                </div>
                <div class="">
                    <img src="/public/image/1920525_gogle_google_logo_network_icon.png" alt="" width="40">
                </div>
                <div class="header-action">
                    <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="" width="30">
                    <span>Cart / P280.00</span>
                    <img src="/public/image/cart1-icon.png" alt="" width="30">
                    <b v-if="cart.length > 0">{{ cart.length }}</b>
                    <b v-else-if="cart.length <= 0">{{ cartStorage.length }}</b>
                </div>
            </div>
        </div>
    </nav>
</template>

<style scoped>
.nav-main {
    display: flex;
    justify-content: space-around;
    box-shadow: 0px 0px 5px 0px gray;
    padding: 10px;
    align-items: center;
}
.header-action{
    display: flex;
    gap:10px;
}
</style>
