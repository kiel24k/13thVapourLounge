<script setup>
import { onMounted, ref, watch } from 'vue';
import Cookies from 'js-cookie';
import Loader from '@/widgets/Loader.vue'
import { useRouter } from 'vue-router';
import { SplitButton } from 'primevue';
import Swal from 'sweetalert2';


const router = useRouter()
const props = defineProps(['cartTotal', 'QUANTITY_TOTAL_VALUE'])
const emit = defineEmits(['user'])
const user = ref(Object)


//API VARIABLES
const titleData = ref({})

//API FUNCTIONS
const GET_TITLE_API = async () => {
    await axios({
        method: 'GET',
        url: '/api/get-published-title-tag'
    }).then(response => {
        titleData.value = response.data
    })
}


const cartMountedValue = ref()
const cartMounted = () => {
    const cart = JSON.parse(localStorage.getItem('cart'))
    if (cart) {
        cartMountedValue.value = cart.reduce((total, el) => total + el.quantity, 0)
    }
}

const CLIENT_AUTH_API = async () => {

    try {
        const response = await axios.get('/api/client-auth')
        user.value = response.data
        emit('user', response.data)

    } catch (error) {

    }
}

const logout = async () => {
    try {
        const response = await axios.get('/api/logout')

        Swal.fire({
            title: "Do you want to Logout?",
            text: "You can login after!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Okay"
        }).then((result) => {
            if (result.isConfirmed) {
                if (response.status === 200) {
                    router.push('/login')
                }
                Swal.fire({
                    title: "Logout!",
                    text: "Logout Succesful",
                    icon: "success"
                });
            }
        });
    } catch (error) {

    }
}

const items = [
    {
        label: 'Logout',
        icon: 'pi pi-sign-out',
        command: () => {
            logout()
        }
    }
];

onMounted(() => {
    cartMounted()
    CLIENT_AUTH_API()
    GET_TITLE_API()
})
</script>

<template>

    <nav>
        <div class="row">
            <div class="col nav-main">

                <div class="title" v-if="titleData[0]">
                    <router-link :to="{ name: 'home-dashboard' }" href="" class="nav-link">
                        <img :src="`/image/cms_image/${titleData[0].image}`" width="120" height="60">
                        <h4>{{ titleData[0].caption }}</h4>
                    </router-link>

                </div>
                <div class="header-action">
                    <router-link :to="{ name: 'my-pending-order' }">
                        <img src="/public/image/order-icon2.png" width="30" alt="">
                        Order
                    </router-link>
                    {{ cart }}
                    <router-link :to="{ name: 'client-cart' }">
                        <img src="/public/image/cart1-icon.png" alt="" width="30">
                        cart
                    </router-link>
                    <!-- <b v-if="cartTotal">{{ cartTotal }}</b>
                    <b v-else>{{ cartMountedValue }}</b> -->
                    <router-link :to="{ name: 'my-profile' }">
                        <SplitButton icon="pi pi-user" dropdownIcon="pi pi-chevron-down" severity="secondary"
                            @click="save" :model="items" />
                    </router-link>


                </div>

            </div>
        </div>
    </nav>
</template>

<style scoped>
nav {
    position: relative;
    top: 0;
    z-index: 999;
    background: white;
}

.nav-main {
    display: flex;
    justify-content: space-between;
    box-shadow: 0px 0px 5px 0px gray;
    padding: 10px;
    align-items: center;
    align-content: center;

}

.header-action {
    display: flex;
    gap: 10px;
}

.header-action img {
    cursor: pointer;
    margin: auto;
}

.header-action a {
    display: grid;
    font-size: 12px;
    text-align: center;
    text-decoration: none;
    color: rgb(102, 76, 76);
    text-transform: capitalize;
}

.nav-link {
    display: flex;
    align-items: center;
    gap: 10px;
    color: rgb(200, 168, 108);
}
</style>
