<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { onMounted, ref } from 'vue';
import AdminEditProfile from '@/components/Admin_Edit_Profile.vue'

const user = ref(Object)
const isAdminEditProfile = ref(false)

const USER_API = async () => {
    try {
        const response = await axios.get('api/user')
        user.value = response.data
    } catch (error) {

    }

}

const editProfileBtn = () => {
    isAdminEditProfile.value = true
}

const closeModal = () => {
    isAdminEditProfile.value = false
    USER_API()
}

onMounted(() => {
    USER_API()
})

</script>

<template>
    <AdminEditProfile v-if="isAdminEditProfile" @closeModal="closeModal" :user="user"/>
    <div id="section-one">
        <div class="header">
            <Header />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar />
            </div>
            <div class="main m-2 ">
                <div class="row" id="profile">
                    <div class="col">
                        <figure>
                            <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="">
                            <figcaption class="profile-figcaption text-dark">
                                <span>{{ user.first_name }} {{ user.last_name }}</span>
                            </figcaption>
                        </figure>

                    </div>
                    <div class="col profile-action">
                        <div class="">
                            <button class="btn btn-dark" @click="editProfileBtn">Edit Profile</button>
                        </div>
                    </div>
                    <hr>
                </div>
                <section id="info">
                    <article>
                        <h2>Info</h2>
                        <div class="content">
                            <figure class="figure-info">
                                <img src="/public/image/gmail-icon.png" width="50" alt="">
                                <figcaption class="figure-figcaption">
                                    {{ user.email }}
                                </figcaption>
                            </figure>
                        </div>
                        <div class="content">
                            <figure class="figure-info">
                               <span>First Name:</span>
                                <figcaption class="figure-figcaption">
                                   {{user.first_name}}
                                </figcaption>
                            </figure>
                        </div>
                        <div class="content">
                            <figure class="figure-info">
                                <span>Last Name:</span>
                                <figcaption class="figure-figcaption">
                                    {{ user.last_name }}
                                </figcaption>
                            </figure>
                        </div>
                        
                    </article>
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

#profile {
    max-width: 60rem;
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
    max-width: 60rem;
    margin: auto;
    box-shadow: 0px 0px 5px 0px gray;
    border-radius: 5px;
    padding: 10px;
    background: white;

}

.figure-info {
    display: flex;
}

.figure-figcaption {
    font-weight: 600;
}
</style>