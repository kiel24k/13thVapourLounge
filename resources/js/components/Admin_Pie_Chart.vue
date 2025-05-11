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
import { onMounted, ref } from 'vue';


const pieChart = ref(null)
Chart.register(...registerables);
const data = {
  labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
  datasets: [{
    label: 'Monthly Sales',
    data: [65, 59, 80, 81, 56, 55, 40],
    backgroundColor:  [
      'rgb(255, 99, 132)',
      'rgb(54, 162, 235)',
      'rgb(255, 205, 86)'
    ],
    borderColor:  [
      'rgb(255, 99, 132)',
      'rgb(54, 162, 235)',
      'rgb(255, 205, 86)'
    ],
    borderWidth: 1,
  }],
};

onMounted(() => {
  const ctx = pieChart.value.getContext('2d');
  new Chart(ctx, {
    type: 'pie',
    data: data,
  });
});
</script>

<style scoped>
canvas {
   max-width: 100%;
  max-height: 400px;
}
.pie_chart{
  background: white;
  box-shadow: 0px 0px 5px 0px gray;
  border-radius: 5px;
  color:gray;
}

</style>