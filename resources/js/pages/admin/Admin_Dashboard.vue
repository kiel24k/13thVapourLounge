<script setup>
import Sidebar from '@/components/Admin_Sidebar.vue'
import Header from '@/components/Admin_Header.vue'
import PieChart from '@/components/Admin_Pie_Chart.vue'
import LineChart from '@/components/Admin_Line_Chart.vue'
import BarChart from '@/components/Admin_Bar_Chart.vue'
</script>

<template>
    <section id="main">
        <div class="header bg-info">
            <Header />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar />
            </div>
            <div class="main">
                <section class="section-one">
                    <div class="row totals text-white">
                        <div class="">
                            <p>products</p>
                            <span>40</span>

                        </div>
                        <div class="">
                            <p>users</p>
                            <span>10</span>
                        </div>
                        <div class="">
                            <p>received orders</p>
                            <span>100</span>
                        </div>
                    </div>
                </section>
                <section class="section-two">
                    <div class="row charts">
                        <div class="">
                            <LineChart />
                        </div>
                        <div class="">
                            <BarChart />
                        </div>
                        <div class="">
                            <PieChart />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>
</template>
<style scoped>
#main {
    display: grid;

}

.main {
    width: 100%;
    margin: 10px;
}

.header {
    position: sticky;
    top: 0;
    z-index: 999;
}

.sidebar {}

.content {
    display: flex;
}

.section-one {
    display: grid;
}

.totals {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
}

.totals>div {
    width: 15rem;
    height: 15rem;
    background: rgb(5, 180, 72);
    box-shadow: 0px 0px 5px 0px gray;
    border-radius: 10px;
    font-size: 20px;
    text-align: center;
    text-transform: capitalize;
    font-weight: bold;
}
.charts{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}
</style>