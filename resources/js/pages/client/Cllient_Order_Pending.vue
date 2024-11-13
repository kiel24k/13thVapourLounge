<script setup>
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarOrder from '@/components/Client_Navbar_Order.vue'
import { onMounted, ref } from 'vue';
import Swal from 'sweetalert2';
import {Delete} from '@element-plus/icons-vue'
import Footer from '@/components/Client_Footer.vue'
import { Button } from 'primevue';

const orderPending = ref()

const ORDER_PENDING_API = async () => {
    const response = await axios.get('/api/pending-order')
    orderPending.value = response.data
}

const cancelOrder = async (id) => {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: "btn btn-success m-2",
            cancelButton: "btn btn-danger m-2"
        },
        buttonsStyling: false
    });

    try {
       const result = await  swalWithBootstrapButtons.fire({
            title: "Cancel Your Order",
            text: "Your Order will not continue to deliver!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Yes, Cancel it!",
            cancelButtonText: "No",
            reverseButtons: true
        })
        if (result.isConfirmed) {
            const response = await axios.post('api/cancel-order', { id })
            if (response.status === 200) {
                ORDER_PENDING_API()
                swalWithBootstrapButtons.fire({
                    title: "Cancelled!",
                    text: "Your Order has been Cancelled.",
                    icon: "success"
                });
            } else {
                await swalWithBootstrapButtons.fire({
                    title: "Error",
                    text: "There was an issue canceling the order.",
                    icon: "error"
                });
            }
        }else{
            await swalWithBootstrapButtons.fire({
                title: "Cancelled",
                text: "Order is not delete.",
                icon: "error"
            });
        }
    } catch (error) {
        console.log(error);
        await swalWithBootstrapButtons.fire({
            title: "Error",
            text: "An error occurred while trying to cancel the order.",
            icon: "error"
        });
    }

    {
    }
};


onMounted(() => {
    ORDER_PENDING_API()
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
        <article v-for="(data, index) in orderPending" :key="index">
            <div class="row p-4">
                <div class="col">
                    <figure>
                        <img :src="`/storage/product_image/${data.order_image}`" width="80" alt="">
                        <figcaption>
                            {{ data.order_label }}
                        </figcaption>
                    </figure>
                </div>
                <div class="col">
                    <b>QTY: </b>{{ data.order_quantity }}
                </div>
                <div class="col">
                    <b class="text-success">₱</b>{{ data.order_price }}.00
                </div>
                <div class="col">
                    <b>Total: </b><b class="text-success">₱</b>{{ data.order_total }}.00
                </div>
                <div class="col">
                    <Button @click="cancelOrder(data.id)" icon="pi pi-times" severity="danger" raised rounded/>
                </div>
                <hr>
            </div>
        </article>
    </section>
    <Footer/>

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

.status {
    padding: 10px;
    border-radius: 15px;
    font-size: 10px;
    font-weight: bold;
    color: rgb(0, 0, 0);
    background-color: rgb(255, 235, 59, 0.5);
    backdrop-filter: blur(25px);
}
</style>