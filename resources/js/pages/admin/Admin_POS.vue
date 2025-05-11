<script setup>
import { Button, InputGroup, InputGroupAddon, InputNumber, InputText, Message, Select } from 'primevue';
import { useRouter } from 'vue-router';
import AddCustomerModal from '@/components/Admin_Pos_Add_Customer_Modal.vue'
import { computed, onMounted, ref, watch } from 'vue';
import axios from 'axios';
import Swal from 'sweetalert2';
import PosModalReceipt from '@/components/Admin_Pos_Modal_Receipt.vue'
import ReserveList from '@/components/Admin_Reserve_List.vue'
import AdminReserveModal from '@/components/Admin_Reserve_Modal.vue'



const router = useRouter()
const addCustomerModal = ref(false)
const itemSection = ref([])
const posModalReceipt = ref(false)
const childRef = ref(null);
const isAdminReserveModal = ref(false)


//API VARIABLE
const getCustomer = ref({})
const posCategory = ref({})
const posItem = ref({})



const selectedCustomer = ref(null)
const propsForCustomerName = computed(() => {
    const customer = getCustomer.value.find((el) => el.id === selectedCustomer.value)
    return customer
})
const selectedItemList = ref({})
const customerProfile = ref({})
const search = ref()
const quantityTotal = ref()
const overAllTotal = ref(0)
const posTableData = ref({})



const dashboardBtn = () => {
    router.push('/admin-dashboard')
}

const addCustomerBtn = () => {
    addCustomerModal.value = true
}



const addItem = (data) => {
    const existingItem = itemSection.value.find(i => i.id === data.id);
    if (existingItem) {
        existingItem.quantity += 1
        existingItem.total = parseInt(existingItem.product_price) * existingItem.quantity
        // existingItem.product_price = 
    } else {
        const newItem = { ...data, quantity: 1, total: data.product_price };
        itemSection.value.push(newItem)
    }
    totalOfQuantity()
    priceTotal()


}
const deleteItem = (data) => {
    const deleteArr = itemSection.value.filter((el) => el.id !== data.id)
    itemSection.value = deleteArr
    totalOfQuantity()
    priceTotal()
}

const totalOfQuantity = () => {
    const quantotal = itemSection.value.reduce((acc, el) => acc + el.quantity, 0);
    quantityTotal.value = quantotal
}
const priceTotal = () => {
    const price = itemSection.value.reduce((acc, el) => acc + parseInt(el.total), 0)
    overAllTotal.value = price

}





const GET_CUSTOMER_API = async () => {
    const response = await axios.get('api/get-customer-list')
    getCustomer.value = response.data

}

const POS_CATEGORY_API = async () => {
    const response = await axios.get('api/pos-category')
    posCategory.value = response.data
}

const POS_ITEM_API = async () => {
    const response = await axios.get('api/pos-get-items', {
        params: {
            product_name: selectedItemList.value,
            search: search.value
        }
    })
    posItem.value = response.data

}


watch(selectedItemList, (oldVal, newVal) => {
    POS_ITEM_API()

})

watch(search, (oldVal, newVal) => {
    POS_ITEM_API()
})
const closeModal = () => {
    addCustomerModal.value = false
    GET_CUSTOMER_API()


}

const cashBtn = () => {
    posModalReceipt.value = true
}

const closeModalReceipt = () => {
    posModalReceipt.value = false
}

const addQuantity = (data) => {
    const singleItem = itemSection.value.find(item => item.id === data.id)
    console.log(data.quantity, data.product_price, data.total);
    console.log(singleItem.quantity, singleItem.product_price, singleItem.total);
    if (singleItem) {
        singleItem.quantity += 1
        singleItem.total = parseInt(data.product_price) * singleItem.quantity
    }
    totalOfQuantity()
    priceTotal()
}

const reduceQuantity = (data) => {
    const singleItem = itemSection.value.find(item => item.id === data.id)
    console.log(data.quantity, data.product_price, data.total);
    console.log(singleItem.quantity, singleItem.product_price, singleItem.total);
    if (singleItem.quantity <= 1) {
        singleItem.quantity = 1
    }
    else if (singleItem) {
        singleItem.quantity -= 1
        singleItem.total = parseInt(data.total) - parseInt(data.product_price)
        totalOfQuantity()
        priceTotal()
    }
}
const quantityEvent = ref('')
const tableQuantity = (event, data) => {
    const singleItem = itemSection.value.find(el => el.id === data.id)
    if (singleItem) {
        singleItem.quantity = event.value
        singleItem.total = event.value * parseInt(data.product_price)
        if (event.value === null) {
            singleItem.quantity = 0
            //   singleItem.total = singleItem.product_price
        }
    }
    totalOfQuantity()
    priceTotal()
}

const reserveBtn = (data) => {
    posTableData.value = data
   if (itemSection.value.length <= 0) {
        Swal.fire("Fill Order first!");
    } else if (itemSection.value.length > 0) {
        isAdminReserveModal.value = true
        //     await axios({
        //     method: 'POST',
        //     url: '/api/pos-reserve-product',
        //     data: {
        //         product: data,
        //         pos_customer_id: selectedCustomer.value,
        //         overall_quantity: quantityTotal.value,
        //         overall_total:overAllTotal.value
        //     }
        // }).then(response => {
        //     if (response.status === 200) {
        //         Swal.fire({
        //             position: "top-end",
        //             icon: "success",
        //             title: "Reserved",
        //             showConfirmButton: false,
        //             timer: 1500
        //         });
        //         selectedCustomer.value = ''
        //         itemSection.value = []
        //         quantityTotal.value = 0
        //         overAllTotal.value = 0
        //         childRef.value.GET_RESERVE_LIST_API()
        //     }

        // }).catch(e => {
        // console.log(e);

        //     Swal.fire('Customer already exist!'); 
        // })
    }
}
const submitSuccess = () => {
    selectedCustomer.value = ''
    itemSection.value = []
    quantityTotal.value = 0
    overAllTotal.value = 0
    childRef.value.GET_RESERVE_LIST_API()
    isAdminReserveModal.value = false
}

const closeReserve = () => {
    isAdminReserveModal.value = false
}

// watch(() => quantityEvent.value, (oldVal, newVal) => {
//     console.log(quantityEvent.value);

// })

const reserveHistory = (data) => {
    itemSection.value = JSON.parse(data.product)
    quantityTotal.value = data.overall_quantity
    overAllTotal.value = data.overall_total
    selectedCustomer.value = null
    console.log(data.name);

}
onMounted(() => {
    GET_CUSTOMER_API()
    POS_CATEGORY_API()
    POS_ITEM_API()
})
</script>

<template>
    <AdminReserveModal v-if="isAdminReserveModal" :posTableData="posTableData" @closeReserve="closeReserve"
        @submitSuccess="submitSuccess" :overAllTotal="overAllTotal" :quantityTotal="quantityTotal" />
    <PosModalReceipt v-if="posModalReceipt" @closeModalReceipt="closeModalReceipt" :itemSection="itemSection"
        :propsForCustomerName="propsForCustomerName" :overAllTotal="overAllTotal" />
    <AddCustomerModal v-if="addCustomerModal" @closeModal="closeModal" />
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <Button icon="pi pi-home" severity="contrast" label="Dashboard" @click="dashboardBtn" />
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row pos-section">
            <section class="col">
                <Message severity="contrast" icon="pi pi-ellipsis-v">Product</Message>

                <div class="item-table mt-2">
                    <table class="table table-hover table-striped table-responsive">
                        <thead>
                            <tr>
                                <th>Product Label</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data) in itemSection">
                                <td class="product_label">{{ data.product_label }}</td>
                                <td>
                                    <div class="quantity_action">
                                        <button @click="reduceQuantity(data)">-</button>
                                        <InputNumber :min="1" v-model="data.quantity"
                                            @input="(e) => tableQuantity(e, data)" />
                                        <button icon="pi pi-plus" severity="info" @click="addQuantity(data)">+</button>
                                    </div>
                                </td>
                                <td>
                                    <Message icon="pi pi-money-bill">P{{ data.product_price }}</Message>
                                </td>
                                <td>
                                    <Message severity="success">{{ data.total }}</Message>
                                </td>
                                <td>
                                    <Button severity="danger" icon="pi pi-trash" @click="deleteItem(data)" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="amount-edit mt-3">
                    <div class="">
                        <span>Quantity</span>
                        <h2>{{ !quantityTotal ? "0" : quantityTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") }}
                        </h2>
                        <!-- <Button severity="danger" label="Reserve" icon="pi pi-briefcase" @click="reserve" /> -->

                        <Button label="Reserve" severity="danger" icon="pi pi-inbox" @click="reserveBtn(itemSection)" />


                    </div>
                    <div class="">
                        <span>Grand Total</span>
                        <h2>P{{ !overAllTotal ? "0" : overAllTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
                        }}.00</h2>

                        <Button severity="primary" label="Cash" icon="pi pi-money-bill" @click="cashBtn"
                            :disabled="overAllTotal === 0" />
                    </div>
                </div>


            </section>
            <section class="col">
                <Message severity="contrast" icon="pi pi-ellipsis-v">Select Product</Message>
                <div class="category mt-2">
                    <select class="form-select" v-model="selectedItemList">
                        <option value="">all</option>
                        <option :value="data.product_name" v-for="(data) in posCategory">
                            {{ data.product_name }}
                        </option>
                    </select>
                    <InputGroup>
                        <InputText placeholder="Product" v-model="search" />
                        <InputGroupAddon>
                            <Button icon="pi pi-search" severity="secondary" variant="text" />
                        </InputGroupAddon>
                    </InputGroup>
                </div>
                <div class="item-list mt-3">
                    <div class="item" v-for="(data) in posItem" @click="addItem(data)">
                        <!-- <div class="">
                            <Button :label="data.quantity" rounded raised severity="warn" />
                        </div> -->
                        <div class="text-center mt-2">
                            <img :src="`storage/product_image/${data.image}`" width="100" alt="">
                        </div>
                        <div class="">
                            <h4>{{ data.product_label }}</h4>
                        </div>
                    </div>
                </div>
            </section>
            <ReserveList ref="childRef" @reserveHistory="reserveHistory" />
        </div>

    </div>
</template>

<style scoped>
section {
    background: white;
}

.pos-section {
    display: flex;
    gap: 10px;
    border-radius: 10px;
}

.pos-section>section {
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    padding: 10px;
}

.search {
    display: flex;
    gap: 5px;
    align-items: center;
    align-content: center;
}

.user-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.user-section figure {
    display: flex;
    gap: 10px;
    justify-content: start;
    align-items: center;
    align-content: center;
}

.item-table {
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    height: 20rem;
    overflow-y: scroll;

}

.item-table table th {
    background: rgb(226, 198, 145);
    color: white;
}

.amount-edit {
    display: flex;
    justify-content: end;
    text-align: center;
    gap: 10px;

}

.amount-edit>div {
    display: grid;
    align-items: center;
    justify-content: center;
    align-content: center;
    color: green;
}

.category {
    display: flex;
    gap: 10px;
}

.item-list {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    height: 27rem;
    overflow-y: scroll;
}

.item-list .item {
    display: grid;
    justify-content: center;
    align-items: start;
    padding: 2px;
    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    width: 15rem;
    overflow: hidden;
    height: 15rem;
}

.quantity_action {
    display: flex;
    flex-wrap: nowrap;
    width: 10px;
    gap: 5px;

}

::v-deep .p-inputtext {
    width: 4rem;
}

.quantity_action button {
    background: rgb(197, 217, 224);
    border: 0;
    border-radius: 5px;
    font-weight: bold;
}

.product_label {
    width: 40%;
}
</style>