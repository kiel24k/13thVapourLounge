<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarAccount from '@/components/Client_Navbar_Account.vue'
import ClientProfileModal from '@/components/Client_Edit_Profile_Modal.vue'
import { onMounted, ref } from 'vue';
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
                <button class="btn btn-dark">Edit Profile Picture</button>
               
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
                    <span>{{user.first_name}} {{ user.last_name }}</span>
                </div>
                <div class="col">
                    <label for="">Email Address</label>
                    <span>{{ user.email }}</span>
                </div>
                <div class="col">
                    <label for="">Mobile</label>
                    <span v-if="user.mobile_no === null">
                        <img src="/public/image/alert-blue-icon.png" width="15" alt="">
                    </span>
                    <span v-else>+63{{ user.mobile_no }}</span>
                </div>
            </div>
            <div class="row">
                <div class="col col-4">
                    <label for="">Birthday</label>
                    <span v-if="user.birthday === null">
                        <img src="/public/image/alert-blue-icon.png" width="15" alt="">
                    </span>
                    <span v-else>{{ user.birthday }}</span>
                </div>
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
            <button class="btn btn-primary" @click="editProfileBtn">Edit</button>
            <button class="btn btn-danger">Change Password</button>
        </div>
    </section>
</template>

<style scoped>
#profile {
    max-width: 70%;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
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
