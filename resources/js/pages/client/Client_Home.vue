<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import { onMounted, ref } from 'vue';

const newArrivalListItem = ref({})
const bestSellerListItem = ref({})
const cartTotal = ref()
const newArrivalList = async () => {
    try {
        const response = await axios.get('api/new-arrival-list')
        newArrivalListItem.value = response.data
    } catch (error) {
    }
}

const bestSellerList = async () => {
    try {
        const response = await axios.get('api/best-seller')
        bestSellerListItem.value = response.data
    } catch (error) {
    }
}

const addToCartNewArrival = (data) => {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const existingProduct = cart.find((el) => el.id === data.id)
    if (existingProduct) {
        existingProduct.quantity += 1
    } else {
        cart.push({
            id: data.id,
            image: data.image,
            product_label: data.product_label,
            price: data.product_price,
            quantity: 1,
            max_quantity:data.quantity
        })
    }
    localStorage.setItem('cart', JSON.stringify(cart))
    cartTotal.value = cart.reduce((total, el) => total + el.quantity, 0)
}
onMounted(() => {
    newArrivalList()
    bestSellerList()
})



</script>

<template>
    <Header />
    <Navbar :cartTotal="cartTotal" />
    <NavbarCategory />
    <section class="section-one">
        <span>New arrivals</span>
        <div class="section-one-item">
            <article v-for="(data, index) in newArrivalListItem.data" :key="index">
                <router-link :to="{ name: 'client-products' }">
                    <figure>
                        <div class="image-one-content">
                            <img :src="`http://127.0.0.1:8000/storage/product_image/${data.image}`" height="130"
                                width="150" alt="" />
                        </div>
                    </figure>
                    <summary>
                        <p class="label">{{ data.product_label }}</p>
                        <small>{{ data.description }}</small>
                        <b>₱{{ data.product_price }}</b>
                    </summary>
                </router-link>
                <div class="text-start">
                    <button class="btn btn-dark mt-2" @click="addToCartNewArrival(data)">Add to Cart</button>
                </div>

            </article>
        </div>
    </section>

    <section class="section-two">
        <span>Best Sellers</span>
        <div class="section-one-item">
            <article v-for="(data, index) in bestSellerListItem.data" :key="index">
                <figure>
                    <div class="image-one-content">
                        <img :src="`http://127.0.0.1:8000/storage/product_image/${data.image}`" height="130" width="150"
                            alt="" />
                    </div>
                </figure>
                <summary>
                    <p>{{ data.product_label }}</p>
                    <small>₱{{ data.product_price }}</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
        </div>
    </section>
</template>

<style scoped>
section {
    width: 70%;
    margin: auto;
}

a {
    text-decoration: none;
    color: black;
    cursor: pointer;
}



.section-one span,
.section-two span {
    font-size: 40px;
    font-weight: 600;
}

.section-one-item {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;

}

article {
    width: 11rem;
    border-radius: 10px;
    box-shadow: 0px 0px 5px 0px gray;
    padding: 15px;
    margin: 10px;
    height: 23em;
}

article img {
    margin: auto;
}

figure {
    display: flex;
    justify-content: space-between;
}

summary {
    display: grid;
    align-items: center;
    align-content: center;
    list-style: none;
    height: 9rem;

}

.section-two-item {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;


}
</style>