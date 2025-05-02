<script setup>
import Footer from '@/components/Client_Footer.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarAccount from '@/components/Client_Navbar_Account.vue'
import ClientProfileModal from '@/components/Client_Edit_Profile_Modal.vue'
import { onMounted, ref } from 'vue';
import { Button, Message } from 'primevue'
const user = ref(Object)
const clientProfileModal = ref(false)
const USER_API = async () => {
    try {
        const response = await axios.get('/api/user')
        user.value = response.data
    } catch (error) {

    }
}

const editProfileBtn = () => {
    clientProfileModal.value = true
}

const closeModal = () => {
    clientProfileModal.value = false
    USER_API()
}

onMounted(() => {
    USER_API()

})
</script>

<template>
    <Navbar />
    <NavbarCategory />
    <ClientProfileModal v-if="clientProfileModal" @closeModal="closeModal" />
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
               <!-- <Button label="Change Image" severity="contrast" icon="pi pi-pen-to-square" raised/> -->
            </div>
        </div>
        <hr>
    </section>
    <nav>
        <NavbarAccount />
    </nav>

    <section id="info">
        <article class="profile">
            <div class="row">
                <div class="col">
                    <label for="">Full Name</label>
                   <Message severity="success">{{user.first_name}} {{ user.last_name }}</Message>
                </div>
                <div class="col">
                    <label for="">Email Address</label>
                    <span> <i class="pi pi-envelope"></i> <b>{{ user.email }}</b></span>
                </div>
                <div class="col">
                    <label for="">Mobile</label>
                    <span v-if="user.mobile_no === null">
                        <img src="/public/image/alert-blue-icon.png" width="15" alt="">
                    </span>
                    <span v-else>{{ user.mobile_no }}</span>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="">Gender</label>
                    <span v-if="user.gender === null">
                        <img src="/public/image/alert-blue-icon.png" width="15" alt="">
                    </span>
                    <span v-else>{{ user.gender }}</span>
                </div>
            </div>
        </article>
        <div class="action">
            <Button @click="editProfileBtn" icon="pi pi-pen-to-square" label="Edit" severity="info" raised/>
            <Button label="Change Password" icon="" severity="danger" raised/>
        </div>
    </section>
    <Footer/>
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

#info .profile .col {
    display: grid;
    gap: 10px;
    margin-top: 20px;
}

#info .profile .col label {
    font-size: 12px;
}

#info .profile .col span {
    font-size: 14px;
    color: rgb(2, 92, 92);
}

.profile {
    display: grid;
}

.action {
    display: grid;
    justify-content: start;
    gap: 10px;
    margin-top: 10px;
}
</style>
