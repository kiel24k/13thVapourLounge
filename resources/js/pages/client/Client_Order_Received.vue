<script setup>
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarOrder from '@/components/Client_Navbar_Order.vue'
import { onMounted, ref } from 'vue';
import Swal from 'sweetalert2';
import Loader from '@/widgets/Loader.vue'

import {
    Check,
    Delete,
    Edit,
    Message,
    Search,
    Star,
} from '@element-plus/icons-vue'

const isLoading = ref(false)

const orderReveived = ref()
const ORDER_RECEIVED_API = async () => {
    const response = await axios.get('api/order-received')
    orderReveived.value = response.data
}

const submitMarkAsComplete = async (id) => {
    try {
        const response = await axios.post('api/mark-as-completed', { id: id })
        if (response.status == 200) {
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: false,
                timer: 1500
            });
            ORDER_RECEIVED_API()
        }


    } catch (error) {

    }

}
onMounted(async() => {
    isLoading.value = true
    await ORDER_RECEIVED_API()
    isLoading.value = false
})

</script>


<template>
    <Loader v-if="isLoading"/>
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
        <article v-for="(data, index) in orderReveived" :key="index">
            <div class="row p-4">
                 <div class="col product_data">
                    <span>{{ data.product_name }}</span>
                    <span>{{ data.product_label }}</span>
                    <strong>{{ data.date_released }}</strong>
                </div>
                <div class="col">
                    <b class="status">{{ data.status }}</b>
                </div>
                <div class="col">
                    <b>QTY: </b>{{ data.order_quantity }}x
                </div>
                <div class="col">
                    <b>Total: </b><b class="text-success">₱</b>{{ data.order_total }}.00
                </div>
                <div class="col">
                    <el-button class="btn btn-dark" @click="submitMarkAsComplete(data.user_order_id)" type="success" plain>Order received</el-button>
                </div>
                <hr>
            </div>
        </article>

    </section>

</template>

<style scoped>
aticle{
    box-shadow:var(--floating-box-shadow);
    border-radius: var(--floating-border-radius);
    margin-top: 10px;
}
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

.status {
    padding: 10px;
    border-radius: 15px;
    font-size: 10px;
    font-weight: bold;
    color: rgb(0, 0, 0);
    background-color: rgb(76, 175, 80, 0.5);
    backdrop-filter: blur(25px);
}
.product_data{
    display: grid;
}
</style>