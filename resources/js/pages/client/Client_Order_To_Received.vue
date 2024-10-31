<script setup>
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarOrder from '@/components/Client_Navbar_Order.vue'
import { onMounted, ref } from 'vue';

const orderReceive = ref()

const ORDER_TO_RECEIVED_API = async () => {
    const response = await axios.get('api/order-to-received')
    orderReceive.value = response.data
    
}

onMounted(() => {
ORDER_TO_RECEIVED_API()


})

</script>


<template>
    <Navbar />
    <NavbarCategory />
    <section>
        <div class="title">
            <h2>My Order</h2>
        </div>
        <div class="row">
            <div class="col p-4">
                <input type="text" class="form-control" placeholder="search by item">
            </div>
        </div>
        <NavbarOrder />
        <hr>
        <article v-for="(data,index) in orderReceive" :key="index">
            <div class="row p-4">
                <div class="col">
                    <figure>
                        <img :src="`/storage/product_image/${data.order_image}`" width="80" alt="">
                        <figcaption>
                           {{data.order_label}}
                        </figcaption>
                    </figure>
                </div>
                <div class="col">
                    <b>QTY:</b> x{{ data.order_quantity }}
                </div>
                <div class="col">
                    <b class="text-success">₱</b>{{ data.order_price }}.00
                </div>
                <div class="col">
                    <b>Total:</b> <b class="text-success">₱</b>{{ data.order_total }}.00
                </div>
                <div class="col">
                    <span class="status">
                        {{ data.status }}
                    </span>
                </div>
                <hr>
            </div>
        </article>
      
    </section>

</template>

<style scoped>
section {
    max-width: 70%;
    margin: auto;
    background: white;
    margin-top: 10px;
}

figure {
    display: flex;
    justify-content: center;
    align-items: center;
    align-content: center;
}

figcaption {
    width: 20rem;
    height: 3rem;
    overflow: hidden;
}
.status {
    padding: 10px;
    border-radius: 15px;
    font-size: 10px;
    font-weight: bold;
    background-color: rgb(33,150,243, 0.5);
    color: rgb(0, 0, 0);
    backdrop-filter: blur(25px);
}
</style>