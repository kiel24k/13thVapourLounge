<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import { onMounted, ref, watch } from 'vue';
import Footer from '@/components/Client_Footer.vue'
import Cookies from 'js-cookie';
import { useRouter } from 'vue-router';
import Loader from '@/widgets/Loader.vue'
import Swal from 'sweetalert2';
import { Button } from 'primevue';

const router = useRouter()
const productTotal = ref()
const FIXED_TOTAL = ref()
let SUB_TOTAL_VALUE = ref()
const QUANTITY_TOTAL_VALUE = ref()
const fetchProductsValue = ref({})
const decrementDisabledBtn = ref(false)
const checkedItem = ref([])

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
        if (test.quantity >= test.max_quantity) {
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
    let cookieUsername = JSON.stringify(Cookies.get('username'))
    if (!cookieUsername) {
        router.push('/login')
    }
    else if (SUB_TOTAL_VALUE.value === 0 || checkedItem.value.length === 0) {
        Swal.fire({
            icon: "error",
            title: "Oops...",
            text: "Please select Product!",
            footer: '<a href="#">Tang?</a>'
        });
    } else {
        router.push({ path: '/my-place-order', query: { item_id: checkedItem.value } })
    }
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
    {{ checkedItem }}

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
                                <td><input type="checkbox" v-model="checkedItem" :value="data.id" id=""></td>
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
                                    <button @click="incrementBtn(data.id, data.quantity)"
                                        :disabled="!checkedItem.includes(data.id)">+</button>
                                    <span class="p-1" v-if="data.quantity >= 1">{{ data.quantity }}</span>
                                    <span v-else>{{ data.quantity = 1 }}</span>
                                    <button :disabled="!checkedItem.includes(data.id) || data.quantity === 1"
                                        @click="decrementBtn(data.id, data.price)">-</button>
                                </td>
                                <td>
                                  <Button @click="removeItemBtn(data.id)" icon="pi pi-trash" severity="danger" raised/>
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
                                <td>Overall Total</td>
                                <td>
                                    <span>₱{{ SUB_TOTAL_VALUE }}.00</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="text-end">
                        <Button @click="submitCart" label="Proceed To Checkout" severity="contrast" raised/>
                    </div>
                    <br>
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
.section-one{
    background-color: white;
    box-shadow: var(--floating-box-shadow);
    border-radius: var(--floating-border-radius);
    padding:20px;   
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