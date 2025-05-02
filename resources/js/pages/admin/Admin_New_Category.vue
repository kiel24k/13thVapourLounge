<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import AddCategoryModal from '@/components/Admin_Add_Category.vue'
import { onMounted, ref, watch } from 'vue';
import axios from 'axios'
import { Button, InputGroup, InputGroupAddon, InputText, Message, Select } from 'primevue'
import html2pdf from 'html2pdf.js'
import Swal from 'sweetalert2'
import UpdateCategoryModal from '@/components/Admin_Update_Category_Modal.vue'




const showSidebar = ref(true)
const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}

//COMPONENTS
const input = ref({})
const validation = ref({})
//API VARIABLES

//API FUNCTION
const submit = async () => {
    await axios({
        method: 'POST',
        url: 'api/create-category',
        data: {
            product_type: input.value.product_type,
            product_name: input.value.product_name,
            description: input.value.description
        }
    }).then(response => {
       if(response.status === 200){
        Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Category Added",
                showConfirmButton: false,
                timer: 1500
            });
            input.value = {}
            validation.value = {}
       }
        
    }).catch(e => {
         
        validation.value = e.response.data.errors
        
       
        
        
    })
   
}

//HOOKS
</script>

<template>
    <div id="products">
        <div class="header">
            <Header @closeSidebar="closeSidebar" />
        </div>
        <div class="content">
            <div class="sidebar ">
                <Sidebar v-if="showSidebar" />
            </div>
            <div class="main m-2">
                <section>
                    <form action="" class="mt-5">
                        <div class="row">
                            <div class="col form-title mb-3">
                               <Message severity="info">
                                <h2>New Category</h2>
                               </Message>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mt-3">
                                <label for="">Product type</label>
                                <input type="text" class="form-control" v-model="input.product_type">
                                <span v-if="validation.product_type">{{ validation.product_type[0] }}</span>
                               
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mt-3">
                                <label for="">Product name</label>
                                <input type="text" class="form-control" v-model="input.product_name">
                                <span v-if="validation.product_name">{{ validation.product_name[0] }}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mt-3">
                                <label for="">Description</label>
                                <textarea cols="20" rows="5" type="text" class="form-control" v-model="input.description">
                                </textarea>
                                <span v-if="validation.description">{{ validation.description[0] }}</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-end mt-4 form_action">
                               <router-link :to="{name: 'admin-category-list'}">
                                <Button label="Category list" severity="danger" icon="pi pi-list"/>
                               </router-link>
                                <Button label="Submit" raised severity="info" @click="submit()"/>
                            </div>
                        </div>
                    </form>
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
section form {
    width: 50%;
    margin:auto;
    background: white;
    padding:20px;
    box-shadow: 0px 0px 10px 0px gray;
    border-radius: 10px;
}
.form_action{
    display: flex;
    gap:10px;
    justify-content: end;
}
form span{
    color:red;
}
</style>