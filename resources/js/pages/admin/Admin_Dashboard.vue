<script setup>
import Sidebar from '@/components/Admin_Sidebar.vue'
import Header from '@/components/Admin_Header.vue'
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
                <h2>dasd</h2>
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