<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { Button, InputGroup, InputGroupAddon, InputText, Message, Select } from 'primevue';
import Swal from 'sweetalert2';
import { onMounted, ref } from 'vue';
import AddNewStaffModal from '@/components/Add_New_Staff_Modal.vue'
import UpdateStaffModal from '@/components/Admin_Update_Staff_Modal.vue'
import Loader from '@/widgets/Loader.vue'
import { fa } from 'element-plus/es/locales.mjs';


const isLoading = ref(false)
const isAddNewStaffModal = ref(false)

const isUpdateStaffModal = ref(false)

const staffData = ref({})
const users = ref({})
const sortByOrder = ref('asc')
const sortByName = ref('first_name')
const userList = async (page) => {
    try {
        const response = await axios.get(`api/get-user-staff?page=${page}`, {
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



const deleteBtn = (id) => {
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
            const response = axios.post('api/delete-user', {
                id: id
            })
            Swal.fire({
                title: "Deleted!",
                text: "Your file has been deleted.",
                icon: "success"
            });
            userList()
        }
    });
}

const closeNewStaffModal = () => {
    isAddNewStaffModal.value = false
    userList()
}

const updateBtn = (data) => {
    isUpdateStaffModal.value = true
    staffData.value = data
}

const closeUpdateStaffModal = () => {
    isUpdateStaffModal.value = false
    userList()
}




onMounted(async () => {
    isLoading.value = true
    await userList()

    isLoading.value = false
})
</script>

<template>
    <Loader v-if="isLoading" />
    <AddNewStaffModal v-if="isAddNewStaffModal" @closeNewStaffModal="closeNewStaffModal" />
    <UpdateStaffModal v-if="isUpdateStaffModal" @closeUpdateStaffModal="closeUpdateStaffModal" :staffData="staffData" />
    <div id="section-one">
        <div class="header">
            <Header />
        </div>
        <div class="content">
            <div class="main">
                <section id="section-one" class="">
                    <div class="row mt-2">
                        <div class="col">
                            <Message icon="pi pi-list" severity="contrast">
                                Staff List
                            </Message>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col table-top">
                            <div class="search">
                                <InputGroup>
                                    <InputText placeholder="Keyword" />
                                    <InputGroupAddon>
                                        <Button icon="pi pi-search" severity="secondary" variant="text"
                                            @click="toggle" />
                                    </InputGroupAddon>
                                </InputGroup>
                            </div>
                            <div class="download">
                                <!-- <Button icon="pi pi-file-pdf" label="Print" severity="danger" raised /> -->
                            </div>
                            <div class="add_user">
                                <Button label="Add New Staff" icon="pi pi-user" @click="isAddNewStaffModal = true" />
                            </div>
                        </div>
                    </div>
                </section>
                <section id="section-two" class="mt-4">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th @click="sort('first_name')">First Name
                                    <!-- <span>{{ sortByOrder === 'asc' ? '▲' : '▼' }}</span> -->
                                </th>
                                <th @click="sort('last_name')">Last Name
                                    <!-- <span>{{ sortByOrder === 'asc' ? '▲' : '▼' }}</span> -->
                                </th>
                                <th @click="sort('email')">Email
                                    <!-- <span>{{ sortByOrder === 'asc' ? '▲' : '▼' }}</span> -->
                                </th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in users.data" :key="index">
                                <td>{{ index + 1 }}</td>
                                <td>{{ data.first_name }}</td>
                                <td>{{ data.last_name }}</td>
                                <td>{{ data.email }}</td>
                                <td class="table-action">
                                    <!-- <Button icon="pi pi-file-edit" severity="info" @click="updateBtn(data.id)"/> -->
                                    <Button icon="pi pi-trash" severity="danger" @click="deleteBtn(data.id)"
                                        title="Delete" />
                                    <Button icon="pi pi-pencil" severity="info" title="Edit" @click="updateBtn(data)" />

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

table {
    border-radius: var(--floating-border-radius);
    box-shadow: var(--floating-box-shadow);
}

table th {
    cursor: pointer;
    background-color: var(--table-head-color);
}

.table-top {
    display: flex;
    align-items: center;
    gap: 10px;
}

.pagination {
    display: flex;
    gap: 10px;
    align-items: center;
    justify-content: center;
}

.table-action {
    display: flex;
    gap: 10px;
    align-items: center;
    justify-content: start;

}
</style>