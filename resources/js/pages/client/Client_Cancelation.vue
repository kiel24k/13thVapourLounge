<template>
    <nav>
        <ul class="navbar nav">
            <li class="nav-item">
                <router-link :to="{name: 'my-profile'}" class="nav-link">My Account</router-link>
            </li>
            <li class="nav-item">
                <router-link :to="{name: 'my-address-book'}" class="nav-link">Address Book</router-link>
            </li>
            <li class="nav-item">
                <a href="" class="nav-link">My Cancellations</a>
            </li>
            <li class="nav-item">
                <a href="" class="nav-link">My Wishlist</a>
            </li>

        </ul>
    </nav>
</template>


<style scoped>
    nav {
        max-width: 70%;
        margin: auto;
        font-size: small;
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