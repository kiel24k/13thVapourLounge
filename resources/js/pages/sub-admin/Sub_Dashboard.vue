<script setup>
import Header from '@/components/Sub_Header.vue'
import Sidebar from '@/components/Sub_Sidebar.vue'
</script>

<template>
    <section id="main">
        <div class="header bg-info">
            <Header />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar/>
            </div>
            <section>
                <h1>dasds</h1>
                <br>
                <h2>dasds</h2>
            </section>
        </div>
    </section>
</template>

<style scoped>
#main {
    display: grid;
}
.sidebar{
    transition: all linear 1s;
    
}

.content {
    display: flex;
   
    

}
</style>



