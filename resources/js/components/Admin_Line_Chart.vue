<template>
    <canvas ref="lineChart"></canvas>
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
      label: 'Sales',
      data: [65, 59, 80, 81, 56, 55, 40],
      fill: false,
      borderColor: 'rgba(75, 192, 192, 1)',
      tension: 0.1,
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
        text: 'Sales Data Over Time',
      },
    },
  };
  
  // Reference to the canvas element
  const lineChart = ref(null);
  
  // Create the chart when the component is mounted
  onMounted(() => {
    const ctx = lineChart.value.getContext('2d');
    new Chart(ctx, {
      type: 'line',
      data: data,
      options: options,
    });
  });
  </script>
  
  <style scoped>
  canvas {
    max-width: 100%;
    max-height: 400px;
  }
  </style>