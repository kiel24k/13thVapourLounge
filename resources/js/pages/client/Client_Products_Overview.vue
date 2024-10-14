<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import axios from 'axios';
import { onMounted, ref, watch  } from 'vue';
import { useRoute } from 'vue-router';

const route = useRoute()
const productOverviewItem = ref(Object)



const product_overview_api = async () => {
    const response = await axios.get('/api/products-overview', {
        params: {
            product_name: route.params.products_name
        }
    })
    productOverviewItem.value = response.data
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
    <NavbarCategory />
    <section class="section-one">
        <div class="section-main">
            <article v-for="(data, index) in productOverviewItem" :key="index">
                <figure>
                    <div class="image-one-content">
                        <img :src="`/storage/product_image/${data.image}`" height="130" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>₱{{ data.product_label }}</p>
                    <b>₱{{ data.product_price }}</b>
                </summary>
            </article>
        </div>
    </section>
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