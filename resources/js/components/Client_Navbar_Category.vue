<script setup>
import axios from 'axios';
import { handleError, onMounted, ref } from 'vue';

const categoryData = ref({})
const itemHover = ref(false)


const categoryList = async () => {
    try {
        const response = await axios.get('/api/client-category-list')
       categoryData.value = response.data
       console.log(categoryData.value);
       
    } catch (error) {
        console.log(error);
    }
}

const mouseHover = () => {
    itemHover.value = true
}

const mouseOut = () => {
    itemHover.value = false
}

onMounted(() => {
    categoryList()
})

</script>

<template>
    <section class="section-category" @mouseleave="mouseOut">
        <nav id="nav-category" @mouseenter="mouseHover">
            <ul class="navbar nav">
                <li class="nav-item" v-for="(data,index) in categoryData" :key="index" >
                    <a href="" class="nav-link">{{ data.product_type }}</a>
                </li>
            </ul>
            <div class="item-hover" v-if="itemHover" @mouseleave="mouseOut">
                <span>Rhonalyn Sales Mapagmahal</span>
                <span>Si Love ko ay takot saakin</span>
                <span><3</span>
            </div>
            
        </nav>
       
    </section>
</template>

<style scoped>
section {
    width: 70%;
    margin: auto;
}

.section-category nav a {
    color: black;
    font-size: 15px;
    transition: all linear 0.5s;
}

.section-category nav a:hover {
    text-decoration: underline;
}
.item-hover{
    position:absolute;
    display: grid;
    background: rgb(255, 255, 255);
    max-height: auto;
    box-shadow: 0px 0px 5px 0px gray;
    border-radius: 5px;
    padding:10px;
    overflow: hidden;
    width: 70%;
}
</style>