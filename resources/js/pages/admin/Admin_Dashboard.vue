<script setup>
import Sidebar from '@/components/Admin_Sidebar.vue'
import Header from '@/components/Admin_Header.vue'
import PieChart from '@/components/Admin_Pie_Chart.vue'
import LineChart from '@/components/Admin_Line_Chart.vue'
import BarChart from '@/components/Admin_Bar_Chart.vue'
import { onMounted, ref } from 'vue'
import axios from 'axios'

const totalProducts = ref()
const totalUsers = ref()
const totalReceiveOrders = ref()

const showSidebar = ref(true)
const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}

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
onMounted(() => {
    TOTAL_PRODUCTS_API()
    TOTAL_USERS_API()
    TOTAL_RECEIVE_ORDERS_API()
})

</script>

<template>
    <section id="main">
        <div class="header">
            <Header @closeSidebar="closeSidebar" />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar v-if="showSidebar" />
            </div>
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
                            <div class="cash_total">
                                <div class="order_title">
                                    <i class="pi pi-warehouse"></i>
                                    <span>Cash</span>
                                </div>
                                <div class="order_content">
                                    <span>234</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <section class="section-two">
                    <div class="row charts">
                        <div class="col graph">
                                <LineChart />
                                <BarChart />
                        </div>
                        <div class="col-4">
                            <table class="table">
                                <thead>
                                   <b>Status</b>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Rhona</td>
                                        <td>17%</td>
                                        <td><i class="pi pi-ellipsis-v"></i></td>
                                    </tr>
                                    <tr>
                                        <td>Kiel</td>
                                        <td>24%</td>
                                        <td><i class="pi pi-ellipsis-v"></i></td>
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
    gap: 10px;
    justify-content: center;
}

.total_content>div {
    width: 150px;
    height: 150px;
    border-radius: 5px;
    display: grid;
    justify-content: center;
    align-items: center;
    align-content: center;

}

.user_total {
    background-color: rgb(35, 112, 200);

}

.product_total {
    background-color: rgb(239, 178, 119);
}

.order_total {
    background-color: rgb(182, 181, 184);
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
    gap:10px; 
    
}
table thead{
    background: white;
}

</style>