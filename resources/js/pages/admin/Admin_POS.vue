<script setup>
import { Button, InputGroup, InputGroupAddon, InputNumber, InputText, Message, Select } from 'primevue';
import { useRouter } from 'vue-router';
import AddCustomerModal from '@/components/Admin_Pos_Add_Customer_Modal.vue'
import { onMounted, ref } from 'vue';

const router = useRouter()
const addCustomerModal = ref(false)
const getCustomer = ref({})
const selectedCustomer = ref({})


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

const userSelectedName = () => {
    alert(":asdasd")
}

const closeModal = () => {
    addCustomerModal.value = false
}


onMounted(() => {
    GET_CUSTOMER_API()
})
</script>

<template>
    <AddCustomerModal v-if="addCustomerModal" @closeModal="closeModal"/>
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
                            <option selected>dasds</option>
                            <option :value="data.id" v-for="(data) in getCustomer">
                                {{ data.first_name }} {{ data.last_name }}
                            </option>
                        </select>
                        <InputGroupAddon>
                            <Button icon="pi pi-user-plus" severity="secondary" variant="text" @click="addCustomerBtn" />
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
                            <h2>Rhonalyn</h2>
                            <p>Sales</p>
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
                <div class="category">
                    <select class="form-select">
                        <option value="">all</option>
                        <option value=""></option>
                    </select>
                    <InputGroup>
                        <InputText placeholder="Product" />
                        <InputGroupAddon>
                            <Button icon="pi pi-search" severity="secondary" variant="text" />
                        </InputGroupAddon>
                    </InputGroup>
                </div>
                <div class="item-list mt-3">
                    <div class="item">
                        <div class="item-quantity">
                          <Button severity="contrast" label="23" rounded raised size="small"/>
                        </div>
                        <div class="text-center">
                            <img src="/public/image/gmail-icon.png" alt="">
                        </div>
                        <div class="">
                            <h4>Item ni kiel </h4>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-quantity">
                            <Button severity="contrast" label="23" rounded raised size="small"/>
                        </div>
                        <div class="text-center">
                            <img src="/public/image/gmail-icon.png" alt="">
                        </div>
                        <div class="">
                            <h4>Item ni kiel </h4>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-quantity">
                            <Button severity="contrast" label="23" rounded raised size="small"/>
                        </div>
                        <div class="text-center">
                            <img src="/public/image/gmail-icon.png" alt="">
                        </div>
                        <div class="">
                            <h4>Item ni kiel </h4>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-quantity">
                            <Button severity="contrast" label="23" rounded raised size="small"/>
                        </div>
                        <div class="text-center">
                            <img src="/public/image/gmail-icon.png" alt="">
                        </div>
                        <div class="">
                            <h4>Item ni kiel </h4>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-quantity">
                            <Button severity="contrast" label="23" rounded raised size="small"/>
                        </div>
                        <div class="text-center">
                            <img src="/public/image/gmail-icon.png" alt="">
                        </div>
                        <div class="">
                            <h4>Item ni kiel </h4>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-quantity">
                            <Button severity="contrast" label="23" rounded raised size="small"/>
                        </div>
                        <div class="text-center">
                            <img src="/public/image/gmail-icon.png" alt="">
                        </div>
                        <div class="">
                            <h4>Item ni kiel </h4>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-quantity">
                            <Button severity="contrast" label="23" rounded raised size="small"/>
                        </div>
                        <div class="text-center">
                            <img src="/public/image/gmail-icon.png" alt="">
                        </div>
                        <div class="">
                            <h4>Item ni kiel </h4>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-quantity">
                            <Button severity="contrast" label="23" rounded raised size="small"/>
                        </div>
                        <div class="text-center">
                            <img src="/public/image/gmail-icon.png" alt="">
                        </div>
                        <div class="">
                            <h4>Item ni kiel </h4>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>

<style scoped>
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
    gap:10px;
}

.item-list .item {
    display: grid;
    align-content: center;
    justify-content: center;
    align-items: center;
    padding:8px;
    background-color: rgb(214, 208, 198);
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);     
}
</style>