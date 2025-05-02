<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { onMounted, ref, watch } from 'vue';
import ViewUserOrder from '@/components/Admin_View_User_Order.vue'
import StatusUpdate from '@/widgets/status_update.vue'
import { Button, InputGroup, InputGroupAddon, InputText, Select } from 'primevue';
import Swal from 'sweetalert2';




const showSidebar = ref(true)
const search = ref('')
const emit = defineEmits(['reserveHistory'])


//API VARIABLE
const reserveListData = ref({})

//API METHODS
const GET_RESERVE_LIST_API = async () => {
    await axios({
        method: 'GET',
        url: '/api/get-reserve-list',
        params: {
            search: search.value,
        }
    }).then(response => {
        reserveListData.value = response.data
    })
}


//components
const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}

const deleteBtn = (id) => {
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to restore this transaction!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            axios({
                method: 'DELETE',
                url: '/api/delete-reserve-list',
                params: {
                    id: id
                }
            })
            Swal.fire({
                title: "Deleted!",
                text: "Delete successful",
                icon: "success"
            });
            GET_RESERVE_LIST_API()
        }
    });
}

const continueBtn = (data) => {
    Swal.fire({
  title: "Are you sure?",
  text: "The current transaction will be void!",
  icon: "warning",
  showCancelButton: true,
  confirmButtonColor: "#3085d6",
  cancelButtonColor: "#d33",
  confirmButtonText: "Yes, view reservation!"
}).then((result) => {
  if (result.isConfirmed) {
    axios({
        method: 'DELETE',
        url: '/api/delete-reserve-list',
        params: {
            id: data.id
        }
    }).then(response => {
        if(response.status === 200){
            emit('reserveHistory', data)
            GET_RESERVE_LIST_API()
        }
    })
    Swal.fire({
      title: "Restored!",
      text: "Data has been restored.",
      icon: "success"
    });
  }
});
   
   


}
defineExpose({ GET_RESERVE_LIST_API })
watch(search, (oldVal, newVal) => {
    GET_RESERVE_LIST_API()
})
onMounted(() => {
    GET_RESERVE_LIST_API()
})

</script>

<template>
    <div id="section-one">
        <div class="content">
            <div class="main m-2">
                <section id="section-one" class="mt-4">
                    <div class="row">
                        <!-- <div class="col table-top">
                            <div class="search">
                                <Select v-model="category" :options="orderCategory" optionLabel="date_order"
                                    placeholder="select category" />
                                <Button label="clear" severity="secondary" raised @click="clear" />
                            </div>
                            <div class="category">
                                <InputGroup>
                                    <InputText placeholder="Search" v-model="search" />
                                    <InputGroupAddon>
                                        <Button icon="pi pi-search" severity="secondary" variant="text"
                                            @click="toggle" />
                                    </InputGroupAddon>
                                </InputGroup>
                            </div>
                        </div> -->
                    </div>
                </section>
                
                <section id="section-two" >
                <div class="row search">
                    <div class="col-3">
                        <InputGroup>
                            <InputGroupAddon>
                                <i class="pi pi-search"></i>
                            </InputGroupAddon>
                            <InputText v-model="search" placeholder="Search" />
                            <Button label="Clear" severity="secondary" raised/>
                        </InputGroup>
                    </div>
                </div>   
                    <table class="table table-hover table-responsive mt-3">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Notes</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in reserveListData">
                                <td>{{ index + 1 }}</td>
                                <td>{{ data.name }} </td>
                                <td>{{ data.note }}</td>
                                <td>
                                    <div class="table_action">
                                        <Button icon="pi pi-history" severity="info" raised
                                            @click="continueBtn(data)" title="Restore" />
                                        <Button icon="pi pi-trash" severity="danger" raised
                                            @click="deleteBtn(data.id)" title="Delete" />
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
#section-one {
    display: grid;
}

.content {
    display: flex;
}

.main {
    width: 100%;
}

table {
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    background: white;
    

}


section {
    margin: auto;
    
}

#section-two{
    height: 15rem;
    overflow-y: scroll
}

.table-action {
    display: flex;
    justify-content: start;
    align-items: center;
    gap: 10px;
}

.pag {
    display: flex;
    justify-content: center;
    align-items: center;
    align-content: center;
}



#section-two table th {
    background-color: var(--table-head-color);
    color: rgb(0, 0, 0);
    text-transform: capitalize;
}

#section-two table th:hover {
    transition: all linear 0.2s;
    background-color: rgb(99, 97, 97);
    color: white;
    cursor: pointer;
}

.table-top {
    display: flex;
    align-items: center;
    gap: 10px;
}

.table .product {
    display: grid;
}

.table_action {
    display: flex;
    gap: 5px;
    align-items: center;
}
</style>