<script setup>
import axios from 'axios';
import { onMounted } from 'vue';
import Cookies from 'js-cookie';
import { useRouter } from 'vue-router';
import { SplitButton } from 'primevue';
import Swal from 'sweetalert2';

const emit = defineEmits(['closeSidebar'])
const router = useRouter()
const logoutBtn =  async () => {
    const response =  await axios('api/logout')
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
        if(response.status === 200){
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

const closeSidebar = () => {
    emit('closeSidebar')
}

onMounted(  () => {
    const cookie =  Cookies.get('username')    
    // console.log(cookie);
    
})

const items = [
    {
        label: 'Profile',
        icon: 'pi pi-user',
        command: () => {
            this.$toast.add({ severity: 'success', summary: 'Updated', detail: 'Data Updated', life: 3000 });
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


</script>

<template>
    <nav>
        <div id="nav">
            <div class="nav-main">
                <div class="burger">
                    <img src="/public/image/burder-menu1.png" alt="" width="40px" height="40px" @click="closeSidebar"/>
                </div>
                <div class="">
                    <img src="/public/image/1920525_gogle_google_logo_network_icon.png" alt="" width="40">
                </div>
                <div class="">
                    <SplitButton  severity="secondary" label="Save" :model="items" />
                </div>
            </div>
        </div>
    </nav>
</template>

<style scoped>
.nav-main {
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
.burger{
    cursor: pointer;
}
</style>