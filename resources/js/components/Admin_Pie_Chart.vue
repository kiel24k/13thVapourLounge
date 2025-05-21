<template>

  <div class="pie_chart bg-white">
    <div class="title text-center">
      <b>Most Sales</b>
    </div>
    <canvas ref="pieChart"></canvas>
  </div>
</template>

<script setup>
import { Chart, registerables } from 'chart.js';
import { computed, onMounted, ref } from 'vue';

//API VARIABLES
const pieChartData = ref([])
//API FUNCTIONS
const GET_PIE_CHART_API = () => {
  axios({
    method: 'GET',
    url: '/api/dashboard-pie-chart'
  }).then(response => {
    if (response.status === 200) {
      pieChartData.value = response.data
      fetchPieChart()
    }

  })

}


const pieChart = ref(null)
Chart.register(...registerables);
const data = computed(() => {
  return {
    labels: pieChartData.value.map(val => val.product_label),
    datasets: [{
      label: 'Most Sales',
      data: pieChartData.value.map(val => val.item_count),
      backgroundColor: [
        'rgb(255, 99, 132)',
        'rgb(54, 162, 235)',
        'rgb(255, 205, 86)'
      ],
      borderColor: [
        'white'
      ],
      borderWidth: 1,
    }],
  };
})

const fetchPieChart = () => {
  const ctx = pieChart.value.getContext('2d');
  new Chart(ctx, {
    type: 'pie',
    data: data.value,
  });
}

onMounted(() => {
  GET_PIE_CHART_API()
});
</script>

<style scoped>
canvas {
  max-width: 100%;
  max-height: 400px;
}

.pie_chart {
 
  color: gray;
}
</style>