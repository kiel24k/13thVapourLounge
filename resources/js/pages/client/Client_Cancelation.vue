<script setup>
import Footer from '@/components/Client_Footer.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarAccount from '@/components/Client_Navbar_Account.vue'
import { onMounted, ref } from 'vue';
import { Button } from 'primevue';
import axios from 'axios';


const cancelledOrder = ref({})
const user = ref(Object)
const USER_API = async () => {
    try {
        const response = await axios.get('/api/user')
        user.value = response.data
    } catch (error) {

    }
}

const CANCELLED_ORDER_API = async () => {
    const response = await axios.get('api/cancelled-order')
    cancelledOrder.value = response.data
}

onMounted (() => {
    USER_API()
    CANCELLED_ORDER_API()
})
</script>

<template>
    <Navbar/>
    <NavbarCategory/>
    <section class="row" id="profile">
        <div class="col">
            <figure>
                <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="">
                <figcaption class="profile-figcaption text-dark">
                    <span>{{ user.first_name }} {{ user.last_name }}</span>
                    <br>
                    <small>{{ user.email }}</small>
                </figcaption>
            </figure>
        </div>
        <div class="col profile-action">
            <div class="">
               <!-- <Button label="Change Image" severity="contrast" icon="pi pi-pen-to-square" raised/> -->
            </div>
        </div>
        <hr>
    </section>

    <nav>
        <NavbarAccount/>
    </nav>

    <section id="info">
       <table class="table table-striped">
        <thead>
            <tr>
                <th>#</th>
                <th>Item</th>
                <th>Quantity</th>
                <th>Order Price</th>
                <th>Order Total</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(data, index) in cancelledOrder" :key="index">
                <td>{{ index + 1 }}</td>
                <td>
                    <img :src="`/storage/product_image/${data.order_image}`" width="100" alt="">
                    <span>{{ data.order_label }}</span>
                </td>
                <td>
                    <span>x{{ data.order_quantity }}</span>
                </td>
                <td>
                    <span>₱{{ data.order_price }}</span>
                </td>
                <td>
                    <span>₱{{ data.order_total }}</span>
                </td>
                <td class="table-action">
                    <Button icon="pi pi-shopping-cart" rounded raised severity="info"/>
                </td>
            </tr>
        </tbody>
       </table>
    </section>
    <Footer/>
</template>

<style scoped>
    #profile {
        max-width: 70%;
        margin: auto;
        display: flex;
        flex-wrap: wrap;
        background: white;
        box-shadow: var(--floating-box-shadow);
        border-radius: var(--floating-border-radius);
        margin-top: 10px;
    }

    figure {
        display: flex;
        align-items: center;
        gap: 10px
    }

    .profile-figcaption {
        font-weight: 600;
    }

    .profile-action {
        display: flex;
        justify-content: end;
        align-items: center;
    }

    #info{
        max-width: 70%;
        margin:auto;
        padding:10px;
        background: white;
        box-shadow: var(--floating-box-shadow);
        border-radius: var(--floating-border-radius);
        
    }
    table th {
        background: black;
        color:white;
    }

    .figure-info {
        display: flex;
    }
    .figure-figcaption{
        font-weight: 600;
    }
   
    
</style>
