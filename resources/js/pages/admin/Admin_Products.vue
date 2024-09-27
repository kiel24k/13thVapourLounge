<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import AddProductModal from '@/components/Admin_Add_Product.vue'
import AddCategoryModal from '@/components/Admin_Add_Category.vue'
import NewCategoryNotification from '@/widgets/new_category_added.vue'
import { ref } from 'vue';

const addProductModal = ref(false)
const addCategoryModal = ref(false)
const newCategoryNotification = ref(false)
const showSidebar = ref(true)

const createProductBtn = () => {
    addProductModal.value = true
}
const createCategoryBtn = () => {
    addCategoryModal.value = true
}


const closeModal = () => {
    addProductModal.value = false
    addCategoryModal.value = false
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
    }else if(showSidebar.value === false){
        showSidebar.value = true
        
    }
}




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
                        <div class="col category-action">
                            <button class="btn btn-primary" @click="createProductBtn">
                                Create Product
                                <img src="/public/image/add-icon.png" width="20" alt="">
                            </button>
                            <button class="btn btn-primary" @click="createCategoryBtn">
                                New Category
                                <img src="/public/image/add-icon.png" width="20" alt="">
                            </button>
                        </div>
                        <div class="col">
                            <div class="table-action text-end">
                                <button>
                                    <img src="/public/image/search-glassess.png" width="25" alt="">
                                </button>
                                <button>
                                    <span>
                                        <img src="/public/image/burder-menu1.png" width="25" alt="">
                                        Columns
                                    </span>
                                </button>
                                <button>
                                    <span>
                                        <img src="/public/image/filter-icon.png" width="25px" alt="">
                                        filters
                                    </span>
                                </button>
                                |
                                <button class="btn btn-info text-white export">
                                    <img src="/public/image/download-icon.png" width="20px" alt="">
                                    Export
                                </button>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="section-two" class="mt-2">
                    <table class="table table-hover ">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>name</th>
                                <th>city</th>
                                <th>area</th>
                                <th>state</th>
                                <th>action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Kiel Bermudez</td>
                                <td>Cavite</td>
                                <td>Manila</td>
                                <td>Phillippines</td>
                                <td class="action">
                                    <span>
                                        <button>
                                            <img src="/public/image/update-pencil-icon.svg" width="20px" alt="">
                                        </button>
                                        <button>
                                            <img src="/public/image/delete-icon.png" width="20px" alt="">
                                        </button>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col text-center ">
                            <button>prev</button>
                            <span>1 2 3 4 5 6 7 8 9</span>
                            <button>next</button>
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


@media screen and (min-width: 769px) {
    section {
        margin: auto;
    }

    #section-two {
        overflow-x: auto;
    }

    #section-two table th {
        background: rgb(231, 239, 243);
        color: rgb(0, 0, 0);
        font-weight: 400;
        font-size: 400;
        text-transform: capitalize;
    }

    .table-action button:not(.export) {
        border: 1px solid rgb(163, 161, 161);
        border-radius: 7px;
        padding: 4px;
        background: transparent;
    }

    .action button {
        background: transparent;
        border: 0;

    }

}

@media screen and (max-width: 1116px) {
    section {
        width: 90%;
        margin: auto;
    }

    #section-two {
        overflow: auto;
    }

    #section-two table th {
        background: rgb(231, 239, 243);
        color: rgb(0, 0, 0);
        font-weight: 400;
        font-size: 400;
        text-transform: capitalize;
    }

    .table-action button:not(.export) {
        border: 1px solid rgb(163, 161, 161);
        border-radius: 7px;
        padding: 4px;
        background: transparent;
    }

    .action button {
        background: transparent;
        border: 0;

    }
}

@media screen and (min-width: 601px) {}
</style>