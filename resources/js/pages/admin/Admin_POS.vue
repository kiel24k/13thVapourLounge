<script setup>
import { Button, InputGroup, InputGroupAddon, InputNumber, InputText, Message, Select } from 'primevue';
import { useRouter } from 'vue-router';
import AddCustomerModal from '@/components/Admin_Pos_Add_Customer_Modal.vue'
import { computed, onMounted, ref, watch } from 'vue';
import axios from 'axios';

const router = useRouter()
const addCustomerModal = ref(false)

//API VARIABLE
const getCustomer = ref({})
const posCategory = ref({})
const posItem = ref({})


const selectedCustomer = ref({})
const selectedItemList = ref({})
const customerProfile = ref({})


const dashboardBtn = () => {
    router.push('/admin-dashboard')
}

const addCustomerBtn = () => {
    addCustomerModal.value = true

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
            product_name: selectedItemList.value
        }
    })
    console.log(response);
    posItem.value = response.data

}
watch(selectedCustomer, (oldVal, newVal) => {
    customerProfile.value = getCustomer.value.find((el) => el.id === selectedCustomer.value)
})

watch(selectedItemList, (oldVal, newVal) => {
    POS_ITEM_API()
})






const closeModal = () => {
    addCustomerModal.value = false
}


onMounted(() => {
    GET_CUSTOMER_API()
    POS_CATEGORY_API()
    POS_ITEM_API()
})
</script>

<template>
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
                                <th>Item name</th>
                                <th>Stock</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Subtotal</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Radio watch</td>
                                <td>55</td>
                                <td>
                                    <b>test</b>
                                </td>
                                <td>
                                    <Message severity="success">P20.00</Message>
                                </td>
                                <td>
                                    <Message severity="info">P20.00</Message>
                                </td>
                                <td>
                                    <Button severity="danger" icon="pi pi-trash" />
                                </td>
                            </tr>


                            <tr>
                                <td>Radio watch</td>
                                <td>55</td>
                                <td>
                                    <b>test</b>
                                </td>
                                <td>
                                    <Message severity="success">P20.00</Message>
                                </td>
                                <td>
                                    <Message severity="info">P20.00</Message>
                                </td>
                                <td>
                                    <Button severity="danger" icon="pi pi-trash" />
                                </td>
                            </tr>

                            <tr>
                                <td>Radio watch</td>
                                <td>55</td>
                                <td>
                                    <b>test</b>
                                </td>
                                <td>
                                    <Message severity="success">P20.00</Message>
                                </td>
                                <td>
                                    <Message severity="info">P20.00</Message>
                                </td>
                                <td>
                                    <Button severity="danger" icon="pi pi-trash" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="amount-edit">
                    <div class="">
                        <span>Quantity</span>
                        <h2>5</h2>
                        <Button severity="danger" label="Reserve" icon="pi pi-briefcase" />
                    </div>
                    <div class="">
                        <span>Grand Total</span>
                        <h2>P232.00</h2>
                        <Button severity="primary" label="Cash" icon="pi pi-money-bill" />
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
                        <InputText placeholder="Product" />
                        <InputGroupAddon>
                            <Button icon="pi pi-search" severity="secondary" variant="text" />
                        </InputGroupAddon>
                    </InputGroup>
                </div>
                <div class="item-list mt-3">
                    <div class="item" v-for="(data) in posItem">
                        <div class="item-quantity text-start">
                            <Button severity="warn" :label="data.quantity" rounded raised size="small" />
                        </div>
                        <div class="text-center">
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
    overflow:hidden;
    height: 15rem;
}
</style>