<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import { onMounted, ref } from 'vue';


const products = ref({ Object })
const productOnCart = () => {
    products.value = JSON.parse(localStorage.getItem("cart") || [])
}
onMounted(() => {
    productOnCart()
})

</script>

<template>
    <Header />
    <Navbar />
    <NavbarCategory />
    <section class="section-one">
        <div id="cart">
            <div class="row title">
                <div class="col">
                    <h2>SHOPPING CART</h2>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in products" :key="index">
                                <td>
                                    <img :src="`http://127.0.0.1:8000/storage/product_image/${data.image}`" width="70"
                                        height="70" alt="">
                                </td>

                                <td>₱{{ data.price }}</td>
                                <td>
                                    <button>+</button>
                                    <span>{{ data.quantity }}</span>
                                    <button>-</button>
                                </td>
                                <td>Subtotal</td>
                            </tr>
                        </tbody>
                    </table>
                   <router-link :to="{name: 'home-dashboard'}">
                    <button class="btn btn-white">CONTINUE SHIPPING</button>
                   </router-link>
                    <button class="btn btn-dark">UPDATE CART</button>
                </div>
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>CART TOTALS</th>
                                <th>₱</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Subtotal</td>
                                <td>₱1,170.00</td>
                            </tr>
                            <tr>
                                <td>Total</td>
                                <td>₱1,170.00</td>
                            </tr>
                        </tbody>
                    </table>
                    <button class="btn btn-dark proceed-btn">PROCEED TO CHECKOUT</button>
                </div>
            </div>
        </div>
    </section>
</template>
<style scoped>
section {
    width: 70%;
    margin: auto;
}

.table th {
    color: rgb(118, 118, 119);
}

.proceed-btn {
    background: rgb(103, 103, 102);
    border: 0;
}
</style>