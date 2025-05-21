<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
import { Button, FloatLabel, InputText, Message, Select, Textarea } from 'primevue'
import { onMounted, ref } from 'vue'
import AdminCmsTitleModal from '@/components/Admin_Cms_Title.vue'
import AdminCmsHeroModal from '@/components/Admin_Cms_Hero.vue'
import AdminCmsAboutUsModal from '@/components/Admin_Cms_About_Us.vue'
import AdminCmsServiceModal from '@/components/Admin_Cms_Service.vue'
import AdminCmsContactModal from '@/components/Admin_Cms_Contact.vue'
import Loader from '@/widgets/Loader.vue';

const isLoading = ref(false)

const showSidebar = ref(true)

//API VARIABLES
const titleData = ref(null)
const heroData = ref(null)
//API FUNCTIONS
const GET_TITLE_API = async () => {
    axios({
        method: 'GET',
        url: 'api/get-title',
    }).then(response => {
        titleData.value = response.data
    })
}

const GET_HERO_API = async () => {
    await axios({
        method: 'GET',
        url: 'api/get-hero'
    }).then(response => {
        heroData.value = response.data
    })
}

//COMPONENT VARIABLES
const isAdminCmsTitleModal = ref(false)
const isAdminCmsHeroModal = ref(false)
const isAdminCmsAboutUsModal = ref(false)
const isAdminCmsServiceModal = ref(false)
const isAdminCmsContactModal = ref(false)

const buttonData = ref({})

//COMPONENT FUNCTION 
//TITLE
const title = (data) => {
    buttonData.value.titleData = data
    isAdminCmsTitleModal.value = true
}
const closeAdminCmsTitle = () => {
    isAdminCmsTitleModal.value = false
    GET_TITLE_API()
}

//HERO
const hero = (data) => {
    buttonData.value.heroData = data
    isAdminCmsHeroModal.value = true
}

const closeAdminCmsHero = () => {
    isAdminCmsHeroModal.value = false
    GET_HERO_API()
}

//ABOUT US
const aboutUs = () => {
    isAdminCmsAboutUsModal.value = true
}
const closeAdminCmsAboutUs = () => {
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
    GET_TITLE_API()
}





//HOOKS 
onMounted(async () => {
    isLoading.value = true
    await Promise.all([
        GET_TITLE_API(),
        GET_HERO_API()
    ])
    isLoading.value = false
})


</script>

<template>
    <Loader v-if="isLoading" />
    <AdminCmsTitleModal v-if="isAdminCmsTitleModal" @closeAdminCmsTitle="closeAdminCmsTitle"
        :titleData="buttonData.titleData" />
    <AdminCmsHeroModal v-if="isAdminCmsHeroModal" @closeAdminCmsHero="closeAdminCmsHero"
        :heroData="buttonData.heroData" />
    <AdminCmsAboutUsModal v-if="isAdminCmsAboutUsModal" @closeAdminCmsAboutUs="closeAdminCmsAboutUs" />
    <AdminCmsServiceModal v-if="isAdminCmsServiceModal" @closeAdminCmsService="closeAdminCmsService" />
    <AdminCmsContactModal v-if="isAdminCmsContactModal" @closeAdminCmsContact="closeAdminCmsContact" />
    <div id="section-one">
        <div class="header">
            <Header />
        </div>
        <div class="content">
            <div class="main m-2">

                <section>

                    <div class="row mt-3">
                        <div class="row mt-5">
                            <div class="col">
                                <Message icon="pi pi-list" severity="contrast">
                                    Content management
                                </Message>
                            </div>
                        </div>
                        <div class="col content_section mt-3">
                            <div class="title" @click="title(titleData[0])">
                                <span v-if="titleData">
                                    <h3>Title:</h3>
                                    <h4>{{ titleData[0].caption }}</h4>
                                    <p class="text-center">
                                        <img :src="`/storage/cms_image/${titleData[0].image}`" width="250" height="150"
                                            alt="">
                                    </p>
                                </span>
                                <i class="pi pi-pencil text-end"></i>

                            </div>
                            <div class="hero" @click="hero(heroData[0])">
                                <h3>Hero</h3>
                                <span v-if="heroData">
                                    <p>{{ heroData[0].details }}</p>
                                    <p class="text-center">
                                        <img :src="`/storage/cms_image/${heroData[0].image}`" width="250" height="150"
                                            alt="">
                                    </p>
                                </span>
                                <i class="pi pi-pencil text-end"></i>
                            </div>

                            <div class="about_us" @click="aboutUs()">
                                <span>
                                    <h3>About us</h3>
                                    <i class="pi pi-question-circle" style="font-size:15rem;color:skyblue"></i>
                                </span>
                                <i class="pi pi-pencil text-end"></i>
                            </div>
                            <div class="service" @click="service()">
                                <span>
                                    <h3>Service</h3>
                                    <i class="pi pi-check-circle" style="font-size:15rem;color:yellowgreen"></i>
                                </span>
                                <i class="pi pi-pencil text-end"></i>
                            </div>
                            <div class="contacts" @click="contacts()">
                                <span>
                                    <h3>Contacts</h3>
                                    <i class="pi pi-book" style="font-size:15rem;color:green"></i>
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
    justify-content: center;
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
    overflow-y: scroll;
}

.content_section>div:hover {
    transform: scale(1.02);
    box-shadow: 0px 0px 10px rgb(168, 209, 221);
}

.content_section>div h3 {
    color: rgb(95, 93, 93);
}

.content_section>div p {
    color: rgb(143, 138, 138);
}

.content_section>div i {
    color: Blue;
    font-size: 20px;
}
</style>