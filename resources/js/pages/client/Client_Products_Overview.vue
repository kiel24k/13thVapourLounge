<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import axios from 'axios';
import { onMounted, ref, watch  } from 'vue';
import { useRoute } from 'vue-router';
import Footer from '@/components/Client_Footer.vue'
import Loader from '@/widgets/Loader.vue'



const loader = ref(false)
const route = useRoute()
const productOverviewItem = ref(Object)



const product_overview_api = async () => {
   try{
    const response = await axios.get('/api/products-overview', {
        params: {
            product_name : route.params.product_type 
        }
    })
    productOverviewItem.value = response.data
   }catch(error){

   }
}

watch(route, (oldVal, newVal) => {
    product_overview_api()
})
onMounted(async() => {
    Loader.value = true
    await product_overview_api()
    Loader.value = false
})

</script>

<template>
    <Navbar />
    <Loader v-if="loader"/>
    <NavbarCategory />
    <section class="section-one">
        <div class="section-main">
            <article  v-for="(data, index) in productOverviewItem" :key="index">
                <router-link :to="{name: 'client-products', params: {id: data.id} }">
                    <div class="image-one-content">
                        <img :src="`/image/product_image/${data.image}`" height="130" width="150" alt="" />
                    </div>
                    <summary>
                        <p>{{ data.product_label }}</p>
                        <b>₱{{ data.product_price }}</b>
                    </summary>
                    <div class="text-start">
                        <button class="btn btn-dark">View Product</button>
                    </div>
                </router-link>
               
            </article>
        </div>
    </section>
    <Footer/>
</template>
<style scoped>
a{
    text-decoration: none;
    color:black;
}
section {
    width: 70%;
    margin: auto;
}
.section-main{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    background: rgb(241, 239, 239);
}

article {
    width: 12rem;
    border-radius: 10px;
    box-shadow: 0px 0px 5px 0px gray;
    padding: 5px;
    margin: 10px;
    height: 24em;
    padding:20px;
    background: white;
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
.image-one-content{
    display: grid;
    justify-content: center;
}
</style>