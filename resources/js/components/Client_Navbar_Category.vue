<script setup>
import axios from 'axios';
import { handleError, onMounted, ref } from 'vue';

const categoryData = ref({})

const categoryList = async () => {
    try {
        const response = await axios.get('/api/client-category-list')
       categoryData.value = response.data
       console.log(categoryData.value);
       
    } catch (error) {
        console.log(error);
    }
    

}

onMounted(() => {
    categoryList()
})

</script>

<template>
    <section class="section-category">
        <nav id="nav-category">
            <ul class="navbar nav">
                <li class="nav-item">
                    <router-link :to="{ name: 'home-dashboard' }" href="" class="nav-link">Home</router-link>
                </li>
                <li class="nav-item" v-for="(data,index) in categoryData" :key="index">
                    <a href="" class="nav-link">{{ data.product_type }}</a>
                </li>
            </ul>
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
</style>