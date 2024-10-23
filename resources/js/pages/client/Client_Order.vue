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

        for (let i = 0; i <= response.data.length; i++) {

           




            // console.log(order.value = response.data);
            // eachOrder.value = JSON.parse(order.value[index].order_data)
            // console.log(eachOrder.value);
        }

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
        <table class="table ">
            <thead>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(data, index) in order" :key="index">
                    <td><img :src="`/storage/product_image/${data.image}`" width="150" alt=""></td>
                    <td>{{ data.product_label }}</td>
                    <td>{{ data.quantity }}</td>

                    <td></td>
                </tr>
            </tbody>
        </table>
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