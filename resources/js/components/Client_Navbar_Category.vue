<script setup>
import axios from 'axios';
import { handleError, onMounted, ref } from 'vue';
import Loader from '@/widgets/Loader.vue'

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

const mouseHover = async (category) => {
    itemHover.value = true
    try {
        const response = await axios.get('/api/item-on-category', {
            params: {
                category: category
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
                    <span href="" class="nav-link" @mouseenter="mouseHover(data.category)">{{ data.category }} |
                    </span>
                </li>
            </ul>
        </nav>
        <div class="item-hover" v-if="itemHover" @mouseleave="mouseOut">
            <router-link class="nav-link"
                :to="{ name: 'products-overview', params: { product_type: data.product_type } }"
                v-for="(data, index) in itemHoverCategory" :key="index">
                <div class="overview">
                    <span> {{ data.product_type }}</span>
                </div>
            </router-link>

        </div>
    </section>
</template>

<style scoped>
.section-category {
 
    width: 100%;
    margin: auto;
    display: flex;
    justify-content: center;
    position: sticky;
    top: 0;
    z-index: 999;
    background: rgb(255, 255, 255, 0.6);
    backdrop-filter: blur(25px);
    border: solid 1px gray;
    border-width: 0px 0px 1px 0px;
}

.section-category nav a {
    color: rgb(10, 10, 10);
    font-size: 15px;
    transition: all linear 0.5s;
    text-decoration: none;
    transition: all linear 0.2s;
}

.section-category nav a:hover {
    color: gray;
}

.item-hover {
    position: absolute;
    display: flex;
    align-items: start;
    align-content: start;
    background: rgb(255, 255, 255);
    max-height: auto;
    padding: 10px;
    overflow: hidden;
    width: 50%;
    gap: 10px;
    height: 10rem;
    margin-top: 45px;
    box-shadow: var(--floating-box-shadow);
    overflow-y: scroll;

}

.nav-item {
    cursor: pointer;
}

.nav-item span {
    color: black;
    font-weight: 600;
    font-size: small;
}

.overview span{
    transition: all linear 0.5s;
}
.overview span:hover {
    text-decoration: underline 3px orange;

    
}
</style>