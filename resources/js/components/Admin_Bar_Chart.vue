<template>
  <canvas ref="chartRef"></canvas>
</template>

<script setup>
import { ref, computed, onMounted, watch } from 'vue';
import {
  Chart,
  registerables
} from 'chart.js';

//API VARIABLES
const monthlySalesData = ref([])

//COMPONENTS VARIABLE

const months = ref([
  'JANUARY',
  'FEBRUARY',
  'MARCH',
  'APRIL',
  'MAY',
  'JUNE',
  'JULY',
  'AUGUST',
  'SEPTEMBER',
  'OCTOBER',
  'NOVEMBER',
  'DECEMBER'
])

//API FUNCTION
const GET_MONTHLY_SALES_API = async () => {
  await axios({
    method: 'GET',
    url: '/api/dashboard-monthly-sales'
  }).then(response => {
    monthlySalesData.value = response.data

  })
}
// Register Chart.js components
Chart.register(...registerables);



// Computed totals
const totalOrderPerMonth = computed(() =>
 monthlySalesData.value.map(val => parseInt(val.total))
);



// Chart instance
const chartRef = ref(null);
let chartInstance = null;

// Initialize chart
const renderChart = () => {
  if (chartInstance) {
    chartInstance.destroy(); // Clean up old chart if it exists
  }
  chartInstance = new Chart(chartRef.value, {
    type: 'bar',
    data: {
      labels: months.value,
      datasets: [
        {
          label: 'Monthly Sales',
          data: monthSalesMap.value,
          backgroundColor: '#6F8ECE',
          borderColor: '#6F8ECE',
          borderWidth: 0,
        },
      ],
    },
    options: {
      responsive: true,
      scales: {
        y: {
          beginAtZero: true,
        },
      },
    },
  });
};

//COMPONENTS FUNCTION

const monthSalesMap = computed(() => {
  const result = {}
  months.value.forEach((monthName, index) => {
    const match = monthlySalesData.value.find(item => item.month === index + 1)
    result[monthName] = match ? parseInt(match.total) : 0
  })
  return result
});

onMounted(() => {
  renderChart();
  GET_MONTHLY_SALES_API()
});






// Watch for data updates
watch([totalOrderPerMonth], () => {
  renderChart();
});
</script>

<style scoped>
canvas {
  max-width: 100%;
  max-height: 400px;
  background: white;
  box-shadow: 0px 0px 5px 0px gray;
  border-radius: 5px;
}
</style>