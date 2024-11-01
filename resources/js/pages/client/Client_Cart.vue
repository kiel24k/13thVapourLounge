<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import { onMounted, ref, watch } from 'vue';
import Footer from '@/components/Client_Footer.vue'
import Cookies from 'js-cookie';
import { useRouter } from 'vue-router';
import Loader from '@/widgets/Loader.vue'

const router = useRouter()
const productTotal = ref()
const FIXED_TOTAL = ref()
let SUB_TOTAL_VALUE = ref()
const QUANTITY_TOTAL_VALUE = ref()
const fetchProductsValue = ref({})
const decrementDisabledBtn = ref(false)

const userData = ref(Object)


const user = (data) => {
    userData.value = data
}

const fetchProducts = () => {
    let products = JSON.parse(localStorage.getItem("cart") || [])
    productTotal.value = products
    let total = products.reduce((total, el) => total + parseInt(el.price) * parseInt(el.quantity), 0)
    FIXED_TOTAL.value = total
}

const incrementBtn = (id, quantity) => {    
    const test = productTotal.value.find((el) => el.id === id)
    if (test) {
        test.quantity += 1
        fetchProductsValue.value = [...productTotal.value]
        if(test.quantity >= test.max_quantity){
            test.quantity = test.max_quantity
        }
        
    }
    
    
    localStorage.setItem('cart', JSON.stringify(productTotal.value))
    fetchProducts()
    SUB_TOTAL()
}

const decrementBtn = (id, price) => {
    const test = productTotal.value.find((el) => el.id === id)
    if (test) {
        test.quantity -= 1
        fetchProductsValue.value = [...productTotal.value]
    }
    if (test.quantity <= 0) {
        test.quantity = 0

    } else {
        SUB_TOTAL()
    }
    localStorage.setItem('cart', JSON.stringify(productTotal.value))
    fetchProducts()
    SUB_TOTAL()
}

const SUB_TOTAL = () => {
    let products = JSON.parse(localStorage.getItem("cart") || [])
    let total = products.reduce((total, el) => total + parseInt(el.price) * parseInt(el.quantity), 0)
    const quantityTotal = products.reduce((total, el) => total + el, 0)
    SUB_TOTAL_VALUE.value = total
    QUANTITY_TOTAL_VALUE.value = quantityTotal

}

const removeItemBtn = (id) => {
    let products = JSON.parse(localStorage.getItem("cart") || [])
    const currentProducts = products.filter((el) => el.id !== id)
    if (currentProducts.length !== products.length) {
        localStorage.setItem('cart', JSON.stringify(currentProducts))
    }
    fetchProducts()
    SUB_TOTAL()
}

const submitCart = async () => {
    let order = JSON.parse(localStorage.getItem('cart'))
    let cookieUsername = JSON.stringify(Cookies.get('username'))
    if (cookieUsername) {
        if(FIXED_TOTAL.value === 0){
            alert("No Product ")
        }else{
            const orderData = order.filter((el) => el.quantity > 0)
            const response = await axios.post('/api/client-order', {
                user_id: userData.value.id,
                order_data:orderData
        })
     
        localStorage.setItem('cart', JSON.stringify(order.filter((el) => el.quantity === 0)))
        }
       
    } else {
        
        router.push('/login')
    }
    fetchProducts()
    SUB_TOTAL()
}



onMounted(() => {
    SUB_TOTAL()
    fetchProducts()


})




</script>

<template>
    <Header />
    <Navbar :QUANTITY_TOTAL_VALUE="QUANTITY_TOTAL_VALUE" @user="user" />
   
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
                               <th>sd</th>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>
                                    /
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in productTotal" :key="index">
                                <td><input type="checkbox" name="" id=""></td>
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
                                    <button @click="incrementBtn(data.id, data.quantity)">+</button>
                                    <span class="p-1" v-if="data.quantity >= 1">{{ data.quantity }}</span>
                                    <span v-else>{{ data.quantity = 0 }}</span>
                                    <button :disabled="decrementDisabledBtn"
                                        @click="decrementBtn(data.id, data.price)">-</button>
                                </td>
                                <td>
                                    <img src="/public/image/delete-icon.png" alt="" width="20px"
                                        @click="removeItemBtn(data.id)">
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
                                <td>
                                    SUBTOTAL
                                </td>
                                <td>

                                    <span>₱{{ SUB_TOTAL_VALUE }}.00</span>
                                </td>
                            </tr>
                            <tr>
                                <td>Total</td>
                                <td>
                                    <span>₱{{ SUB_TOTAL_VALUE }}.00</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <button class="btn btn-dark proceed-btn" @click="submitCart">PROCEED TO CHECKOUT</button>
                </div>
            </div>
        </div>
    </section>
    <Footer />
</template>
<style scoped>
section {
    width: 70%;
    margin: auto;
}

.table th {
    color: rgb(118, 118, 119);
}

.quan button {
    border: 0;

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