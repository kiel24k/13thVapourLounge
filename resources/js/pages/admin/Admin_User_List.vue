<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { onMounted, ref } from 'vue';

const showSidebar = ref(true)
const users = ref({})
const sortByOrder = ref('asc')
const sortByName = ref('first_name')
const userList = async (page) => {
    try {
        const response = await axios.get(`api/user-list?page=${page}`, {
            params: {
                sortByOrder: sortByOrder.value,
                sortByName: sortByName.value
            }
        })
        users.value = response.data
    } catch (error) {
        console.log(response);
    }
}

const sort = (column) => {
    if (sortByName.value === column) {
        sortByOrder.value = sortByOrder.value === 'asc' ? 'desc' : 'asc'
    } else {
        sortByOrder.value = 'asc'
        sortByName.value = column
    }
    userList()

}

const deleteBtn = async (id) => {
    try {
        const response = await axios.post('api/delete-user', {
            id: id
        })
        console.log(response);
        userList()

    } catch (error) {
        console.log(error);


    }
}


const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}

onMounted(() => {
    userList()
})
</script>

<template>
    <div id="section-one">
        <div class="header">
            <Header @closeSidebar="closeSidebar"/>
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar v-if="showSidebar" />
            </div>
            <div class="main m-2">
                <section id="section-one" class="mt-4">
                    <div class="row">
                        <div class="col">
                            <span>Products</span>
                            <span>Store</span>
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
                <section id="section-two" class="">
                    <table class="table table-hover ">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th @click="sort('first_name')">First Name
                                    <span>{{ sortByOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th @click="sort('last_name')">Last Name
                                    <span>{{ sortByOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th @click="sort('age')">Age
                                    <span>{{ sortByOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th @click="sort('address')">Address
                                    <span>{{ sortByOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th @click="sort('email')">Email
                                    <span>{{ sortByOrder === 'asc' ? '▲' : '▼' }}</span>
                                </th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in users.data" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ data.first_name }}</td>
                                <td>{{ data.last_name }}</td>
                                <td> {{ data.age }} </td>
                                <td>{{ data.address }}</td>
                                <td>{{ data.email }}</td>
                                <td class="action">
                                    <span>
                                        <button>
                                            <img src="/public/image/update-pencil-icon.svg" width="20px" alt="">
                                        </button>
                                        <button @click="deleteBtn(data.id)">
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
#section-one {
    display: grid;

}

.content {
    display: flex;
}

.main {
    width: 100%;
}
table th{
    cursor: pointer;
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