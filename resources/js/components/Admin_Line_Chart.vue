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
    labels: ['WEEK 1', 'WEEK 2', 'WEEK 3', 'WEEK 4', 'WEEK 5', 'WEEK 6', 'WEEK 7'],
    datasets: [{
      label: 'Sales',
      data: [65, 59, 80, 81, 56, 55, 40],
      fill: true,
      borderColor: '#BBB4A5',
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
        text: 'Weekly sales chart',
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
    background: white;
    box-shadow: 0px 0px 5px 0px gray;
    border-radius: 5px;
  }
  </style>