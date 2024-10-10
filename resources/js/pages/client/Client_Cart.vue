<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import { onMounted, ref, watch } from 'vue';


let products = JSON.parse(localStorage.getItem("cart") || [])
const SUB_TOTAL_VALUE = ref()
const incrementDisabled = ref(false)

const fetchProductsValue = ref({})
const fetchProducts = () => {
    fetchProductsValue.value = products
    const total = products.reduce((total, el) => total + parseInt(el.price) * parseInt(el.quantity), 0)
    SUB_TOTAL_VALUE.value = total
    
}

const incrementBtn = (id, price) => {
    const test = products.find((el) => el.id === id)
    if (test) {
        test.quantity += 1
        fetchProductsValue.value = [...products]
    }
    localStorage.setItem('cart', JSON.stringify(products))
    SUB_TOTAL()
}

const decrementBtn = (id, price) => {
    const test = products.find((el) => el.id === id)
    if (test) {
        test.quantity -= 1
        fetchProductsValue.value = [...products]
    }
    localStorage.setItem('cart', JSON.stringify(products))
    SUB_TOTAL()
}

const SUB_TOTAL = () => {
    const total = products.reduce((total, el) => total + parseInt(el.price) * parseInt(el.quantity), 0)
    SUB_TOTAL_VALUE.value = total
}
onMounted(() => {
    fetchProducts()
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
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in fetchProductsValue" :key="index">
                                <td class="product-label">
                                    <div class="product-image">
                                        <img :src="`storage/product_image/${data.image}`" width="70" height="70" alt="">
                                    </div>
                                    <div class="label">
                                        <span>{{ data.product_label }}</span>
                                    </div>
                                </td>

                                <td class="price">₱{{ data.price }}</td>
                                <td class="quan">
                                    <button :disabled="incrementDisabled" @click="incrementBtn(data.id, data.price)">+</button>
                                    <input type="number" :value="data.quantity">
                                    <button @click="decrementBtn(data.id, data.price)">-</button>
                                </td>

                            </tr>
                        </tbody>
                    </table>
                    <router-link :to="{ name: 'home-dashboard' }">
                        <button class="btn btn-white">CONTINUE SHIPPING</button>
                    </router-link>
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
                                <td>{{ SUB_TOTAL_VALUE }}</td>
                            </tr>
                            <tr>
                                <td>Total</td>
                                <td>{{ SUB_TOTAL_VALUE }}</td>
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

.quan{
    display: flex;
}
.quan input{
    width: 30px;
}


.proceed-btn {
    background: rgb(103, 103, 102);
    border: 0;
}

.product-label {
    display: flex;
    gap: 10px;
    justify-content: start;
}

.product-label img {
    border-radius: 5px;
}
</style>