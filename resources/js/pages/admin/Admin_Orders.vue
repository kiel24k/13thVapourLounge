<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { onMounted, ref } from 'vue';
import ViewUserOrder from '@/components/Admin_View_User_Order.vue'
import StatusUpdate from '@/widgets/status_update.vue'
import { Button, InputGroup, InputGroupAddon, InputText, Select } from 'primevue';

const orderList = ref(Object)
const viewUserOrder = ref(false)
const userOrderProduct = ref(Object)
const isStatusUpdate = ref(false)
const showSidebar = ref(true)

const ORDER_lIST_API = async () => {
    try {
        const response = await axios.get('/api/order-list')
        orderList.value = response.data

        //  console.log(JSON.parse(orderList.value.data[1].order_data));
    } catch (error) {

    }
}

const viewUserProductBtn = (name, data) => {
    viewUserOrder.value = true
    userOrderProduct.value = {
        name: name,
        data: data
    }

}


const closeModal = () => {
    ORDER_lIST_API()
    viewUserOrder.value = false
}
const notification = () => {
    ORDER_lIST_API()
    viewUserOrder.value = false
    isStatusUpdate.value = true
    setTimeout(() => {
        isStatusUpdate.value = false
    }, 3000);
}


const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}

onMounted(() => {
    ORDER_lIST_API()
})

</script>

<template>
    <StatusUpdate v-if="isStatusUpdate" />
    <ViewUserOrder v-if="viewUserOrder" :userOrderProduct="userOrderProduct" @closeModal="closeModal"
        @notification="notification" />

    <div id="section-one">
        <div class="header">
            <Header @closeSidebar="closeSidebar" />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar v-if="showSidebar" />
            </div>
            <div class="main m-2">
                <section id="section-one" class="mt-4">
                    <div class="row">
                     <div class="col table-top">
                        <div class="search">
                            <Select/>
                        </div>
                        <div class="category">
                            <InputGroup>
                                <InputText placeholder="Keyword" />
                                <InputGroupAddon>
                                    <Button icon="pi pi-search" severity="secondary" variant="text" @click="toggle" />
                                </InputGroupAddon>
                            </InputGroup>
                        </div>
                        <div class="download">
                            <Button icon="pi pi-file-pdf" severity="danger" label="PDF" raised/>
                        </div>
                     </div>
                        
                    </div>
                </section>
                <section id="section-two" class="mt-4">
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>user</th>
                                <th>Date Order</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in orderList" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ data.first_name }} {{ data.last_name }}</td>
                                <td>{{ data.created_at }}</td>
                                <!-- <td>{{ data.user_orders[0] }}</td> -->
                                <td class="table-action">
                                        <Button  @click="viewUserProductBtn(data.first_name, data.user_orders)" icon="pi pi-eye" severity="info" raised/>
                                        <Button icon="pi pi-trash" severity="danger" raised/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col pagination ">
                        <Button  icon="pi pi-chevron-left" severity="contrast" rounded raised />
                        <span>1 of 2</span>
                        <Button  icon="pi pi-chevron-right" severity="contrast" iconPos="right" rounded raised />
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

table {
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    
}


section {
    margin: auto;
}
.table-action {
    display: flex;
    justify-content: start;
    align-items: center;
    gap:10px;
}
.pagination{
    display: flex;
    justify-content: center;
    align-items: center;
    gap:10px;
}



#section-two table th {
    background-color: var(--table-head-color);
    color: rgb(0, 0, 0);
    text-transform: capitalize;
}
table td{
    
}
.table-top{
    display: flex; 
    align-items: center;
    gap:10px;
}
</style>