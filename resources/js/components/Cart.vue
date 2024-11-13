<template>
    <div class="cart">
        <h2>Your Cart</h2>
        <ul>
            <li v-for="item in cart" :key="item.id">
                {{ item.name }} - {{ item.price }} x {{ item.quantity }}
            </li>
        </ul>
        <p>Total items: {{ totalItems }}</p>
    </div>
   
</template>

<script setup>
import { ref, onMounted } from 'vue';


const cart = ref([]);
const totalItems = ref(0);

const loadCart = () => {
    cart.value = JSON.parse(localStorage.getItem('cart')) || [];
    totalItems.value = cart.value.reduce((acc, item) => acc + item.quantity, 0);
};

onMounted(loadCart);
</script>

<style>
.cart {
    border: 1px solid #ccc;
    padding: 10px;
    margin: 10px;
    
}
</style>