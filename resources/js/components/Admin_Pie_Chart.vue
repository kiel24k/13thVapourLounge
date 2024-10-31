<template>
  <canvas ref="pieChart"></canvas>
</template>

<script setup>
import { ref, onMounted, computed, watch } from 'vue';
import { Chart, registerables } from 'chart.js';

const pieItemCount = ref([])
const pieOrderLabel = ref([])


const PIE_CHART_API = async () => {
  const response = await axios.get('api/dashboard-pie-chart')
  pieItemCount.value = response.data.map((el) => el.item_count);
  pieOrderLabel.value = response.data.map((el) => el.order_label)
  createChart()
}




// Register the necessary Chart.js components
Chart.register(...registerables);

// Reference to the canvas element
const pieChart = ref(null);

// Define your chart data and options

const createChart = () => {
  const ctx = pieChart.value.getContext('2d');
  const data = {
    labels: pieOrderLabel.value,
    datasets: [{
      label: 'Order Count',
      data: pieItemCount.value,
      backgroundColor: [
        'rgba(247, 46, 3, 0.2)',
        'rgba(250, 169, 9 , 0.2)',
        'rgba(250, 246, 9 , 0.2)',
        'rgba(9, 250, 104 , 0.2)',
        'rgba(9, 100, 250  , 0.2)',
        'rgba(206, 9, 250  , 0.2)',
      ],
      borderColor: [
        'skyblue'
      ],
      borderWidth: 1,
    }],
  }
  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: 'Record of Products',
      },
    },
  };
  new Chart(ctx, {
    type: 'pie',
    data: data,
    options: options,
  });

}

// Create the chart when the component is mounted
onMounted(() => {
  PIE_CHART_API()




});


</script>

<style scoped>
canvas {
  width: 30rem;
  height: 100rem;
  margin: auto;
}
</style>