<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import { ref } from 'vue';

const quantity = ref(1)
const increment = () => {
  quantity.value++
}

const decrement = () => {
 quantity.value--

 if(quantity.value <= 0){
    quantity.value = 0
 }
}

</script>

<template>
    <Header/>
    <Navbar/>
    <NavbarCategory/>
    <section class="section-one">
        <div class="section-main">
            <div class="">
                <img src="/public/image/vape-product-sample.png"  alt="">
            </div>
            <div class="item">
                <h4 class="title">
                    Shift Level bar 1000 puffs
                </h4>
                <b>flavor</b>
                <div class="category">
                    <span>Eruption (LYCHEE)</span>
                <span>Tsunami (ICY GUMMY BEARS)</span>
                <span>Eruption (LYCHEE)</span>
                <span>Tsunami (ICY GUMMY BEARS)</span>
                <span>Eruption (LYCHEE)</span>
                <span>Tsunami (ICY GUMMY BEARS)</span>
                </div>
                <div class="price">
                    <b>₱400.00</b>
                </div>
                <div class="quantity">
                    <button @click="decrement"><b>-</b></button>
                    <span>{{ quantity }}</span>
                    <button @click="increment"><b>+</b></button>
                </div>
                <div class="buy-now mt-3">
                    <button class="btn btn-dark">Buy Now</button>
                </div>
            </div>
        </div>
    </section>
</template>

<style scoped>
section{
    width: 70%;
    margin:auto;
}
.section-main{
    display: flex;
    justify-content: center;
    align-items: center;
    gap:25px;
    
}
.item .category{
    display: grid;
    align-items: start;
    align-content: start;
    gap:10px;
}
.item .category span{
    background: rgb(255, 255, 255);
    width:max-content;
    padding:15px;
    box-shadow: 0px 0px 2px 0px rgb(167, 166, 166);
    border-radius: 50px;
}
.quantity{
    border:1px solid gray;
    width: 7rem;
    justify-content: space-between;
    display: flex;
    align-items: center;
    height: 3rem;
}
.quantity button{
    border:0;
    width: 25px;
    font-size: 25px;
    background: none;
    cursor: pointer;
}

</style>