<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarAccount from '@/components/Client_Navbar_Account.vue'
import ClientAddAddressBookModal from '@/components/Client_Add_Address_Modal.vue'
import { onMounted, ref } from 'vue';
import { Button } from 'primevue'


const clientAddAddressBookModal = ref(false)
const addressList = ref(Object)
const user = ref(Object)
const USER_API = async () => {
    try {
        const response = await axios.get('/api/user')
        user.value = response.data
    } catch (error) {

    }
}

const ADDRESS_LIST_API = async () => {
    try {
        const response = await axios.get('api/address-list')
        addressList.value = response.data
        console.log(response.data);
        
    } catch (error) {

    }
}

const addNewAddressBtn = () => {
    clientAddAddressBookModal.value = true
}

const closeModal = () => {
    ADDRESS_LIST_API()
    clientAddAddressBookModal.value = false

}



onMounted(() => {
    USER_API()
    ADDRESS_LIST_API()
})
</script>

<template>

    <Navbar />
    <NavbarCategory />
    <ClientAddAddressBookModal v-if="clientAddAddressBookModal" @closeModal="closeModal" />
    <section class="row" id="profile">
        <div class="col">
            <figure>
                <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="">
                <figcaption class="profile-figcaption text-dark">
                    <span>{{ user.first_name }} {{ user.last_name }}</span>
                    <br>
                    <small>{{ user.email }}</small>
                </figcaption>
            </figure>
        </div>
        <div class="col profile-action">
            <div class="">
               <Button label="Change Image" severity="contrast" icon="pi pi-pen-to-square" raised/>
            </div>
        </div>
        <hr>
    </section>

    <nav>
        <NavbarAccount />
    </nav>

    <section id="info">
        <article>
            <table class="table table-striped table-responsive">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Mobile No.</th>
                        <th>Floor Unit No.</th>
                        <th>Address</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(data, index) in addressList.data" :key="index">
                        <td>{{ index + 1 }}</td>
                        <td>{{ data.mobile_no }} {{ data.last_name }}</td>
                        <td>{{ data.floor_unit_no }}</td>
                        <td>{{ data.island }} - {{ data.regions }} - {{ data.province }} - {{ data.municipality }} - {{ data.barangay }}</td>
                        <td class="table-action">
                           <Button label="" rounded icon="pi pi-file-edit" size="small" severity="info" raised/>
                           <Button label="" rounded icon="pi pi-trash" size="small" severity="danger" raised/>
                        </td>
                    </tr>
                </tbody>

            </table>
            <div class="text-end">
                <Button @click="addNewAddressBtn" label="Add New Address" severity="success" raised />
            </div>
        </article>
    </section>
</template>

<style scoped>
#profile {
    max-width: 70%;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
    background: white;
    box-shadow: var(--floating-box-shadow);
    border-radius: var(--floating-border-radius);
    margin-top: 10px;
}

figure {
    display: flex;
    align-items: center;
    gap: 10px
}

.profile-figcaption {
    font-weight: 600;
}

.profile-action {
    display: flex;
    justify-content: end;
    align-items: center;
}

#info {
    max-width: 70%;
    margin: auto;
    padding: 10px;
    background: white;
    box-shadow: var(--floating-box-shadow);
    border-radius: var(--floating-border-radius);
}

#info table th {
    background: rgb(0, 0, 0);
    color: rgb(255, 255, 255);
}

#info table td {
    color: black;
    font-size: 15px;
    background: #ffffff;
}
.table-action{
    display: flex;
    gap:10px;
}
</style>
