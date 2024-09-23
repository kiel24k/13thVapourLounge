<template>
    <aside>
        <div id="sidebar">
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
                            <img src="/public/image/cart1-icon.png" width="20px" alt="" />
                            Items
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
                            <img src="/public/image/370076_account_avatar_client_male_person_icon.png" width="20px" alt="" />
                            Users
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/alert-icon.png" width="20px" alt="" />
                           Change Password
                        </li>
                    </div>
                    <div class="item1">
                        <li class="nav-link text-dark">
                            <img src="/public/image/logout.png" width="20px" alt="" />
                            Logout
                        </li>
                    </div>
                </ul>
            </div>
        </div>
    </aside>
</template>
<style scoped>
aside {
    width: 15rem;
    position: relative;
    border-width: 0px 2px 0px 0px;
  
}


.item1 {
    width: 100%;
    padding: 15px;
    transition: all linear 0.2s;
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
    width: 15rem;
    overflow-y: scroll;
    height: 100vh;
}
.menu1::-webkit-scrollbar {
    width: 3px;
    height: 50px;
}

.menu1::-webkit-scrollbar-thumb {
    background-color: #180101;
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
</style>