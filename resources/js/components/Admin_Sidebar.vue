



<template>
    <aside>
        <div id="sidebar" class="bg-danger">
            <div class="menu1">
                <ul class="navbar nav mt-1">
                    <!-- <small class="p-4">Favorites</small> -->
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/dashboard-icon.png" width="20px" alt="" />
                            Dashboard
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/order-icon.png" width="20px" alt="" />
                            Orders
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/products-icon.png" width="20px" alt="" />
                            Products
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark category-item">
                           <span>Category</span>
                            <img src="/public/image/prev-icon.png" width="20px" alt=""/>
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/report-icon.png" width="20px" alt="" />
                            Reports
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/users-icon.png" width="20px" alt="" />
                            Users
                        </li>
                    </div>
                </ul>
                <h3 class="text-center text-white p-2">Settings</h3>
                <ul class="navbar nav mt-1">
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/profile-icon.png" width="20px" alt="" />
                            Profile
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/settings-icon.png" width="20px" alt="" />
                            Account Setting
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/payment-method-icon.png" width="20px" alt="" />
                            Payment Methods
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/shipping-icon.png" width="25px" alt="" />
                            Shipping Options
                        </li>
                    </div>
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
                            <img src="/public/image/370076_account_avatar_client_male_person_icon.png" width="20px" alt="" />
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

ul{
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
.navbar{
    
}

.menu1 {
    position: fixed;
    width: 16rem;
    overflow-y: scroll;
    height: 100%;
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


.category-item{
    display: flex;
    gap:5rem;
}
.category-item img{
    rotate:180deg;
}
.menu1 h3{
    background-color:rgb(110,66,192)
}
</style>