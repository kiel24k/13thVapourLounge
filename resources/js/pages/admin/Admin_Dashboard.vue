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

const TOTAL_PRODUCTS_API =  async () => {
        const response = await axios.get('api/dashboard-product-total')
        totalProducts.value = response.data
}

const TOTAL_USERS_API =async () => {
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
        <div class="header bg-info">
            <Header @closeSidebar="closeSidebar" />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar v-if="showSidebar"/>
            </div>
            <div class="main">
                <section class="section-one">
                    <div class="row totals text-white">
                        <div class="">
                            <p>products</p>
                            <span>{{ totalProducts }}</span>

                        </div>
                        <div class="">
                            <p>users</p>
                            <span>{{ totalUsers }}</span>
                        </div>
                        <div class="">
                            <p>received orders</p>
                            <span>{{ totalReceiveOrders }}</span>
                        </div>
                    </div>
                </section>
                <section class="section-two">
                    <div class="row charts">
                        <div class="">
                            <LineChart />
                        </div>
                        <div class="">
                            <BarChart />
                        </div>
                        <div class="">
                            <PieChart />
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
    gap:15px;
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
    background: rgb(250, 250, 250);
    padding:20px;
    box-shadow: 0px 0px 5px 0px gray;
    border-radius: 5px;
}


.totals {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
}

.totals>div {
    width: 15rem;
    height: 15rem;
    background: rgb(5, 180, 72);
    box-shadow: 0px 0px 5px 0px gray;
    border-radius: 10px;
    font-size: 20px;
    text-align: center;
    text-transform: capitalize;
    font-weight: bold;
}
.charts{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap:10px;
    margin-top:20px ;
    margin:2px;
    
   
}
.charts > div{
    background: white;
    box-shadow: 0px 0px 5px 0px gray;
     border-radius: 5px;
}
</style>