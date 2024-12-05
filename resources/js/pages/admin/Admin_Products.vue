<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import AddProductModal from '@/components/Admin_Add_Product.vue'
import AddCategoryModal from '@/components/Admin_Add_Category.vue'
import NewCategoryNotification from '@/widgets/new_category_added.vue'
import { onMounted, ref } from 'vue';
import axios from 'axios'
import { Button, InputGroup, InputGroupAddon, InputText, Select } from 'primevue'
import html2pdf from 'html2pdf.js'


const printContent = ref(null)
const addProductModal = ref(false)
const addCategoryModal = ref(false)
const newCategoryNotification = ref(false)
const showSidebar = ref(true)
const productData = ref({})
const sortOrder = ref('asc')
const sortBy = ref('product_name')

const pagination = ref({
    current_page: 1,
    last_page: 1,
    next_page_url: null,
    prev_page_url: null,
});

const productList = async (page) => {
    try {
        const response = await axios.get(`api/product-list?page=${page}`, {
            params: {
                sortOrder: sortOrder.value,
                sortBy: sortBy.value
            }
        })
        pagination.value = {
            current_page: response.data.current_page,
            last_page: response.data.last_page,
            next_page_url: response.data.next_page_url,
            prev_page_url: response.data.prev_page_url,
        }
        productData.value = response.data
    } catch (error) {
    }
}

const sort = (column) => {
    if (sortBy.value === column) {
        sortOrder.value = sortOrder.value === 'asc' ? 'desc' : 'asc'
    } else {
        sortOrder.value = 'asc'
        sortBy.value = column
    }
    productList()
}

const deleteProductBtn = async (id) => {
    const response = await axios.get('api/delete-product', {
        params: {
            id: id
        }
    })
    if (response.status === 200) {
        productList()
    }
}

const prevBtn = () => {
    if(pagination.value.prev_page_url){
    productList(pagination.value.current_page - 1)
  }

}
const nextBtn = () => {
    if(pagination.value.next_page_url){
    productList(pagination.value.current_page + 1)
  }

}

const createProductBtn = () => {
    addProductModal.value = true
}
const createCategoryBtn = () => {
    addCategoryModal.value = true
}
const closeModal = () => {
    addProductModal.value = false
    addCategoryModal.value = false
    productList()
}
const notification = () => {
    newCategoryNotification.value = true
    setTimeout(() => {
        newCategoryNotification.value = false
    }, 3000)
}

const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}

const printTable = () => {
    const elem = printContent.value
    const options = {
        margin: 1,
        filename: 'document.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' },
    };
    html2pdf()
        .from(elem)
        .set(options)
        .save();
};


onMounted(() => {
    productList()
})

</script>

<template>
    <div id="products">
        <div class="header">
            <NewCategoryNotification v-if="newCategoryNotification" />
            <AddProductModal v-if="addProductModal" @closeModal="closeModal" />
            <AddCategoryModal v-if="addCategoryModal" @closeModal="closeModal" @notification="notification" />
            <Header @closeSidebar="closeSidebar" />
        </div>
        <div class="content">
            <div class="sidebar ">
                <Sidebar v-if="showSidebar" />
            </div>
            <div class="main m-2">
                <section id="section-one" class="mt-4">
                    <div class="row">
                       <div class="col table-top">
                        <div class="category">
                            <Select/>
                        </div>
                        <div class="search">
                            <InputGroup>
                                <InputText placeholder="Keyword" />
                                <InputGroupAddon>
                                    <Button icon="pi pi-search" severity="secondary" variant="text" @click="toggle" />
                                </InputGroupAddon>
                            </InputGroup>
                        </div>
                        <div class="download">
                            <Button icon="pi pi-file-pdf" label="Print" severity="danger" raised @click="printTable"/>
                        </div>
                       </div>
                       <div class="col text-end">
                        <div class="table-top-action">
                            <Button @click="createCategoryBtn" label="New Category" icon="pi pi-plus-circle" raised severity="success"/>
                            <Button @click="createProductBtn" label="Add Product" icon="pi pi-plus-circle" raised severity="success"/>
                        </div>
                       </div>
                    </div>
                </section>
                <section id="section-two" class="mt-4" ref="printContent">
                    <table class="table table-hover ">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th @click="sort('product_name')">Name
                                    <span>{{ sortOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th @click="sort('product_label')">Label
                                    <span>{{ sortOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th @click="sort('product_price')">Price
                                    <span>{{ sortOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th>Image</th>
                                <th @click="sort('quantity')">Quantity
                                    <span>{{ sortOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th @click="sort('description')">Description
                                    <span>{{ sortOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th @click="sort('created_at')">Date
                                    <span>{{ sortOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in productData.data" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ data.product_name }}</td>
                                <td>{{ data.product_label }}</td>
                                <td>₱{{ data.product_price }}</td>
                                <td>
                                    <img :src="`http://127.0.0.1:8000/storage/product_image/${data.image}`" width="30" height="40" alt="">
                                </td>
                                <td> x{{ data.quantity }} </td>
                                <td> {{ data.description }} </td>
                                <td>{{ data.created_at }}</td>
                                <td class="table-action">
                                    <Button icon="pi pi-file-edit" severity="info"/>
                                   <Button @click="deleteProductBtn(data.id)" icon="pi pi-trash" severity="danger" raised/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col text-center ">
                            <Button @click="prevBtn" :disabled="!pagination.prev_page_url" icon="pi pi-chevron-left" severity="contrast" raised rounded />
                            <span>{{ pagination.current_page }} of {{ pagination.last_page }}</span>
                            <Button @click="nextBtn" :disabled="!pagination.next_page_url" icon="pi pi-chevron-right" severity="contrast" raised rounded />
                        </div>
                    </div>
                </section>
            </div>
        </div>

    </div>
</template>

<style scoped>
#products {
    display: grid;

}

.main {
    width: 100%;
}

.header {
    position: sticky;
    top: 0;
    z-index: 999;
}

.content {
    display: flex;
}

.category-action {
    display: flex;
    gap: 10px;
}

.category-input {
    display: flex;
}

.category-input input {
    height: 50px;
}
.table-top{
    display: flex;
    align-items: center;
    gap:10px;
}
.table-top-action {
    display: flex;
    align-items: center;
    gap:10px;
    justify-content: end;

}

#section-two table th {
    cursor: pointer;
    background-color: var(--table-head-color);
}
table{
    border-radius:var(--floating-border-radius);
    box-shadow: var(--floating-box-shadow);
}
.table-action{
    display: flex;
    align-items: center;
    gap:10px;
}



</style>