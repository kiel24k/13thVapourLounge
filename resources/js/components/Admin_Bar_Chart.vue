<template>
  <canvas ref="barChart"></canvas>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { Chart, registerables } from 'chart.js';

// Register necessary components of Chart.js
Chart.register(...registerables);

// Define your chart data and options
const data = {
  labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
  datasets: [{
    label: 'Monthly Sales',
    data: [65, 59, 80, 81, 56, 55, 40],
    backgroundColor: 'pink',
    borderColor: 'red',
    borderWidth: 1,
  }],
};

const options = {
  responsive: true,
  plugins: {
    legend: {
      position: 'top',
    },
    title: {
      display: true,
      text: 'Monthly Sales Data',
    },
  },
};

// Reference to the canvas element
const barChart = ref(null);

// Create the chart when the component is mounted
onMounted(() => {
  const ctx = barChart.value.getContext('2d');
  new Chart(ctx, {
    type: 'bar',
    data: data,
    options: options,
  });
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