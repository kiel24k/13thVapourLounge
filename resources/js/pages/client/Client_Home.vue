<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import Footer from '@/components/Client_Footer.vue'
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
            max_quantity: data.quantity
        })
    }
    localStorage.setItem('cart', JSON.stringify(cart))
    cartTotal.value = cart.reduce((total, el) => total + el.quantity, 0)
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
                <router-link :to="{ name: 'client-products', params: { id: data.id } }">
                    <figure>
                        <div class="image-one-content">
                            <img :src="`http://127.0.0.1:8000/storage/product_image/${data.image}`" height="130"
                                width="120" alt="" />
                        </div>
                    </figure>
                    <summary class="mt-3">
                        <small>{{ data.product_name }}</small>
                        <p class="label">{{ data.product_label }}</p>
                        <b>₱{{ data.product_price }}</b>
                    </summary>
                </router-link>
                <div class="text-start">
                    <button class="btn btn-dark mt-3" @click="addToCartNewArrival(data)">Add to Cart</button>
                </div>
            </article>
        </div>
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
                    <p>{{ data.product_label }}</p>
                    <b>₱{{ data.product_price }}</b>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark" @click="addToCartBestSeller(data)">Add to Cart</button>
                </div>
            </article>
        </div>
    </section>
    <section class="section-three">
        <div class="section-three-title">
            <span>About Us</span>
            <hr>
        </div>
        <article>
            <h2>Our Vape Juice Online With Free Shipping</h2>
            <span>E-liquid is one of the most popular products people use when vaping. If you’re looking for a delicious
                e-liquid made from high-quality ingredients and has a clean taste, look no further than our store. We
                offer
                the best e-liquids at low prices. These e-juices produce amazing vapors and create delicious, thick
                clouds.
                With our high-end vape pen, you can set the appropriate mode according to your preference to provide
                steam
                that makes your throat feel comfortable.

                The e-liquids in our vape shop come in different nicotine strengths and PG/VG ratios. There are also
                many
                different types of e-liquids to choose from for beginners and advanced vapers. Our products are made to
                exacting standards, ensuring they give you an excellent vaping experience and taste great too! Our
                website
                is easy to navigate and use so that you can find the perfect vape juice quickly and easily. We offer
                free
                shipping and a 30-day money-back guarantee so you can buy our best e-liquid confidently!</span>
        </article>
        <article>
            <h2>Buy The Best Vapes From Specialty Retailers</h2>
            <span>
                Vapes are the most popular alternative to smoking. They are easy to use, portable, and safer than
                traditional cigarettes. If you want to buy a new vape, you have to do your research ahead of time.
                That’s where our online vaping store comes in. We have many years of experience in e-vape retailing. We
                can also provide a variety of online vapes tailored to specific needs and preferences, making it easier
                for customers to find the perfect vape for them.

                Not only that, but we have a wide range of vapes for sale, and you can even find some products you won’t
                find in other vape stores. They will bring you an unprecedented comfortable and relaxing vaping
                experience. We also offer a variety of flavors, so you can find the one that suits your taste buds best!
                Our online Philippines vape shop already has an outstanding reputation, and our products have always
                been well-received by customers. If you are eager to have a new experience, you must visit our vape shop
                to buy.
            </span>
        </article>
        <article>
            <h2>Cheap Vape Pens Of High Quality In Our Philippines Vape Shop</h2>
            <span>
                Vape pens are small electronic devices that look like cigarettes and come in all shapes and sizes. They
                contain batteries, atomizers, and cartridges or tanks that store e-liquid. The vape pen starter kit
                includes a vape pen, cartridge, and USB charger. They are compatible with most types of e-liquids and
                can be easily refilled. Cartridges can be replaced in as little as three seconds. The vape pens in our
                vape shop are cheap but high quality.

                vapesstores.ph is a great place to buy all kinds of vapes and related accessories. We offer a wide
                selection of vapers, and new products are constantly added to the store. We also carry a vast range of
                vaporizers, atomizers, and more at affordable prices, so you can find what you’re looking for without
                breaking your budget! If you are interested in vaping and want to know more about it, please visit our
                online Philippines vape shop for more information on the products.
            </span>
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
    border-radius: 10px;
    box-shadow: 0px 0px 5px 0px gray;
    padding: 5px;
    margin: 10px;
    height: 24em;
    padding: 20px;
    background: white;
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
    align-items: center;
    align-content: center;
    list-style: none;
    height: 9rem;

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
</style>