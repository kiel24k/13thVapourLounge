<script setup>
import { Button, InputGroup, InputGroupAddon, InputNumber, InputText, Message, Select } from 'primevue';
import { useRouter } from 'vue-router';
import AddCustomerModal from '@/components/Admin_Pos_Add_Customer_Modal.vue'
import { computed, onMounted, ref, watch } from 'vue';
import axios from 'axios';
import Swal from 'sweetalert2';
import PosModalReceipt from '@/components/Admin_Pos_Modal_Receipt.vue'

const router = useRouter()
const addCustomerModal = ref(false)
const itemSection = ref([])
const posModalReceipt = ref(false)


//API VARIABLE
const getCustomer = ref({})
const posCategory = ref({})
const posItem = ref({})



const selectedCustomer = ref({})
const propsForCustomerName = computed(() => {
    const customer = getCustomer.value.find((el) => el.id === selectedCustomer.value)
    return customer
})
const selectedItemList = ref({})
const customerProfile = ref({})
const search = ref()
const quantityTotal = ref()
const overAllTotal = ref()



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

const submitReserve = async () => {
    try {
        const response = await axios.post('api/pos-reserve', {
            data: itemSection.value,
            customer_id: selectedCustomer.value

        })
        console.log(response);
    } catch (e) {
        console.log(e);
    }
}

const reserve = () => {
    Swal.fire({
        title: "Dou you want to reserve?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Okay"
    }).then((result) => {
        if (result.isConfirmed) {
            submitReserve()
            Swal.fire({
                title: "Reserved!",
                text: "Reserve Success",
                icon: "success"
            });
        }
    });

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
watch(selectedCustomer, (oldVal, newVal) => {
    customerProfile.value = getCustomer.value.find((el) => el.id === selectedCustomer.value)
})

watch(selectedItemList, (oldVal, newVal) => {
    POS_ITEM_API()

})

watch(search, (oldVal, newVal) => {
    POS_ITEM_API()
})
const closeModal = () => {
    addCustomerModal.value = false

}

const cashBtn = () => {
    posModalReceipt.value = true
}

const closeModalReceipt = () => {
    posModalReceipt.value = false
}
onMounted(() => {
    GET_CUSTOMER_API()
    POS_CATEGORY_API()
    POS_ITEM_API()
})
</script>

<template>
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
                <Message severity="contrast" icon="pi pi-ellipsis-v">Select Customer</Message>
                <div class="search mt-2">
                    <InputGroup>
                        <select class="form-select" v-model="selectedCustomer">
                            <option :value="data.id" v-for="(data) in getCustomer">
                                {{ data.first_name }} {{ data.last_name }}
                            </option>
                        </select>
                        <InputGroupAddon>
                            <Button icon="pi pi-user-plus" severity="secondary" variant="text"
                                @click="addCustomerBtn" />
                        </InputGroupAddon>
                    </InputGroup>
                    <InputGroup>
                        <InputText placeholder="Product" />
                        <InputGroupAddon>
                            <Button icon="pi pi-search" severity="secondary" variant="text" />
                        </InputGroupAddon>
                    </InputGroup>
                </div>
                <div class="user-section mt-3">
                    <figure>
                        <i class="pi pi-user" style="font-size: 3rem"></i>
                        <figcaption>
                            <h2>{{ customerProfile.first_name }} </h2>
                            <p>{{ customerProfile.last_name }}</p>
                        </figcaption>
                    </figure>
                </div>
                <div class="item-table">
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
                                <td>{{ data.product_label }}</td>
                                <td>{{ data.quantity }}</td>
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
                <div class="amount-edit">
                    <div class="">
                        <span>Quantity</span>
                        <h2>{{ quantityTotal }}</h2>
                        <Button severity="danger" label="Reserve" icon="pi pi-briefcase" @click="reserve" />
                    </div>
                    <div class="">
                        <span>Grand Total</span>
                        <h2>P{{ overAllTotal }}</h2>
                        <Button severity="primary" label="Cash" icon="pi pi-money-bill" @click="cashBtn" />
                    </div>
                </div>


            </section>
            <section class="col">
                <Message severity="contrast" icon="pi pi-ellipsis-v">Select Category</Message>
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
                        <div class="">
                            <Button :label="data.quantity" rounded raised severity="warn" />
                        </div>
                        <div class="text-center mt-2">
                            <img :src="`storage/product_image/${data.image}`" width="100" alt="">
                        </div>
                        <div class="">
                            <h4>{{ data.product_label }}</h4>
                        </div>
                    </div>
                </div>
            </section>
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
</style>