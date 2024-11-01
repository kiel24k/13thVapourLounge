<template>
    <nav>
        <ul class="navbar nav">
            <li class="nav-item">
                <router-link :to="{name: 'my-pending-order'}" class="nav-link">Pending </router-link>
            </li>
            <li class="nav-item">
                <router-link :to="{ name: 'my-order-to-received' }" class="nav-link">Order is out of delivery</router-link>
            </li>
            <li class="nav-item">
                <router-link :to="{name: 'my-order-received'}" class="nav-link">Order received</router-link>
            </li>
            <li class="nav-item">
                <router-link :to="{name: 'my-order-complete'}" class="nav-link">Order Completed</router-link>
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

nav a {
    color: rgb(97, 97, 97);
}

nav a:hover {
    color: rgb(97, 97, 97);
}

.router-link-active {
    text-decoration: underline;
    text-underline-offset: 10px;
    text-decoration-thickness: 3px;
    color: rgb(179, 118, 6);
    cursor: pointer;
}

.router-link-active:hover {
    color: rgb(179, 118, 6);
    cursor: pointer;

}
</style>