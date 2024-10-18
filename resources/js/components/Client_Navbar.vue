<script setup>
import { onMounted, ref, watch } from 'vue';
import Cookies from 'js-cookie';
import Loader from '@/widgets/Loader.vue'

const props = defineProps(['cartTotal','QUANTITY_TOTAL_VALUE'])
const user = ref(Object)
const loader = ref(false)





const cartMountedValue = ref()
const cartMounted = () => {
    const cart = JSON.parse(localStorage.getItem('cart'))
    if (cart) {
        cartMountedValue.value = cart.reduce((total, el) => total + el.quantity, 0)
    }
}

const CLIENT_AUTH_API = async () => {
    loader.value = true
    try{
        const response = await axios.get('/api/client-auth')
       user.value = response.data
       loader.value = false
        
    }catch(error){

    }
}

onMounted(() => {
    cartMounted()
    CLIENT_AUTH_API()
})
</script>

<template>
    <Loader v-if="loader"/>
    <nav>
        <div class="row">
            <div class="col nav-main">
                <div class="">
                    <img src="/public/image/search-glassess copy.png" alt="" width="30">
                </div>
                <div class="">
                        <router-link :to="{ name: 'home-dashboard' }" href="" class="nav-link">
                            <img src="/public/image/1920525_gogle_google_logo_network_icon.png" alt="" width="40">
                        </router-link>
                </div>
                <div class="header-action">
                    <router-link :to="{name: 'my-profile'}">
                        <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="" width="30">
                    </router-link>
                    {{ user.first_name }}
                   <router-link :to="{name: 'client-cart'}">
                    <img src="/public/image/cart1-icon.png" alt="" width="30">
                   </router-link>
                   
                    <b v-if="cartTotal">{{ cartTotal }}</b>
                    <b v-else>{{ cartMountedValue }}</b>
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
.header-action img{
    cursor: pointer;
}
</style>
