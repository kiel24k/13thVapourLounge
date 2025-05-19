<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { Button, InputGroup, InputGroupAddon, InputText, Select } from 'primevue';
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

const updateBtn = () => {
    alert("update success")
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




onMounted(() => {
    userList()
})
</script>

<template>
    <div id="section-one">
        <div class="header">
            <Header />
        </div>
        <div class="content">
            <div class="main">
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
                             <Button icon="pi pi-file-pdf" label="Print" severity="danger" raised/>
                         </div>
                        </div>
                     </div>
                </section>
                <section id="section-two" class="mt-4">
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
                                <th @click="sort('gender')">Gender
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
                                <td> {{ data.gender }} </td>
                                <td>{{ data.address }}</td>
                                <td>{{ data.email }}</td>
                                <td class="table-action">
                                    <!-- <Button icon="pi pi-file-edit" severity="info" @click="updateBtn(data.id)"/> -->
                                    <Button icon="pi pi-trash" severity="danger" @click="deleteBtn(data.id)"/>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col pagination">
                            <Button icon="pi pi-chevron-left" rounded severity="contrast" raised/>
                            <span>1 of 10</span>
                            <Button icon="pi pi-chevron-right" rounded severity="contrast" raised/>
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
    margin-top: 5rem;
}
table{
    border-radius: var(--floating-border-radius);
    box-shadow: var(--floating-box-shadow);
}
table th{
    cursor: pointer;
    background-color: var(--table-head-color);
}
.table-top{
    display: flex;
    align-items: center;
    gap:10px;
}
.pagination{
    display: flex;
    gap:10px;
    align-items: center;
    justify-content: center;
}
.table-action{
    display: flex;
    gap:10px;
    align-items: center;
    justify-content: start;

}



</style>