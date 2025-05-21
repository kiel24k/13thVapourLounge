<script setup>
import Sidebar from '@/components/Admin_Sidebar.vue'
import Header from '@/components/Staff_Header.vue'
import PieChart from '@/components/Admin_Pie_Chart.vue'
import LineChart from '@/components/Admin_Line_Chart.vue'
import BarChart from '@/components/Admin_Bar_Chart.vue'
import { onMounted, ref } from 'vue'
import axios from 'axios'
import Loader from '@/widgets/Loader.vue'

const isLoader = ref(false)
const totalProducts = ref()
const totalUsers = ref()
const totalReceiveOrders = ref()
const newProductAddedData = ref({})

const showSidebar = ref(true)


const TOTAL_PRODUCTS_API = async () => {

    const response = await axios.get('api/dashboard-product-total')
    totalProducts.value = response.data

}

const TOTAL_USERS_API = async () => {

    const response = await axios.get('api/dashboard-total-user')
    totalUsers.value = response.data

}

const TOTAL_RECEIVE_ORDERS_API = async () => {

    const response = await axios.get('api/dashboard-receive-order-total')
    totalReceiveOrders.value = response.data
}

const GET_NEW_PRODUCT_ADDED_API = async () => {
    await axios({
        method: 'GET',
        url: '/api/dashboard-new-product-added'
    }).then(response => {
        newProductAddedData.value = response.data
    })
}
onMounted(async () => {
    isLoader.value = true;
    await Promise.all([
        TOTAL_RECEIVE_ORDERS_API(),
        TOTAL_PRODUCTS_API(),
        TOTAL_USERS_API(),
        GET_NEW_PRODUCT_ADDED_API()
    ]);

    isLoader.value = false;
});

</script>

<template>
    <Loader v-if="isLoader" />
    <section id="main">
        <div class="header">
            <Header />
        </div>
        <div class="content">
            <!-- <div class="sidebar">
                <Sidebar v-if="showSidebar" />
            </div> -->
            <div class="main">
                <section>
                    <div class="row">
                        <div class="col title text-center">
                            <h4 style="color:gray;">Overview</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col total_content">
                            <div class="user_total">
                                <div class="order_title">
                                    <i class="pi pi-user"></i>
                                    <span>User</span>
                                </div>
                                <div class="order_content">
                                    <span>{{ totalUsers }}</span>
                                </div>
                            </div>
                            <div class="product_total">
                                <div class="order_title">
                                    <i class="pi pi-shopping-cart"></i>
                                    <span>Products</span>
                                </div>
                                <div class="order_content">
                                    <span>{{ totalProducts }}</span>
                                </div>
                            </div>
                            <div class="order_total">
                                <div class="order_title">
                                    <i class="pi pi-shopping-bag"></i>
                                    <span>order</span>
                                </div>
                                <div class="order_content">
                                    <span>{{ totalReceiveOrders }}</span>
                                </div>
                            </div>
                            <!-- <div class="cash_total">
                                <div class="order_title">
                                    <i class="pi pi-warehouse"></i>
                                    <span>Cash</span>
                                </div>
                                <div class="order_content">
                                    <span>{{ totalReceiveOrders }}</span>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </section>


                <section class="section-two mt-4">
                    <div class="row charts">
                        <div class="col graph">
                            <div class="linechart">
                                <LineChart />
                            </div>
                            <div class="barchart">
                                <BarChart />
                            </div>
                            <div class="piechart">
                                <PieChart />
                            </div>
                        </div>
                        <div class="col-4 bg-white">
                            <b>First 15 New Products</b>
                            <table class="table">
                                <tbody>
                                    <tr v-for="(data, key) in newProductAddedData">
                                        <td>{{ key + 1 }}</td>
                                        <td>{{ data.product_name }}</td>
                                        <td>{{ data.product_label }}</td>
                                        <td>₱{{ data.product_price }}.00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>
</template>
<style scoped>
#main {
    display: grid;

}

.main {
    width: 100%;
    margin: 10px;
    display: grid;
    gap: 15px;
    margin-top: 5rem;
}

.header {
    position: sticky;
    top: 0;
    z-index: 999;
}

.sidebar {}

.content {
    display: flex;
}

.section-one {
    display: grid;
    padding: 20px;
    box-shadow: 0px 0px 5px 0px gray;
    border-radius: 5px;
}


.totals {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
}

.total_content {
    display: flex;
    gap: 40px;
    justify-content: center;
}

.total_content>div {
    width: 150px;
    height: 150px;
    display: grid;
    justify-content: center;
    align-items: center;
    align-content: center;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.8);

}

.user_total {
    background-color: rgb(110, 173, 208);

}

.product_total {
    background-color: rgb(223, 117, 103);
}

.order_total {
    background-color: rgb(72, 171, 168);
}

.cash_total {
    background-color: rgb(255, 126, 135);
}

.order_title,
.order_content {
    color: white;
    display: flex;
    gap: 5px;
    justify-content: center;
    align-content: center;
    align-items: center;

}

.order_title i {
    font-size: 20px;
    background: rgba(255, 255, 255, 0.3);
    padding: 5px;
    border-radius: 5px;
}

.order_content span {
    font-size: 35px;
    font-weight: 600;
}


.charts {
    display: flex;
    flex-wrap: wrap;


}

.graph {
    display: grid;
    gap: 10px;

}
.graph > div{
    background: white;
    padding:5px;
    border-radius: 10px;
    box-shadow: 0px 0px 5px gray;
}

table thead {
    background: white;
}
</style>