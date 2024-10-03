<template>
    <div id="app">
      <h1>Product List</h1>
      <Product
        v-for="product in products"
        :key="product.id"
        :product="product"
      />
      <Cart />  
    </div>
  </template>
  
  <script setup>
  import Product from '@/components/Product.vue';
  import Cart from '@/components/Cart.vue';
  
  const products = [
    { id: 1, name: 'Product 1', price: 10 },
    { id: 2, name: 'Product 2', price: 15 },
    { id: 3, name: 'Product 3', price: 20 }
  ];
  </script>
  
  <style>
  #app {
    text-align: center;
  }
  </style>