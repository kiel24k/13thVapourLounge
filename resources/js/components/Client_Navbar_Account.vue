<template>
    <nav>
        <ul class="navbar nav">
            <li class="nav-item">
               <router-link :to="{name: 'my-profile'}" class="nav-link"><b>My Account</b></router-link>
            </li>
            <li class="nav-item">
                <router-link :to="{name: 'my-address-book'}" class="nav-link"><b>Address Book</b></router-link>
            </li>
            <li class="nav-item">
                <router-link :to="{name: 'client-cancelation'}" class="nav-link"><b>My Cancellations</b></router-link>
            </li>
            <li class="nav-item">
                <router-link :to="{name: 'client-wishlist'}" class="nav-link"><b>My Wishlist</b></router-link>
            </li>

        </ul>
    </nav>
</template>


<style scoped>
    nav {
        max-width: 70%;
        margin: auto;
        margin-top: 5px;
        margin-bottom: 5px;
        font-size: small;
       background-color: rgb(255, 219, 151);
    }
    nav a{
        color:rgb(97, 97, 97);
    }
    nav a:hover{
        color:rgb(97, 97, 97);
    }
  
    .router-link-active {
       text-decoration: underline;
       text-underline-offset: 10px;
       text-decoration-thickness: 3px;
       color:rgb(179, 118, 6);
       cursor: pointer;
    }
    .router-link-active:hover{
        color:rgb(179, 118, 6);
        cursor: pointer;

    }
</style>