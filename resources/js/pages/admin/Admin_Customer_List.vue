<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import AddCategoryModal from '@/components/Admin_Add_Category.vue'
import { onMounted, ref, watch } from 'vue';
import axios from 'axios'
import { Button, InputGroup, InputGroupAddon, InputText, Select } from 'primevue'
import html2pdf from 'html2pdf.js'
import Swal from 'sweetalert2'
import UpdateCategoryModal from '@/components/Admin_Update_Category_Modal.vue'
import Loader from '@/widgets/Loader.vue';





const printContent = ref(null)

const showSidebar = ref(true)

const isLoader = ref(false)

//API VARIABLES
const customerListData = ref({})

//API FUNCTION
const GET_CUSTOMER_LIST_API = async () => {
    await axios({
        method: 'GET',
        url: '/api/get-customer-list'
    }).then(response => {
        customerListData.value = response.data
    })
}









const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}




const deleteBtn =  (id) => {
  

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
        url: '/api/delete-customer',
        params: {
            id: id
        }
    })
    Swal.fire({
      title: "Deleted!",
      text: "Your file has been deleted.",
      icon: "success"
    });
    GET_CUSTOMER_LIST_API()
  }
});
}




onMounted(() => {
    GET_CUSTOMER_LIST_API()

})

</script>

<template>
    <Loader v-if="isLoader" />
    <div id="products">
        <div class="header">
            <Header @closeSidebar="closeSidebar" />
        </div>
        <div class="content">
            <div class="sidebar ">
                <Sidebar v-if="showSidebar" />
            </div>
            <div class="main m-2">
                <section id="section-one" class="mt-4">
                    <!-- <div class="row">
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
                              <router-link :to="{name: 'admin-new-category'}">
                                <Button  label="New Category" icon="pi pi-plus-circle" raised
                                severity="success" />
                              </router-link>
                               <router-link :to="{name: 'admin-products'}">
                                <Button icon="pi pi-list" label="Product List" raised
                                severity="info" />
                               </router-link>
                            </div>
                        </div>
                    </div> -->
                </section>
                <section id="section-two" class="mt-4" ref="printContent">
                    <table class="table table-hover table-bordered ">
                        <thead>
                            <th>#</th>
                            <th>Name</th>
                            <th>Note</th>
                            <th>Action</th>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in customerListData">
                                <td>{{ index + 1 }}</td>
                                <td>{{ data.name }}</td>
                                <td>{{ data.note }}</td>
                                <td>
                                    <div class="table_action">
                                        <Button icon="pi pi-trash" severity="danger" @click="deleteBtn(data.id)" raised title="Delete"/>
                                    </div>
                                </td>


                            </tr>
                        </tbody>
                    </table>

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

.table_action {
    display: flex;
    gap: 5px;
}
</style>