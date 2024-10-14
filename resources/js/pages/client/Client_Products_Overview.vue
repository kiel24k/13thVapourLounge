<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import axios from 'axios';
import { onMounted, ref, watch  } from 'vue';
import { useRoute } from 'vue-router';
import Footer from '@/components/Client_Footer.vue'



const loader = ref(false)
const route = useRoute()
const productOverviewItem = ref(Object)



const product_overview_api = async () => {
   try{
    loader.value = true
    const response = await axios.get('/api/products-overview', {
        params: {
            product_name: route.params.products_name
        }
    })
    productOverviewItem.value = response.data
    loader.value = false
   }catch(error){

   }
}

watch(route, (oldVal, newVal) => {
    product_overview_api()
})
onMounted(() => {
    product_overview_api()
})

</script>

<template>
    <Header />
    <Navbar />
    <Loader v-if="loader"/>
    <NavbarCategory />
    <section class="section-one">
        <div class="section-main">
            <article  v-for="(data, index) in productOverviewItem" :key="index">
                <router-link :to="{name: 'client-products', params: {id: data.id} }">
                    <div class="image-one-content">
                        <img :src="`/storage/product_image/${data.image}`" height="130" width="150" alt="" />
                    </div>
                </router-link>
                <summary>
                    <p>₱{{ data.product_label }}</p>
                    <b>₱{{ data.product_price }}</b>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
        </div>
    </section>
    <Footer/>
</template>
<style scoped>
section {
    width: 70%;
    margin: auto;
}
.section-main{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    background: rgb(255, 255, 255);
}

article {
    width: 12rem;
    border-radius: 10px;
    box-shadow: 0px 0px 5px 0px gray;
    padding: 5px;
    margin: 10px;
    height: 24em;
    padding:20px;
}

figure {
    display: flex;
    justify-content: space-between;
}

summary {
    display: grid;
    align-items: center;
    align-content: center;
    list-style: none;
    height: 9rem;

}
</style>