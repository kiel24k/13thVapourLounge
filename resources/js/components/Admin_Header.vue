<script setup>
import axios from 'axios';
import { onMounted, ref } from 'vue';
import Cookies from 'js-cookie';
import { useRouter } from 'vue-router';
import { Button, Popover, SplitButton } from 'primevue';
import Swal from 'sweetalert2';
import sidebar from '@/components/Admin_Sidebar.vue'

const isSidebar = ref(false)
const titleData = ref({})
const lowStockProductData = ref({})

const emit = defineEmits(['closeSidebar'])
const router = useRouter()





const GET_LOW_STOCK_PRODUCT_API = async () => {
    await axios({
        method: 'GET',
        url: 'api/low-stock-product'
    }).then(response => {
        lowStockProductData.value = response.data
    })
}

const op = ref();


const toggle = (event) => {
    op.value.toggle(event);
}


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
    GET_LOW_STOCK_PRODUCT_API()
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
                    <img v-if="titleData[0]" :src="`/storage/cms_image/${titleData[0].image}`" alt="" width="100"
                        height="40">
                </div>

                <div class="header-action">

                    <div class="card flex justify-center">
                        <Button type="button" icon="pi pi-bell" severity="secondary" raised @click="toggle" />

                        <Popover ref="op">
                            <div class="flex flex-col gap-4">
                                <div>
                                    <span class="font-medium block mb-2">Stock Notification</span>
                                    <ul class="list-none p-0 m-0 flex flex-col">
                                        <li v-for="data in lowStockProductData" :key="data.id"
                                            class="flex items-center gap-2 px-2 py-3 hover:bg-emphasis cursor-pointer rounded-border">
                                           <div class="notif-item">
                                            <div>
                                                <Button icon="pi pi-info" raised rounded :severity="data.quantity <= 50 && data.quantity > 25 ? 'success' : data.quantity <= 25 ? 'danger' : 'info' " />
                                            </div>
                                            <div class="">
                                                 <img :src="`storage/product_image/${data.image}`"
                                                style="width: 32px" />
                                            <div>
                                               
                                                <span class="font-medium">{{ data.product_name }}</span>
                                                <div class="text-sm text-surface-500 dark:text-surface-400">{{
                                                    data.product_label }}
                                                    
                                                </div>
                                                  <span>The quantity of this product is only {{ data.quantity }}x</span>
                                            </div>
                                            </div>
                                           </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </Popover>
                    </div>

                    <Button severity="contrast" icon="pi pi-warehouse" raised label="POS" @click="posBtn" />
                    <router-link :to="{ name: 'admin-profile' }">
                        <SplitButton severity="secondary" icon="pi pi-user" :model="items" />
                    </router-link>
                </div>
            </div>
        </div>
    </nav>
</template>

<style scoped>
#nav {
    position: fixed;
    width: 100%;
    z-index: 999;

}

.nav-main {
    position: sticky;
    top: 0;
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
.notif-item{
    display: flex;
    gap:10px;
}
</style>