<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import { onMounted, ref } from 'vue';
import { useRoute } from 'vue-router';


const route = useRoute()
const quantity = ref(1)
const product = ref({})

const increment = () => {
    quantity.value++
}

const decrement = () => {
    quantity.value--

    if (quantity.value <= 0) {
        quantity.value = 0
    }
}

const checkProduct = async () => {
    try {
        const response = await axios.get('/api/check-product', {
            params: {
                id: route.params.id
            }

        }
        )
        product.value = response.data
    } catch (error) {

    }
    console.log("your id is", route.params.id);

}
onMounted(() => {
    checkProduct()
})

</script>

<template>
    <Header />
    <Navbar />
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
                    <button class="btn btn-dark">Check Out</button>
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
    color:gray;
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