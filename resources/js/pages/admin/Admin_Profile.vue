<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { Button, FileUpload, FloatLabel, IftaLabel, Image, InputText, Toast } from 'primevue';
import { onMounted, ref } from 'vue';
import ChangePasswordModal from '@/components/Admin_Change_Password_Modal.vue'
import Swal from 'sweetalert2';

const isChangePasswordModal = ref(false)
const showSidebar = ref(true)
const userData = ref(Object)

//COMPONENTS VARIABLE
const src = ref(null);

//API FUNCTION
const GET_USER_API = async () => {
    await axios({
        method: 'GET',
        url: 'api/user'
    }).then(response => {
        userData.value = response.data
    })
}

//COMPONENTS FUNCTION
function onFileSelect(event) {
    const file = event.files[0];
    const reader = new FileReader();
    reader.onload = async (e) => {
        src.value = e.target.result;
    };

    reader.readAsDataURL(file);
}
const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}

const closeChangePasswordModal = () => {
    isChangePasswordModal.value = false
}

const discard = () => {
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, Discard it!"
    }).then((result) => {
        src.value = null
    });
}

//HOOKS
onMounted(() => {
    GET_USER_API()
})

</script>

<template>
    <ChangePasswordModal v-if="isChangePasswordModal" @closeChangePasswordModal="closeChangePasswordModal" />
    <div id="section-one">
        <div class="header">
            <Header @closeSidebar="closeSidebar" />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar v-if="showSidebar" />
            </div>
            <div class="main m-2 bg-white p-2 ">
                <Section>
                    <div class="row">
                        <div class="col">
                            <h2>Your Profile</h2>
                            <span>Last edit on 12 February 2024</span>
                        </div>
                        <div class="col text-end">
                            <Button label="Discard" icon="pi pi-save" severity="secondary" raised class="m-2"
                                @click="discard()" />
                            <Button label="Save" icon="pi pi-save" severity="help" raised class="m-2" />
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col profile_picture_header">
                            <span>
                                <i class="pi pi-image" style="color: rgb(168, 85, 247); font-size: 20px;"></i>
                                <b>Profile Picture</b>
                            </span>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col profile_picture_content_action">
                            <figure>
                                <Image v-if="src" :src="src" alt="Image" width="150" height="150"
                                    imageStyle="border-radius: 100%;" preview />

                                <Image src="image/370076_account_avatar_client_male_person_icon.png" alt="Image"
                                    width="150" preview imageStyle="border-radius: 100%;"
                                    v-else-if="userData.image === null" />

                                <Image src="https://randomuser.me/api/portraits/men/78.jpg" alt="Image" width="150"
                                    preview imageStyle="border-radius: 100%;"
                                    v-else-if="userData.image != null && src === null" />
                            </figure>
                            <div class="figure_action">
                                <FileUpload mode="basic" @select="onFileSelect" customUpload auto severity="secondary"
                                    class="p-button-outlined" />

                                <Button label="Delete picture" severity="danger" variant="outlined" />
                            </div>
                        </div>

                    </div>
                    <div class="row mt-4">
                        <div class="col personal_information">
                            <div class="row">
                                <div class="title">
                                    <span>
                                        <i class="pi pi-user" style="color:  rgb(168, 85, 247); font-size: 20px;"></i>
                                        <b>Personal Information</b>
                                    </span>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row mt-3">
                        <form action="">
                            <div class="row">
                                <div class="col-sm m-2">
                                    <label for="">First Name</label>
                                    <input type="text" class="form-control" v-model="userData.first_name">
                                </div>
                                <div class="col-sm m-2">
                                    <label for="">Middle Name</label>
                                    <input type="text" class="form-control" v-model="userData.middle_name">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm m-2">
                                    <label for="">Last Name</label>
                                    <input type="text" class="form-control" v-model="userData.last_name">
                                </div>
                                <div class="col-sm m-2">
                                    <label for="">Email</label>
                                    <input type="text" class="form-control" v-model="userData.email">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm m-2">
                                    <Button label="Change Password" severity="danger"
                                        @click="isChangePasswordModal = true" />
                                </div>
                            </div>

                        </form>
                    </div>
                </Section>


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
    border-radius: 10px;
    box-shadow: 0px 0px 10px gray;

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

.figure-profile img {
    border-radius: 100%;
    box-shadow: 0px 0px 5px 0px rgb(0, 171, 250);
    border: solid 1px black;
    padding: 2px;
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

.profile_picture_header span {
    display: flex;
    align-items: center;
    gap: 10px;
    align-content: center;
}

.profile_picture_header span b {
    font-size: 17px;
}

.profile_picture_content_action {
    display: flex;
    align-items: center;
    gap: 30px;
}

.figure_action {
    display: flex;
    gap: 10px;
}

.personal_information .title span {
    display: flex;
    gap: 10px;
    align-items: center;
}

.personal_information span b {
    font-size: 17px;
}

form {
    width: 30rem;
    margin: 0;
}

input:focus {
    outline: 0;
    box-shadow: none;
}

input {
    border: 2px solid rgb(214, 213, 213);
}
</style>