<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';
import Loader from '@/widgets/Loader.vue'
import Footer from '@/components/Client_Footer.vue'

const loader = ref(false)
const route = useRoute()
const quantity = ref(1)
const product = ref({})
const cart = ref()



const checkProduct = async () => {
    try {
        loader.value = true
        const response = await axios.get('/api/check-product', {
            params: {
                id: route.params.id
            }
        }
        )
        product.value = response.data
        loader.value = false

    } catch (error) {

    }
}

const increment = () => {
    quantity.value += 1
}

const decrement = () => {
    if (quantity.value <= 1) {
        quantity.value === 1
    } else {
        quantity.value -= 1
    }
}



const addToCart = (id,data) => {
    let cart = JSON.parse(localStorage.getItem('cart')) || []
    const existingProduct = cart.find((el) => el.id === id)
    if (existingProduct) {
      existingProduct.quantity = quantity.value
      console.log(existingProduct);
      
    } else {
        cart.push({
            id: data.id,
            image: data.image,
            product_label: data.product_label,
            price: data.product_price,
            quantity: quantity.value,
            max_quantity: data.quantity
        })
    }

    localStorage.setItem('cart', JSON.stringify(cart))
   
    




}
onMounted(() => {
    checkProduct()
})

</script>

<template>
    <Header />
    <Navbar />
    <Loader v-if="loader" />
    <NavbarCategory />
    <section class="section-one">
        <div class="section-main" v-if="product[0]">
            <div class="">
                <img :src="`/storage/product_image/${product[0].image}`" width="500" height="500" alt="">
            </div>
            <div class="item">
                <div class="title">
                    <small>{{ product[0].product_name }}</small>
                    <span>{{ product[0].product_label }}</span>
                </div>
                <b>Description</b>
                <div class="category">
                    <span>{{ product[0].description }}</span>
                </div>
                <div class="price">
                    <b>₱400.00</b>
                </div>
                <div class="quantity">
                    <button @click="decrement"><b>-</b></button>
                    <span>{{ quantity }}</span>
                    <button @click="increment"><b>+</b></button>
                </div>
                <div class="buy-now mt-3">
                    <button class="btn btn-dark" @click="addToCart(product[0].id, product[0])">addToCart</button>
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

.section-main {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 25px;


}

.title {
    display: grid;
}

.title small {
    color: gray;
}

.title span {
    font-weight: 600;
    font-size: 20px;
}

.item .category {

    width: 21rem;

}

.item .category span {
    color: gray;
    line-height: 2;

}

.quantity {
    border: 1px solid gray;
    width: 7rem;
    justify-content: space-between;
    display: flex;
    align-items: center;
    height: 3rem;
}

.quantity button {
    border: 0;
    width: 25px;
    font-size: 25px;
    background: none;
    cursor: pointer;
}
</style>