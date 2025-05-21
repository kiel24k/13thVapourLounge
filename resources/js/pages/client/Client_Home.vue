<script setup>

import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import Footer from '@/components/Client_Footer.vue'
import { onMounted, ref } from 'vue';
import { Button, Message } from 'primevue';
import loader from '@/widgets/Loader.vue'
import Swal from 'sweetalert2';

const isLoader = ref(false)
const newArrivalListItem = ref({})
const bestSellerListItem = ref({})
const cartTotal = ref()

//API VARIABLES
const heroData = ref({})
const publishedServiceData = ref({})
const publishedAboutUsData = ref({})


//API FUNCTIONS
const GET_PUBLISHED_HERO_API = async () => {
    isLoader.value = true
    await axios({
        method: 'GET',
        url: 'api/get-published-hero'
    }).then(response => {
      
        heroData.value = response.data
        isLoader.value = false
    })
}

const GET_PUBLISHED_SERVICE_API = async () => {
    await axios({
        method: 'GET',
        url:'/api/get-published-service'
    }).then(response => {
        publishedServiceData.value = response.data
    })
}

const GET_PUBLISHED_ABOUT_US_API = async () => {
    await axios({
        method: 'GET',
        url: '/api/get-published-about-us'
    }).then(response => {
        publishedAboutUsData.value = response.data

    })
}

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
            max_quantity: data.quantity
        })
    }
    localStorage.setItem('cart', JSON.stringify(cart))
    cartTotal.value = cart.reduce((total, el) => total + el.quantity, 0)
    Swal.fire({
  position: "top-end",
  icon: "success",
  title: "Product has been added to cart",
  showConfirmButton: false,
  timer: 1500
});
}

const addToCartBestSeller = (data) => {
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
            max_quantity: data.quantity
        })
    }
    localStorage.setItem('cart', JSON.stringify(cart))
    cartTotal.value = cart.reduce((total, el) => total + el.quantity, 0)

        Swal.fire({
  position: "top-end",
  icon: "success",
  title: "Product has been added to cart",
  showConfirmButton: false,
  timer: 1500
});
}
onMounted( () => {
    newArrivalList()
    bestSellerList()
    GET_PUBLISHED_HERO_API()
    GET_PUBLISHED_SERVICE_API()
    GET_PUBLISHED_ABOUT_US_API()
})



</script>

<template>
    <loader v-if="isLoader"/>
    <Navbar :cartTotal="cartTotal" />

    <NavbarCategory />
    <div class="container-fluid mt-3" v-if="heroData[0]">
        <a href="https://www.google.com/maps/place/13th+Vapour+Lounge/@14.282278,120.8652239,15.75z/data=!4m6!3m5!1s0x33bd81effd100ed7:0x59aa7255e5f6bc7e!8m2!3d14.282493!4d120.8660981!16s%2Fg%2F11gmcc2vvf?entry=ttu&g_ep=EgoyMDI1MDQyOS4wIKXMDSoASAFQAw%3D%3D"
            target="_blank">
            <figure>
                <img :src="`storage/cms_image/${heroData[0].image}`" alt="" width="1900" height="360">
            </figure>
            <div class="location_title">
                <strong class="text-center">{{ heroData[0].details }}.</strong>
            </div>
            <hr>
        </a>
    </div>
    <section class="section-one">
        <span>New arrivals</span>
        <div class="section-one-item">
            <article v-for="(data, index) in newArrivalListItem.data" :key="index">
                <router-link :to="{ name: 'client-products', params: { id: data.id } }">
                    <figure>
                        <div class="image-one-content">
                            <img :src="`http://127.0.0.1:8000/storage/product_image/${data.image}`" height="130"
                                width="120" alt="" />
                        </div>
                    </figure>
                    <summary class="mt-3">
                        <Message severity="info" icon="pi pi-info-circle" size="small">{{ data.product_name }}</Message>
                        <p class="label">{{ data.product_label }}</p>
                    </summary>
                    <div class="price">
                        <b>₱{{ data.product_price }}.00</b>
                    </div>
                </router-link>
                <div class="text-start">
                    <Button @click="addToCartNewArrival(data)" icon="pi pi-cart-plus" severity="warn"
                        label="Add To Cart" raised />
                </div>
            </article>
        </div>
        <hr>
    </section>


    <section class="section-two">
        <span>Best Sellers</span>
        <div class="section-one-item">
            <article v-for="(data, index) in bestSellerListItem.data" :key="index">
                <router-link :to="{ name: 'client-products', params: { id: data.id } }">
                    <div class="image-one-content">
                        <img :src="`/storage/product_image/${data.image}`" height="130" width="120" alt="" />
                    </div>
                </router-link>
                <summary>
                    <Message severity="success" icon="pi pi-info-circle" size="small">{{ data.product_name }}</Message>
                    <p>{{ data.product_label }}</p>
                </summary>
                <div class="price">
                    <b>₱{{ data.product_price }}.00</b>
                </div>
                <div class="text-start">
                    <Button @click="addToCartBestSeller(data)" icon="pi pi-cart-plus" severity="warn"
                        label="Add To Cart" raised />
                </div>
            </article>
        </div>
        <hr>
    </section>
    <section class="mt-3">
        <div class="service_title text-center">
            <h1>Service we provided</h1>
        </div>

        <div class="service_content mt-5">
            <div class="content" v-for="data in publishedServiceData">
                <figure>
                    <img :src="`storage/cms_image/${data.image}`" alt="" width="50" height="50">
                </figure>
                <figcaption>
                    <h3>{{ data.caption }}</h3>
                    <span>{{data.details}}</span>
                </figcaption>
            </div>
           
        </div>
        <hr>
    </section>
    <section class="section-three">
        <div class="section-three-title">
            <b>About Us</b>

        </div>
        <article v-for="data in publishedAboutUsData">
            <h2>{{data.caption}}</h2>
            <span>{{ data.details }}</span>
        </article>
    </section>
    <Footer />
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



.section-one-item article {
    width: 12rem;
    border-radius: var(--floating-border-radius);
    box-shadow: var(--floating-box-shadow);
    padding: 5px;
    margin: 10px;
    height: 27rem;
    padding: 20px;
    background: white;
    transition: all linear 0.2s;
}

.section-one-item article:hover {
    transform: scale(1.1);
}

.section-one-item article img {
    margin: auto;
}

figure {
    display: flex;
    justify-content: space-between;
}

summary {
    display: grid;
    align-items: start;
    align-content: start;
    list-style: none;
    height: 10rem;
    overflow: hidden;

}

summary small {
    color: gray;
    font-size: 12px;
}

.section-two-item {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

.section-three:not(.section-three-title) {
    display: grid;
    gap: 50px;
}

.top_homepage {
    padding: 10px;
    box-shadow: 0px 0px 5px gray;
    background: white;
    border-radius: 10px;
}

.location_title {
    display: flex;
    align-items: center;
    gap: 10px;
    justify-content: start;
}

.location_title {
    color: rgb(161, 129, 70);
}

.main_service {
    display: grid;
    justify-content: center;
}


.service_content {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    width: auto;
    margin: auto;

}

.service_content>div {
    width: 20rem;
    background: white;
    box-shadow: 0px 0px 5px 0px gray;
    height: 15rem;
    border-radius: 12px;
    overflow: hidden;
    padding: 10px;
}

.service_content figure {
    padding: 10px;
}
.content figure img{
    border-radius: 100%;
}
</style>