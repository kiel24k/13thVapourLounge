<template>
    <canvas ref="pieChart"></canvas>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { Chart, registerables } from 'chart.js';
  
  // Register the necessary Chart.js components
  Chart.register(...registerables);
  
  // Define your chart data and options
  const data = {
    labels: ['Red', 'Blue', 'Yellow'],
    datasets: [{
      label: 'My First Dataset',
      data: [300, 50, 100],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
      ],
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
      ],
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
        text: 'Chart.js Pie Chart',
      },
    },
  };
  
  // Reference to the canvas element
  const pieChart = ref(null);
  
  // Create the chart when the component is mounted
  onMounted(() => {
    const ctx = pieChart.value.getContext('2d');
    new Chart(ctx, {
      type: 'pie',
      data: data,
      options: options,
    });
  });
  </script>
  
  <style scoped>
  canvas {
    width: 30rem;
    height: 100rem;
    margin: auto;
  }
  </style>