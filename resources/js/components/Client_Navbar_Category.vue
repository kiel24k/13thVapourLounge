<script setup>
import axios from 'axios';
import { handleError, onMounted, ref } from 'vue';

const categoryData = ref({})
const itemHover = ref(false)
const itemHoverCategory = ref(Object)


const categoryList = async () => {
    try {
        const response = await axios.get('/api/client-category-list')
        categoryData.value = response.data

    } catch (error) {
        console.log(error);
    }
}

const mouseHover = async (product_type) => {
    itemHover.value = true
    try {
        const response = await axios.get('/api/item-on-category', {
            params: {
                product_type: product_type
            }
        })
        itemHoverCategory.value = response.data
    } catch (error) {

    }
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
        <nav id="nav-category">
            <ul class="navbar nav">
                <li class="nav-item" v-for="(data, index) in categoryData" :key="index">
                    <span href="" class="nav-link" @mouseenter="mouseHover(data.product_type)">{{ data.product_type
                        }}</span>
                </li>
            </ul>
            <div class="item-hover" v-if="itemHover" @mouseleave="mouseOut">
               <router-link :to="{name: 'products-overview', params: { products_name: data.product_name}}" v-for="(data,index) in itemHoverCategory" :key="index">
                {{ data.product_name }}
               </router-link>
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

.item-hover {
    position: absolute;
    display: grid;
    background: rgb(255, 255, 255);
    max-height: auto;
    box-shadow: 0px 0px 5px 0px gray;
    border-radius: 5px;
    padding: 10px;
    overflow: hidden;
    width: 70%;
    gap:10px;
}
.nav-item{
    cursor: pointer;
}
</style>