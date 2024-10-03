<template>
    <div class="product">
      <h2>{{ product.name }}</h2>
      <p>Price: {{ product.price }}</p>
      <button @click="addToCart">Add to Cart</button>
    </div>
  </template>
  
  <script setup>
  import { defineProps } from 'vue';
  //ddsds
  const props = defineProps({
    product: Object
  });
  
  const addToCart = () => {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const existingProduct = cart.find(item => item.id === props.product.id);
    
    if (existingProduct) {
      existingProduct.quantity += 1; // Increment quantity if item already exists
    } else {
      cart.push({ ...props.product, quantity: 1 }); // Add new product with quantity
     
    }
  
    localStorage.setItem('cart', JSON.stringify(cart));
  };
  </script>
  
  <style>
  .product {
    border: 1px solid #ccc;
    padding: 10px;
    margin: 10px;
  }
  </style>