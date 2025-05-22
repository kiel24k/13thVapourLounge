<script setup>
import Header from '@/components/Staff_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import AddProductModal from '@/components/Admin_Add_Product.vue'
import AddCategoryModal from '@/components/Admin_Add_Category.vue'
import NewCategoryNotification from '@/widgets/new_category_added.vue'
import { onMounted, ref, watch } from 'vue';
import axios from 'axios'
import { Button, InputGroup, InputGroupAddon, InputText, Select } from 'primevue'
import html2pdf from 'html2pdf.js'
import Swal from 'sweetalert2'
import UpdateProductModal from '@/components/Admin_Update_Product_Modal.vue'
import Loader from '@/widgets/Loader.vue'

const isLoading = ref(false)

const selectCategory = ref('')
const search = ref('')
const productListCategoryData = ref({})

const printContent = ref(null)
const addProductModal = ref(false)
const addCategoryModal = ref(false)
const isUpdateProductModal = ref(false)
const showSidebar = ref(true)
const productData = ref({})
const sortOrder = ref('desc')
const sortBy = ref('product_name')

const updateModalId = ref(null)

const pagination = ref({
    current_page: 1,
    last_page: 1,
    next_page_url: null,
    prev_page_url: null,
});

const PRODUCT_lIST_CATEGORY_API = () => {
    axios({
        method:'GET',
        url: 'api/product-list-category'
    }).then(response => {
        productListCategoryData.value = response.data
    })
}

const productList = async (page) => {
    try {
        const response = await axios.get(`api/product-list?page=${page}`, {
            params: {
                search: search.value,
                category: selectCategory.value,
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

const deleteProductBtn = (id) => {
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
                method: 'GET',
                url: 'api/delete-product',
                params: {
                    id: id
                }
            }).then(response => {
                response.status === 200 ? productList() : productList()
            })
            Swal.fire({
                title: "Deleted!",
                text: "Your file has been deleted.",
                icon: "success"
            })
        }
    });


}

const updateBtn = (id) => {
    updateModalId.value = id
    isUpdateProductModal.value = true
     
}

const closeUpdateModal = () => {
    isUpdateProductModal.value = false 
    productList()
}

const prevBtn = () => {
    if (pagination.value.prev_page_url) {
        productList(pagination.value.current_page - 1)
    }

}
const nextBtn = () => {
    if (pagination.value.next_page_url) {
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

watch(search, (oldVal,newVal) => {
    productList()

})

watch(selectCategory, (oldVal,newVal) => {
    productList()
})
 
onMounted(async() => {
     isLoading.value = true
   await Promise.all([
     PRODUCT_lIST_CATEGORY_API(),
    productList()
   ])
     isLoading.value = false
})

</script>

<template>
    <Loader v-if="isLoading"/>
    <div id="products">
        <div class="header">
            <AddProductModal v-if="addProductModal" @closeModal="closeModal" />
            <AddCategoryModal v-if="addCategoryModal" @closeModal="closeModal" @notification="notification" />
            <UpdateProductModal v-if="isUpdateProductModal" :updateModalId="updateModalId" @closeUpdateModal="closeUpdateModal" />
            <Header />
        </div>
        <div class="content">
            <div class="main">
                <section id="section-one" class="mt-4">
                    <div class="row">
                        <div class="col table-top">
                            <div class="category">
                                <Select v-model="selectCategory" :options="productListCategoryData" optionLabel="date_released" placeholder="Select date" />
                            </div>
                            <div class="search">
                                <InputGroup>
                                    <InputText placeholder="Search..." v-model="search" />
                                    <InputGroupAddon>
                                        <Button icon="pi pi-search" severity="secondary" variant="text"
                                            @click="toggle" />
                                    </InputGroupAddon>
                                </InputGroup>
                            </div>
                            <!-- <div class="download">
                                <Button icon="pi pi-file-pdf" label="Print" severity="danger" raised
                                    @click="printTable" />
                            </div> -->
                        </div>
                        <div class="col text-end">
                            <div class="table-top-action">
                                <Button @click="createCategoryBtn" label="New Category" icon="pi pi-plus-circle" raised
                                    severity="success" />
                                <Button @click="createProductBtn" label="Add Product" icon="pi pi-plus-circle" raised
                                    severity="success" />
                            </div>
                        </div>
                    </div>
                </section>
                <section id="section-two" class="mt-4" ref="printContent">
                    <table class="table table-hover table-bordered ">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th @click="sort('product_name')">
                                    <div class="table_header">
                                        <div class="table_head_title">
                                            Name
                                        </div>
                                        <div class="table_head_icon">
                                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                                        </div>
                                    </div>
                                </th>
                                <th @click="sort('product_label')">
                                    <div class="table_header">
                                        <div class="table_head_title">
                                            Label
                                        </div>
                                        <div class="table_head_icon">
                                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                                        </div>
                                    </div>
                                </th>
                                <th @click="sort('product_price')">
                                    <div class="table_header">
                                        <div class="table_head_title">
                                            Price
                                        </div>
                                        <div class="table_head_icon">
                                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                                        </div>
                                    </div>
                                </th>
                                <th @click="sort('quantity')">
                                    <div class="table_header">
                                        <div class="table_head_title">
                                            Quantity
                                        </div>
                                        <div class="table_head_icon">
                                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                                        </div>
                                    </div>
                                </th>
                                <th @click="sort('description')">
                                    <div class="table_header">
                                        <div class="table_head_title">
                                            Description
                                        </div>
                                        <div class="table_head_icon">
                                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                                        </div>
                                    </div>
                                </th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in productData.data" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td style="display: flex; gap:10px;">
                                    <div class="">
                                        <img :src="`/image/product_image/${data.image}`"
                                            width="40" height="40" alt="">
                                    </div>
                                    <div style="display: grid;">
                                        <span>{{ data.product_label }}</span>
                                       
                                        <small style="font-weight: 600; color:gray">{{ data.date_released }}</small>
                                    </div>
                                </td>
                                <td>{{ data.product_name }}</td>
                                <td>₱{{ data.product_price }}</td>

                                <td> x{{ data.quantity }} </td>
                                <td> {{ data.description }} </td>
                                <td class="table-action">
                                    <Button icon="pi pi-file-edit" severity="info" @click="updateBtn(data.id)" />
                                    <Button @click="deleteProductBtn(data.id)" icon="pi pi-trash" severity="danger"
                                        raised />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col text-center ">
                            <Button @click="prevBtn" :disabled="!pagination.prev_page_url" severity="contrast"
                                icon="pi pi-chevron-left" variant="text" rounded />
                            <span>{{ pagination.current_page }} of {{ pagination.last_page }}</span>
                            <Button @click="nextBtn" :disabled="!pagination.next_page_url" icon="pi pi-chevron-right"
                                severity="contrast" variant="text" rounded />
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
    margin-top:5rem;
 
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

.table-top {
    display: flex;
    align-items: center;
    gap: 10px;
}

.table-top-action {
    display: flex;
    align-items: center;
    gap: 10px;
    justify-content: end;

}


#section-two table th {
    cursor: pointer;
    background-color: var(--table-head-color);


}

.table_header {
    display: flex;
    justify-content: space-between;
    align-content: center;
}


table {
    border-radius: var(--floating-border-radius);
    box-shadow: var(--floating-box-shadow);
}

.table-action {
    display: flex;
    align-items: center;
    gap: 10px;
}
</style>