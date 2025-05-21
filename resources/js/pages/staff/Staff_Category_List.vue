<script setup>
import Header from '@/components/Staff_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import AddCategoryModal from '@/components/Admin_Add_Category.vue'
import { onMounted, ref, watch } from 'vue';
import axios from 'axios'
import { Button, InputGroup, InputGroupAddon, InputText, Select } from 'primevue'
import html2pdf from 'html2pdf.js'
import Swal from 'sweetalert2'
import UpdateCategoryModal from '@/components/Admin_Update_Category_Modal.vue'
import Loader from '@/widgets/Loader.vue';

const search = ref('')
const categoryTableData = ref({})



const printContent = ref(null)
const addProductModal = ref(false)
const addCategoryModal = ref(false)
const isUpdateCategoryModal = ref(false)
const showSidebar = ref(true)
const sortOrder = ref('desc')
const sortBy = ref('product_name')
const table_action_icon = ref(true)
const isLoader = ref(false)

const updateModalId = ref(null)

const pagination = ref({
    current_page: 1,
    last_page: 1,
    next_page_url: null,
    prev_page_url: null,
});



const CATEGORY_TABLE_API = async (page = 1) => {
    await axios({
        method: 'GET',  
        url: '/api/category-table',
        params: {
            sortBy: sortBy.value,
            sortOrder: sortOrder.value,
            search: search.value
        }
    }).then(response => {
        console.log(response);
        
        categoryTableData.value = response.data
    })

}

const sort = (column) => {
    if (sortBy.value === column) {
        sortOrder.value = sortOrder.value === 'asc' ? 'desc' : 'asc'
    } else {
        sortOrder.value = 'asc'
        sortBy.value = column
    }
    CATEGORY_TABLE_API()
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
                method: 'DELETE',
                url: 'api/delete-product-category',
                params: {
                    id: id
                }
            }).then(response => {
                response.status === 200 ?   CATEGORY_TABLE_API() :   CATEGORY_TABLE_API()
            })
            Swal.fire({
                title: "Deleted!",
                text: "Your category has been deleted.",
                icon: "success"
            })
        }
    });


}

const updateBtn = (id) => {
    updateModalId.value = id
    isUpdateCategoryModal.value = true

}

const closeUpdateModal = () => {
    isUpdateCategoryModal.value = false
   CATEGORY_TABLE_API()
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
const closeModal = () => {
    addProductModal.value = false
    addCategoryModal.value = false
    productList()
}




const printTable = () => {

    table_action_icon.value = false
    const elem = printContent.value
    const options = {
        margin: 1,
        filename: 'Category List.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' },
    };
    setTimeout(() => {
table_action_icon.value = true

    }, 500)
    html2pdf()
        .from(elem)
        .set(options)
        .save();
};



watch(search, (oldVal, newVal) => {
    
    CATEGORY_TABLE_API()

})



onMounted(async () => {
    isLoader.value = true
   await CATEGORY_TABLE_API()
   isLoader.value = false
})

</script>

<template>
    <Loader v-if="isLoader"/>
    <div id="products">
        <div class="header">
            <AddCategoryModal v-if="addCategoryModal" @closeModal="closeModal" @notification="notification" />
            <UpdateCategoryModal v-if="isUpdateCategoryModal" :updateModalId="updateModalId"
                @closeUpdateModal="closeUpdateModal" />
            <Header />
        </div>
        <div class="content">
            <div class="main">
                <section id="section-one" class="mt-4">
                    <div class="row">
                        <div class="col table-top">
                            <div class="search">
                                <InputGroup>
                                    <InputText placeholder="Keyword" v-model="search" />
                                    <InputGroupAddon>
                                        <Button icon="pi pi-search" severity="secondary" variant="text"
                                            @click="toggle" />
                                    </InputGroupAddon>
                                </InputGroup>
                            </div>
                            <div class="download">
                                <Button icon="pi pi-file-pdf" label="Print" severity="danger" raised
                                    @click="printTable" />
                            </div>
                        </div>
                        <div class="col text-end">
                            <div class="table-top-action">
                              <router-link :to="{name: 'staff-new-category'}">
                                <Button  label="New Category" icon="pi pi-plus-circle" raised
                                severity="success" />
                              </router-link>
                               <router-link :to="{name: 'staff-products'}">
                                <Button icon="pi pi-list" label="Product List" raised
                                severity="info" />
                               </router-link>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="section-two" class="mt-4" ref="printContent">
                    <table class="table table-hover table-bordered ">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th @click="sort('product_type')">
                                    <div class="table_header">
                                        <div class="table_head_title">
                                            Product type
                                        </div>
                                        <div class="table_head_icon" v-if="table_action_icon">
                                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                                        </div>
                                    </div>
                                </th>
                                <th @click="sort('product_name')">
                                    <div class="table_header">
                                        <div class="table_head_title">
                                            Product name
                                        </div>
                                        <div class="table_head_icon" v-if="table_action_icon">
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
                                        <div class="table_head_icon" v-if="table_action_icon">
                                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                                        </div>
                                    </div>
                                </th>
                                <th v-if="table_action_icon">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in categoryTableData" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ data.product_type }}</td>
                                <td>{{ data.product_name }}</td>
                                <td> {{ data.description }} </td>
                                <td class="table-action" v-if="table_action_icon">
                                    <Button icon="pi pi-file-edit" severity="info" @click="updateBtn(data.id)" />
                                    <Button @click="deleteProductBtn(data.id)" icon="pi pi-trash" severity="danger"
                                        raised />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row" v-if="table_action_icon">
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