<script setup>
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarOrder from '@/components/Client_Navbar_Order.vue'
import { onMounted, ref } from 'vue';

const order = ref(Object)
const eachOrder = ref(Object)

const ALL_ORDER_API = async () => {
    try {
        const response = await axios.get('api/all-order')
        order.value = response.data
        console.log(response.data);
        
    } catch (error) {

    }
}

onMounted(() => {
    ALL_ORDER_API()
})
</script>


<template>
    <Navbar />
    <NavbarCategory />
    <section>
        <div class="title">
            <h2>My Order</h2>
        </div>
        <div class="row">
            <div class="col p-4">
                <input type="text" class="form-control" placeholder="search by item">
            </div>
        </div>
        <NavbarOrder />
        <hr>
        <article v-for="(data, index) in order" :key="index">
            <div class="row p-4">
                <div class="col">
                    <figure>
                        <img :src="`/storage/product_image/${data.order_image}`" width="100">
                        <figcaption>
                            {{ data.order_label }}
                        </figcaption>
                    </figure>
                </div>
                <div class="col">
                    P{{ data.order_price }}
                </div>
                <div class="col">
                    QTY:  {{ data.order_quantity }}
                </div>
                <div class="col">
                    Total: PP{{ data.order_total }}
                </div>
                <hr>
            </div>


        </article>
    </section>

</template>

<style scoped>
section {
    max-width: 70%;
    margin: auto;
    background: white;
    margin-top: 10px;
}

figure {
    display: flex;
    justify-content: center;
    align-items: center;
    align-content: center;
}

figcaption {
    width: 20rem;
    height: 3rem;
    overflow: hidden;
}
</style>