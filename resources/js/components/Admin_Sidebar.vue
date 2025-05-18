<script setup>
import { Button } from 'primevue';
const emit = defineEmits(['closeSidebar'])
const closeSidebar = () => {
    emit('closeSidebar')
}
</script>

<template>
    <aside>
        <div id="sidebar" class="">
            <div class="menu1">
                <div class="text-end p-2">
                    <Button size="large" variant="text" icon="pi pi-times" severity="danger" @click="closeSidebar" />
                </div>
                <ul class="navbar nav">
                    <!-- <small class="p-4">Favorites</small> -->

                    <router-link :to="{ name: 'admin-dashboard' }" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-shop" </i>
                                Dashboard
                        </li>
                    </router-link>
                    <router-link :to="{ name: 'admin-orders' }" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-shopping-bag"></i>
                            Order
                        </li>
                    </router-link>
                    <router-link :to="{ name: 'admin-products' }" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-shopping-cart"></i>
                            Product list
                        </li>
                    </router-link>
                    <!-- test -->
                    <!-- <router-link :to="{ name: 'admin-add-product' }" class="item1">
                        <li class="nav-link text-dark">
                           <i class="pi pi-plus"></i>
                            New Product
                        </li>
                    </router-link> -->
                    <router-link :to="{ name: 'admin-category-list' }" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-list"></i>
                            Category list
                        </li>
                    </router-link>
                    <!-- endtest -->
                </ul>
                <div class="sidebar_highlights">
                    <i class="pi pi-check"></i>
                    <h3 class="text-center text-white p-2">Account</h3>
                </div>
                <ul class="navbar nav mt-1">
                    <router-link :to="{ name: 'admin-profile' }" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-user"></i>
                            Profile
                        </li>
                    </router-link>
                      <router-link :to="{ name: 'admin-user-list' }" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-users"></i>
                            Users
                        </li>
                    </router-link>
                    <router-link :to="{ name: 'admin-user-list' }" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-users"></i>
                            Users
                        </li>
                    </router-link>
                    <router-link :to="{ name: 'admin-user-list' }" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-users"></i>
                            Users
                        </li>
                    </router-link>
                    <!-- <router-link :to="{name: 'admin-account-settings'}" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-wrench"></i>
                            Account Setting
                        </li>
                    </router-link> -->
                </ul>
                <div class="sidebar_highlights">
                    <i class="pi pi-cog"></i>
                    <h3 class="text-center text-white p-2">Settings</h3>
                </div>

                <ul class="navbar nav mt-1">
                    <div class="item1">
                        <router-link :to="{ name: 'admin-content-management' }">
                            <li class="nav-link text-dark">
                                <img src="/public/image/documentation.png" width="20px" alt="" />
                                Content Management
                            </li>
                        </router-link>
                    </div>
                </ul>

            </div>
        </div>
    </aside>
</template>
<style scoped>
aside {
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    width: 250px;

    z-index: 1000;
}

a {
    text-decoration: none;
}

ul {
    background: rgb(255, 255, 255);
}

.item1 {
    width: 100%;
    padding: 15px;
    transition: all linear 0.2s;
    background: rgb(255, 255, 255);
}

.item1:hover {
    background: rgb(180, 179, 179);
    color: rgb(253, 248, 248);
}

.nav-link {
    display: flex;
    align-items: center;
    gap: 10px;
    color: red;
}

.navbar {}

.menu1 {
    position: fixed;
    width: 16rem;
    overflow-y: scroll;
    height: 100%;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    background: white;
}

.menu1::-webkit-scrollbar {
    width: 3px;
    height: 50px;
}

.menu1::-webkit-scrollbar-thumb {
    background-color: #beb4b4;
    border-radius: 10px;
}

.menu1::-webkit-scrollbar-track {
    background-color: #ccd1d1;
}


.category-item {
    display: flex;
    gap: 5rem;
}





.category-list {
    display: grid;
}

.category-item1 {}

.category-item1:hover {
    background: #beb4b4;
    cursor: pointer;

}

.product-name-list {
    width: 100%;
    transition: all linear 1s;
    background: rgb(238, 237, 237);
    height: 0;
    overflow: hidden;
}

.showItem {
    height: auto;
}

.category-i {
    rotate: 180deg;
    transition: all linear 0.2s;
}

.categoryImg {
    rotate: 270deg;
}

.router-link-active,
.router-link-exact-active {
    background: rgb(245, 224, 201);
}

.sidebar_highlights {
    background-color: rgb(155, 99, 36);
    display: flex;
    justify-content: start;
    align-items: center;
    gap: 20px;
}

.sidebar_highlights i {
    font-size: large;
    color: white;
}
</style>