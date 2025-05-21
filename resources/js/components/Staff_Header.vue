<script setup>
import axios from 'axios';
import { onMounted, ref } from 'vue';
import Cookies from 'js-cookie';
import { useRouter } from 'vue-router';
import { Button, SplitButton } from 'primevue';
import Swal from 'sweetalert2';
import sidebar from '@/components/Staff_Sidebar.vue'

const isSidebar = ref(false)
const titleData = ref({})

const emit = defineEmits(['closeSidebar'])
const router = useRouter()
const logoutBtn = async () => {
    const response = await axios('api/logout')
    Swal.fire({
        title: "Do you want to logout?",
        text: "You can login after you logout",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes",
        cancelButtonText: "No"
    }).then((result) => {
        if (result.isConfirmed) {
            if (response.status === 200) {
                router.push('/login')
            }
            Swal.fire({
                title: "Logout Successful!",
                text: "Thank you!",
                icon: "success"
            });
        }
    });

    try {

    } catch (error) {
        console.log(error);
    }
}


const GET_TITLE_API = async () => {
    await axios({
        method: 'GET',
        url: '/api/get-title'
    }).then(response => {
        titleData.value = response.data
    })
}
const openSidebar = () => {
   isSidebar.value = true

}

const closeSidebar = () => {
    isSidebar.value = false

}

onMounted(() => {
    const cookie = Cookies.get('username')
    GET_TITLE_API()
    // console.log(cookie);

})

const items = [
    {
        label: 'Profile',
        icon: 'pi pi-user',
        command: () => {
           router.push('/admin-profile')
        }
    },
    {
        label: 'Logout',
        icon: 'pi pi-sign-out',
        command: () => {
            logoutBtn()
        }
    },
];

const posBtn = () => {
    router.push('/POS')
}


</script>

<template>
  
      <transition name="sidebarTransition">
        <sidebar v-if="isSidebar" @closeSidebar="closeSidebar" />
      </transition>

    <nav>
        <div id="nav">
            <div class="nav-main">
                <div class="burger">
                    <img src="/public/image/burder-menu1.png" alt="" width="40px" height="40px" @click="openSidebar" />
                </div>
                <div class="">
                    <img v-if="titleData[0]" :src="`/storage/cms_image/${titleData[0].image}`" alt="" width="100" height="40">
                </div>

                <div class="header-action">
                    <Button severity="contrast" icon="pi pi-warehouse" raised label="POS" @click="posBtn" />
                    <SplitButton severity="secondary" icon="pi pi-user" :model="items" />
                </div>
            </div>
        </div>
    </nav>
</template>

<style scoped>
#nav{
    position: fixed;
    width: 100%;
    z-index: 999;

}
.nav-main {
    position: sticky;
    top:0;
    display: flex;
    justify-content: space-between;
    box-shadow: 0px 0px 10px 0px gray;
    padding: 10px;
    align-items: center;
    background: rgb(255, 255, 255);
}


.logoutBtn {
    background-color: rgb(204, 7, 7);
    padding: 5px;
    border-radius: 15px;
    border: 0px;
    color: white;
}

.logoutBtn img {
    filter: invert(1);
}

.burger {
    cursor: pointer;
}

.header-action {
    display: flex;
    gap: 10px;
}

.sidebarTransition-enter-active,
.sidebarTransition-leave-active {
  transition: all 0.3s cubic-bezier(0.65, 0, 0.35, 1);
  will-change: transform, opacity;
}

.sidebarTransition-enter-from {
  transform: translateX(-100%);
  opacity: 0;
}

.sidebarTransition-enter-to {
  transform: translateX(0);
  opacity: 1;
}

.sidebarTransition-leave-from {
  transform: translateX(0);
  opacity: 1;
}

.sidebarTransition-leave-to {
  transform: translateX(-100%);
  opacity: 0;
}
</style>