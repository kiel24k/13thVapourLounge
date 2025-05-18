<script setup>
import { ref, onMounted, onBeforeUnmount, computed, watch } from 'vue';
import { Chart, registerables } from 'chart.js';
import axios from 'axios';


//API VARIABLES
const dateSalesCategoryData = ref({
  sales_year: null,
  sales_month: null
})

//API FUNCTION
const GET_DATE_SALES_CATEGORY = () => {
  axios({
    method: 'GET',
    url: '/api/dashboard-date-sales-category'
  }).then(response => {
    dateSalesCategoryData.value = {
      sales_year: response.data.sales_year,
      sales_month: response.data.sales_month
    }
  })
}

//COMPONENTS FUNCTION 
const months = ref([
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
])

const monthsIndex = computed(() => {
  return months.value.indexOf(selectMonth.value) + 1
})
const selectYear = ref(new Date().getFullYear())
const selectMonth = ref(new Date().toLocaleString('en-US', { month: 'long' }))

// Register Chart.js components
Chart.register(...registerables);

// References and reactive state
const chartCanvas = ref(null);
let chartInstance = null;
const loading = ref(true);
const chartData = ref([]);

// Fetch data from API
const fetchChartData = async () => {
  loading.value = true;
  try {
    const response = await axios.get('/api/dashboard-weekly-sales', {
      params: {
        year: selectYear.value,
        month: monthsIndex.value
      }
    });
    chartData.value = response.data;
  } catch (error) {
    console.error('Error fetching chart data:', error);
  } finally {
    loading.value = false;
    // Create chart after data is loaded
    if (chartCanvas.value) {
      createChart();
    }
  }
};

// Process data for the chart
const processedData = computed(() => {
  return {
    labels: chartData.value.map(item => `Week ${item.week_group}`),
    datasets: [
      {
        label: `Weekly Sales of ${selectMonth.value} ${selectYear.value}`,
        data: chartData.value.map(item => item.total),
        fill: true,
        borderColor: 'green',
        tension: 0.1
      }
    ]
  };
});

const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      position: 'top',
    },
    title: {
      display: true,
    }
  },
  scales: {
    y: {
      beginAtZero: true
    }
  }
};

// Create or update chart
const createChart = () => {
  const ctx = chartCanvas.value.getContext('2d');

  // If chart exists, destroy it first
  if (chartInstance) {
    chartInstance.destroy();
  }

  chartInstance = new Chart(ctx, {
    type: 'line',
    data: processedData.value,
    options: chartOptions
  });
};

// Lifecycle hooks

watch(selectYear, (oldVal, newVal) => {
  fetchChartData()
})
watch(selectMonth, (oldVal, newVal) => {
  fetchChartData()

})

onMounted(() => {
  GET_DATE_SALES_CATEGORY();
  fetchChartData();
});

onBeforeUnmount(() => {
  if (chartInstance) {
    chartInstance.destroy();
  }
});
</script>

<template>
  <div class="line_chart">
    <div class="line_chart_action">
      <select name="" id="" class="form-select" v-model="selectYear">
        <option :value="data.year" selected v-for="data in dateSalesCategoryData.sales_year">{{ data.year }}</option>
      </select>
      <select class="form-select" v-model="selectMonth">
        <option :value="data" selected v-for="data in months">{{ data }}</option>
      </select>
    </div>
    <canvas ref="chartCanvas"></canvas>
  </div>
</template>



<style scoped>
.line_chart {
  max-width: 100%;
  max-height: auto;
  background: white;
  box-shadow: 0px 0px 5px 0px gray;
  border-radius: 5px;
  padding: 10px;
}

canvas {
  max-height: 500px;
}

select {
  border: 1px solid black;
}

select:focus {
  box-shadow: none;
}

.line_chart_action {
  width: 20rem;
  display: flex;
  gap: 10px;
}
</style>