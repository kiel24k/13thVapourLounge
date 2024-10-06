<script setup>
import { onMounted, ref } from 'vue';

const props = defineProps(['cartVal'])

const cartHistoryData = ref()
const cartData = ref()
const cartHistory = () => {
    const cartNum = JSON.parse(localStorage.getItem('cart'))
    cartHistoryData.value = cartNum
    if (cartHistoryData.value === null) {
       props.cartVal = 0
    }else{
        cartData.value = cartNum.length
    }


}

onMounted(() => {
    cartHistory()
})
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
                    <b v-if="cartVal">{{ cartVal.length }}</b>
                    <b v-else>{{ cartData }}</b>
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

.header-action {
    display: flex;
    gap: 10px;
}
</style>
