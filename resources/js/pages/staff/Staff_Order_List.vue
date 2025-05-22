<script setup>
import Header from '@/components/Staff_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { onMounted, ref, watch } from 'vue';
import ViewUserOrder from '@/components/Admin_View_User_Order.vue'
import StatusUpdate from '@/widgets/status_update.vue'
import { Button, InputGroup, InputGroupAddon, InputText, Select } from 'primevue';
import OrderChangeStatusModal from "@/components/Order_Change_Status_Modal.vue"
import Loader from '@/widgets/Loader.vue'
import Swal from 'sweetalert2';

const isLoading = ref(false)

const isOrderChangeStatusModal = ref(false)

const orderList = ref(Object)
const viewUserOrder = ref(false)
const userOrderProduct = ref({

})
const isStatusUpdate = ref(false)
const showSidebar = ref(true)
const orderCategory = ref({})
const search = ref('')
const category = ref('')
const sortVal = ref('DESC')
const orderVal = ref('')
const pages = ref({
    current_page: null,
    last_page: null,
})


//API METHODS
const ORDER_lIST_API = async (page = 1) => {
    await axios({
        method: 'GET',
        url: '/api/get-user-order'
    }).then(response => {
        orderList.value = response.data
    })
}

const ORDER_CATEGORY_API = async () => {
    const response = await axios.get('api/order-category')
    orderCategory.value = response.data
}


const viewUserProductBtn = (data) => {
    viewUserOrder.value = true
    userOrderProduct.value = data
}

//components
watch(search, (oldVal, newVal) => {
    ORDER_lIST_API()
    console.log(search.value);

})

watch(category, (oldVal, newVal) => {
    ORDER_lIST_API()

})

const clear = () => {
    category.value = ''
    ORDER_lIST_API()
}

const sort = (data) => {
    orderVal.value = data
    if (sortVal.value === "DESC") {
        sortVal.value = "ASC"
    } else {
        sortVal.value = "DESC"
    }
    ORDER_lIST_API()
}

const prev = () => {
    if (pages.value.last_page <= pages.value.current_page) {
        ORDER_lIST_API(pages.value.current_page - 1)
    }


}
const next = () => {
    if (pages.value.last_page > pages.value.current_page) {
        ORDER_lIST_API(pages.value.current_page + 1)
    }

}
const closeModal = () => {
    ORDER_lIST_API()
    viewUserOrder.value = false
}

const updateBtn = (data) => {
    isOrderChangeStatusModal.value = true
    userOrderProduct.value = data

}

const closeOrderChangeStatusModal = () => {
    isOrderChangeStatusModal.value = false
    ORDER_lIST_API()
}

const deleteOrder = (id) => {
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            axios({
                method: 'DELETE',
                url: '/api/delete-user-order',
                data: {
                    id: id
                }
            }).then(response => {
                if (response.status === 200) {
                    Swal.fire({
                        title: "Deleted!",
                        text: "Order has been deleted.",
                        icon: "success"
                    });   
                }
                   ORDER_lIST_API()
            })

        }
    });
}

const notification = () => {
    ORDER_lIST_API()
    viewUserOrder.value = false
    isStatusUpdate.value = true
    setTimeout(() => {
        isStatusUpdate.value = false
    }, 3000);
}




onMounted(async () => {
    isLoading.value = true
    await Promise.all([
        ORDER_CATEGORY_API(),
        ORDER_lIST_API()
    ])
     isLoading.value = false
})

</script>

<template>
    <Loader v-if="isLoading" />
        <OrderChangeStatusModal v-if="isOrderChangeStatusModal" :userOrderProduct="userOrderProduct"
        @closeOrderChangeStatusModal="closeOrderChangeStatusModal" />
    <StatusUpdate v-if="isStatusUpdate" />
    <ViewUserOrder v-if="viewUserOrder" :userOrderProduct="userOrderProduct" @closeModal="closeModal"
        @notification="notification" />
    <div id="section-one">
        <div class="header">
            <Header />
        </div>
        <div class="content">
            <div class="main m-5">
                <section id="section-one" class="mt-4">
                    <div class="row">
                        <div class="col table-top">
                            <!-- <div class="search">
                                <Select v-model="category" :options="orderCategory" optionLabel="date_order"
                                    placeholder="select category" />
                                <Button label="clear" severity="secondary" variant="outlined" raised @click="clear"
                                    v-if="category" />
                            </div>
                            <div class="category">
                                <InputGroup>
                                    <InputText placeholder="Search" v-model="search" />
                                    <InputGroupAddon>
                                        <Button icon="pi pi-search" severity="secondary" variant="text"
                                            @click="toggle" />
                                    </InputGroupAddon>
                                    <Button label="clear" severity="secondary" variant="outlined" raised
                                        @click="search = ''" v-if="search" />
                                </InputGroup>
                            </div> -->
                            <!-- <div class="download">
                                <Button icon="pi pi-file-pdf" severity="danger" label="PDF" raised />
                            </div> -->
                        </div>

                    </div>
                </section>
                <section id="section-two" class="mt-4">
                    <table class="table table-bordered table-hover table-responsive">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th @click="sort('first_name')">user
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('mobile_no')">Mobile No.
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('floor_unit_no')">Unit No.
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('island')">Island
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('regions')">Regions
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('province')">Province
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('municipality')">Municipality
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('barangay')">Barangay
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('order_total')">Total
                                    <i class="pi pi-sort-amount-up" v-if="sortVal === 'DESC'"></i>
                                    <i class="pi pi-sort-amount-down" v-else-if="sortVal === 'ASC'"></i>
                                </th>
                                <th @click="sort('status')">Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in orderList.data" :key="index">

                                <td>{{ index + 1 }}</td>

                                <td>{{ data.order_first_name }} {{ data.order_last_name }}</td>
                                <td>{{ data.order_mobile_no }}</td>
                                <td>{{ data.floor_unit_no }}</td>
                                <td>{{ data.island }}</td>
                                <td>{{ data.regions }}</td>
                                <td>{{ data.province }}</td>
                                <td>{{ data.municipality }}</td>
                                <td>{{ data.barangay }}</td>
                                <td>₱{{ data.order_total }}.00</td>
                                <td>
                                    <span class="table_status" :style="{
                                        backgroundColor:
                                            data.status === 'cancelled' ? 'red' :
                                                data.status === 'pending' ? 'orange' :
                                                    data.status === 'out-of-delivery' ? 'blue' :
                                                        data.status === 'received' ? 'green' :
                                                            data.status === 'completed' ? 'violet' :
                                                                'transparent'
                                    }">
                                        {{ data.status }}</span>
                                </td>
                                <!-- <td>{{ data.user_orders[0] }}</td> -->
                                <td class="table-action">
                                    <Button @click="viewUserProductBtn(data)" icon="pi pi-eye" severity="primary" raised
                                        title="View" />
                                     <Button icon="pi pi-file-edit" severity="info" raised title="Edit"
                                        @click="updateBtn(data)" />
                                   <Button icon="pi pi-trash" severity="danger" raised title="Delete"
                                        @click="deleteOrder(data.user_order_id)" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col pagination ">
                            <Button icon="pi pi-chevron-left" severity="contrast" variant="text" @click="prev" />
                            <span>{{ pages.current_page }} of {{ pages.last_page }}</span>
                            <Button icon="pi pi-chevron-right" severity="contrast" iconPos="right" variant="text"
                                @click="next" />
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
    gap: 10px;
}

.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
}



#section-two table th {
    background-color: var(--table-head-color);
    color: rgb(0, 0, 0);
    text-transform: capitalize;
}

#section-two table th:hover {
    transition: all linear 0.2s;
    background-color: rgb(99, 97, 97);
    color: white;
    cursor: pointer;
}

.table-top {
    display: flex;
    align-items: center;
    gap: 10px;
}

.table_status {
    padding: 5px;
    border-radius: 50px;
    font-weight: bold;
    color: white;
}
</style>