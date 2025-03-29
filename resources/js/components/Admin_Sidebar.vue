<script setup>

</script>

<template>
    <aside>
        <div id="sidebar" class="">
            <div class="menu1">
                <ul class="navbar nav mt-1">
                    <!-- <small class="p-4">Favorites</small> -->
                    <router-link :to="{name: 'admin-dashboard'}" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-shop"</i>
                            Dashboard
                        </li>
                    </router-link>
                    <router-link :to="{name: 'admin-orders'}" class="item1">
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
                    <router-link :to="{ name: 'admin-products' }" class="item1">
                        <li class="nav-link text-dark">
                           <i class="pi pi-plus"></i>
                            New Product
                        </li>
                    </router-link>
                    <router-link :to="{ name: 'admin-products' }" class="item1">
                        <li class="nav-link text-dark">
                           <i class="pi pi-list"></i>
                            Category list
                        </li>
                    </router-link>
                    <router-link :to="{ name: 'admin-products' }" class="item1">
                        <li class="nav-link text-dark">
                           <i class="pi pi-plus"></i>
                            New Category
                        </li>
                    </router-link>
                    <!-- endtest -->
                    <router-link :to="{name: 'admin-user-list'}" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-users"></i>
                            Users
                        </li>
                    </router-link>
                </ul>
                <h3 class="text-center text-white p-2">Settings</h3>
                <ul class="navbar nav mt-1">
                    <router-link :to="{name: 'admin-profile'}" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-user"></i>
                            Profile
                        </li>
                    </router-link>
                    <router-link :to="{name: 'admin-account-settings'}" class="item1">
                        <li class="nav-link text-dark">
                            <i class="pi pi-wrench"></i>
                            Account Setting
                        </li>
                    </router-link>
                </ul>
                <h3 class="text-center text-white p-2">Support</h3>
                <ul class="navbar nav mt-1">
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/documentation.png" width="20px" alt="" />
                            Documentation
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/contact-support-icon.png" width="20px" alt="" />
                            Contact Support
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/370076_account_avatar_client_male_person_icon.png" width="20px"
                                alt="" />
                            FAQs
                        </li>
                    </div>
                </ul>

            </div>
        </div>
    </aside>
</template>
<style scoped>
aside {
    width: 16rem;
    position: relative;
    border-width: 0px 2px 0px 0px;
 
 

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
    background: rgb(231, 230, 230);
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



.menu1 h3 {
    background-color: rgb(11, 11, 12)
}

.category-list {
    display: grid;
}
.category-item1{
  
}
.category-item1:hover{
   background:#beb4b4;
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
.category-i{
    rotate: 180deg;
    transition: all linear 0.2s;
}
.categoryImg{
  rotate: 270deg;
}

.router-link-active, .router-link-exact-active{
    background: rgb(216, 214, 214);
}
</style>