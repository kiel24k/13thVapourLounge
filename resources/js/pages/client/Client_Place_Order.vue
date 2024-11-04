<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import Footer from '@/components/Client_Footer.vue'
import { useRoute, useRouter } from 'vue-router'
import { onMounted, ref } from 'vue'
import Cookies from 'js-cookie'
import ChooseAddress from '@/components/Client_Choose_Address_Modal.vue'
import Swal from 'sweetalert2'


const route = useRoute()
const price = ref()
const total = ref()
const order = ref()
const router = useRouter()
const chooseAddress = ref(false)



const PRODUCTS = () => {
    const paramsId = route.query.item_id.map(Number)
    const cartItems = JSON.parse(localStorage.getItem('cart') || [])
    const getIdOnCart = cartItems.filter((el) => paramsId.includes(el.id))
    order.value = getIdOnCart
    total.value = order.value.reduce((total, val) => total + parseInt(val.price) * val.quantity , 0)

    
  


}

const chooseAddressModal = () => {
    chooseAddress.value = true
}
const closeModal = () => {
    chooseAddress.value = false
}

const submit = async () => {
    // let order = JSON.parse(localStorage.getItem('cart'))
    // let cookieUsername = JSON.stringify(Cookies.get('username'))
    // if (cookieUsername) {
    //     if (FIXED_TOTAL.value === 0) {
    //         alert("No Product ")
    //     } else {
    //         const orderData = order.filter((el) => el.quantity > 0)
    //         const response = await axios.post('/api/client-order', {
    //             user_id: userData.value.id,
    //             order_data: orderData
    //         })
    //         localStorage.setItem('cart', JSON.stringify(order.filter((el) => el.quantity === 0)))
    //     }

    // } else {
    //     router.push('/login')
    // }
    // fetchProducts()
    // SUB_TOTAL()
}
onMounted(() => {
    PRODUCTS()
})
</script>

<template>
    <transition name="fade">
        <ChooseAddress v-if="chooseAddress" @closeModal="closeModal" class="chooseAddress" />
    </transition>
    <Header />
    <Navbar />
    <NavbarCategory />

    <section class="section-one">
        <div class="address" ref="test">
            <div class="row">
                <div class="col">
                    Already Address? <small class="text-primary" @click="chooseAddressModal">Choose Address</small>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <b>Full Name *</b>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <input type="text" placeholder="First Name">
                </div>
                <div class="col">
                    <input type="text" placeholder="Last Name">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <b>Country / Region *</b>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <b>Philippines</b>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <input type="text" placeholder="Mobile No.">
                </div>
                <div class="col">
                    <input type="text" placeholder="Floor Unit No.">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <select name="" id="" class="form-select">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <select name="" id="" class="form-select">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <select name="" id="" class="form-select">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col"></div>
            </div>
        </div>
        <div class="your-order">
            <div class="row">
                <div class="col">
                    <b>Your Order</b>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>PRODUCT</th>
                                <th>Qty</th>
                                <th>TOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in order" :key="index">
                                <td>{{ data.product_label }}</td>
                                <td> <small>x{{ data.quantity }}</small></td>
                                <td><b>P{{ data.price * data.quantity }}</b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
            <div class="row">
                <div class="col">
                    <span>Shipping</span>
                </div>
                <div class="col text-end">
                    <b>P500</b>
                </div>
                <hr>

            </div>
            <div class="row">
                <div class="col">
                    <span>Total</span>
                </div>
                <div class="col text-end">
                    <b>P{{ total + 500 }}</b>
                </div>
                <hr>
            </div>
            <div class="row">
                <div class="col text-end">
                    <button class="btn btn-dark" @click="submit">PLACE ORDER</button>
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

.section-one {
    display: flex;
    gap: 10px;
    justify-content: center;
}

.address {
    display: grid;
    gap: 10px;
    box-shadow: 0px 0px 2px gray;
    padding: 10px;
    margin-top: 20px;
    border-radius: 3px;
    background-color: rgb(248, 246, 237);

}

.address input {
    padding: 15px;
    border-radius: 5px;
    border: solid 1px gray;
}

.address select {
    padding: 15px;
    border: solid 1px gray;
}

.your-order {
    display: grid;
    gap: 10px;
    border: solid 1px black;
    padding: 10px;
    margin-top: 20px;
    border-radius: 3px;
    background-color: rgb(255, 255, 255);
    align-items: center;
    align-content: center;
    height: max-content
}

.chooseAddress {
    transition: all linear 2s;
}

/* Fade Transition */
.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.2s;
}

.fade-enter,
.fade-leave-to {
    opacity: 0;

}

/* Slide In Effect */
</style>