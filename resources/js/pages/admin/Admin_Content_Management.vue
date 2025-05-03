<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { Button, FloatLabel, InputText, Message, Select, Textarea } from 'primevue'
import { ref } from 'vue'
import AdminCmsTitleModal from '@/components/Admin_Cms_Title.vue'
import AdminCmsHeroModal from '@/components/Admin_Cms_Hero.vue'
import AdminCmsAboutUsModal from '@/components/Admin_Cms_About_Us.vue'
import AdminCmsServiceModal from '@/components/Admin_Cms_Service.vue'
import AdminCmsContactModal from '@/components/Admin_Cms_Contact.vue'

const showSidebar = ref(true)

//COMPONENT VARIABLES
const isAdminCmsTitleModal = ref(false)
const isAdminCmsHeroModal = ref(false)
const isAdminCmsAboutUsModal = ref(false)
const isAdminCmsServiceModal = ref(false)
const isAdminCmsContactModal = ref(false)

//COMPONENT FUNCTION 
//TITLE
const title = () => {
    isAdminCmsTitleModal.value = true
}
const closeAdminCmsTitle = () => {
    isAdminCmsTitleModal.value = false
}

//HERO
const hero = () => {
isAdminCmsHeroModal.value = true
}

const closeAdminCmsHero = () => {
    isAdminCmsHeroModal.value = false
}

//ABOUT US
const aboutUs = () => {
    isAdminCmsAboutUsModal.value = true
}
const closeAdminCmsAboutUs = () =>{
    isAdminCmsAboutUsModal.value = false
}

//SERVICE
const service = () => {
    isAdminCmsServiceModal.value = true
}

const closeAdminCmsService = () => {
    isAdminCmsServiceModal.value = false
}

//CONTACTS
const contacts = () => {
    isAdminCmsContactModal.value = true
}

const closeAdminCmsContact = () => {
    isAdminCmsContactModal.value = false
}


const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}


</script>

<template>
    <AdminCmsTitleModal v-if="isAdminCmsTitleModal" @closeAdminCmsTitle="closeAdminCmsTitle"/>
    <AdminCmsHeroModal v-if="isAdminCmsHeroModal" @closeAdminCmsHero="closeAdminCmsHero"/>
    <AdminCmsAboutUsModal v-if="isAdminCmsAboutUsModal" @closeAdminCmsAboutUs="closeAdminCmsAboutUs"/>
    <AdminCmsServiceModal v-if="isAdminCmsServiceModal" @closeAdminCmsService="closeAdminCmsService"/>
    <AdminCmsContactModal v-if="isAdminCmsContactModal" @closeAdminCmsContact="closeAdminCmsContact"/>
    <div id="section-one">
        <div class="header">
            <Header @closeSidebar="closeSidebar" />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar v-if="showSidebar" />
            </div>
            <div class="main m-2">
                <section>
                    <Message severity="secondary">
                        <h4>Content Management</h4>
                    </Message>
                    <div class="row mt-3">
                        <div class="col content_section">
                            <div class="title" @click="title()">
                                <span>
                                    <h3>Title</h3>
                                    <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Commodi obcaecati
                                        aperiam
                                        in. Tempore doloribus magnam ullam nobis eligendi dolores minus provident
                                        dolorum,
                                        deleniti accusantium rem expedita asperiores iste perferendis unde?
                                    </p>
                                </span>
                                <i class="pi pi-pencil text-end"></i>

                            </div>
                            <div class="hero" @click="hero()">
                                <span>
                                    <h3>Hero</h3>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing</p>
                                </span>
                                <i class="pi pi-pencil text-end"></i>
                            </div>
                            <div class="about_us" @click="aboutUs()">
                                <span>
                                    <h3>About us</h3>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing</p>
                                </span>
                                <i class="pi pi-pencil text-end"></i>
                            </div>
                            <div class="service" @click="service()">
                                <span>
                                    <h3>Service</h3>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing</p>
                                </span>
                                <i class="pi pi-pencil text-end"></i>
                            </div>
                            <div class="contacts" @click="contacts()">
                                <span>
                                    <h3>Contacts</h3>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing</p>
                                </span>
                                <i class="pi pi-pencil text-end"></i>
                            </div>
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

.content_section {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

.content_section>div {
    width: 20rem;
    height: 20rem;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 0px 5px gray;
    padding: 5px;
    transition: all linear 0.1s;
    cursor: pointer;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.content_section>div:hover {
    transform: scale(1.02);
    box-shadow: 0px 0px 10px rgb(168, 209, 221);
}
.content_section>div h3{
    color: rgb(95, 93, 93);
}
.content_section>div p{
    color: rgb(143, 138, 138);
}
.content_section>div i {
    color: Blue;
    font-size: 20px;
}
</style>