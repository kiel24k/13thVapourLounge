<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { onMounted, ref } from 'vue';
import ViewUserOrder from '@/components/Admin_View_User_Order.vue'

const orderList = ref(Object)
const viewUserOrder = ref(false)
const userOrderProduct = ref(Object)



const ORDER_lIST_API = async () => {
    try {
        const response = await axios.get('/api/order-list')
        orderList.value = response.data[0]
        console.log(typeof orderList.value.data[0].order_data);
        //  console.log(JSON.parse(orderList.value.data[1].order_data));
    } catch (error) {

    }

}

const viewUserProductBtn = (data) => {
    viewUserOrder.value = true
    userOrderProduct.value =  data
    
}
const closeModal = () => {
    viewUserOrder.value =false
}

onMounted(() => {
    ORDER_lIST_API()
})

</script>

<template>
    <ViewUserOrder v-if="viewUserOrder" :userOrderProduct="userOrderProduct" @closeModal="closeModal"/>
    <div id="section-one">
        <div class="header">
            <Header />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar />
            </div>
            <div class="main m-2">
                <section id="section-one" class="mt-4">
                    <div class="row">
                        <div class="col">
                            <span>Users</span>
                            <span>Orders</span>
                        </div>
                        <div class="col">
                            <div class="table-action text-end">
                                <button>
                                    <img src="/public/image/search-glassess.png" width="25" alt="">
                                </button>
                                <button>
                                    <span>
                                        <img src="/public/image/burder-menu1.png" width="25" alt="">
                                        Columns
                                    </span>
                                </button>
                                <button>
                                    <span>
                                        <img src="/public/image/filter-icon.png" width="25px" alt="">
                                        filters
                                    </span>
                                </button>
                                |
                                <button class="btn btn-info text-white export">
                                    <img src="/public/image/download-icon.png" width="20px" alt="">
                                    Export
                                </button>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="section-two" class="mt-2">
                    <table class="table table-hover ">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>user</th>
                                <th>Date Order</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in orderList.data" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ data.first_name }} {{ data.last_name }}</td>
                                <td>{{ data.created_at }}</td>
                                <td class="action">
                                    <span>
                                        <button>
                                            <img src="/public/image/view-eye.png" width="20px" alt="" @click="viewUserProductBtn(JSON.parse(data.order_data))">
                                        </button>
                                        <button>
                                            <img src="/public/image/delete-icon.png" width="20px" alt="">
                                        </button>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col text-center ">
                            <button>prev</button>
                            <span>1 2 3 4 5 6 7 8 9</span>
                            <button>next</button>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</template>

<style scoped>
#section-one {
    display: grid;

}

.content {
    display: flex;
}

.main {
    width: 100%;
}

@media screen and (min-width: 769px) {
    section {
        margin: auto;
    }

    #section-two {
        overflow-x: auto;
    }

    #section-two table th {
        background: rgb(231, 239, 243);
        color: rgb(0, 0, 0);
        font-weight: 400;
        font-size: 400;
        text-transform: capitalize;
    }

    .table-action button:not(.export) {
        border: 1px solid rgb(163, 161, 161);
        border-radius: 7px;
        padding: 4px;
        background: transparent;
    }

    .action button {
        background: transparent;
        border: 0;
    }
}

@media screen and (max-width: 1116px) {
    section {
        width: 90%;
        margin: auto;
    }

    #section-two {
        overflow: auto;
    }

    #section-two table th {
        background: rgb(231, 239, 243);
        color: rgb(0, 0, 0);
        font-weight: 400;
        font-size: 400;
        text-transform: capitalize;
    }

    .table-action button:not(.export) {
        border: 1px solid rgb(163, 161, 161);
        border-radius: 7px;
        padding: 4px;
        background: transparent;
    }

    .action button {
        background: transparent;
        border: 0;

    }
}

@media screen and (min-width: 601px) {}
</style>