<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
</script>

<template>
    <section id="section-one">
        <div class="header">
            <Header/>
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar/>
            </div>
            <div class="main m-2">
                <h1>dsadas</h1>
            </div>
        </div>
    </section>
</template>

<style scoped>
#section-one{
    display: grid;
}
.content{
    display: flex;
}
</style>