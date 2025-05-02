<script setup>
import html2pdf from 'html2pdf.js'
import { Button } from 'primevue';
import { onMounted, ref } from 'vue';

const sortBy = ref('')
const sortOrder = ref('desc')
const categoryListData = ref({})
const printContent = ref(null)
const table_icon = ref(true)

const GET_CATEGORY_LIST_API = async () => {
    await axios({
        method: 'GET',
        url: '/api/category-table',
        params: {
            sortBy: sortBy.value,
            sortOrder: sortOrder.value,
        }
    }).then(response => {
        console.log(response);

        categoryListData.value = response.data
    })
}

const sort = (column) => {
    if (sortBy.value === column) {
        sortOrder.value = sortOrder.value === 'asc' ? 'desc' : 'asc'
    } else {
        sortOrder.value = 'asc'
        sortBy.value = column
    }
    GET_CATEGORY_LIST_API()
}

const print = () => {
    table_icon.value = false
    const elem = printContent.value
    const options = {
        margin: 1,
        filename: 'document.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' },
    };
  
    setTimeout(() => {
        table_icon.value = true
       
    }, 1000);
    
    html2pdf()
        .from(elem)
        .set(options)
        .save();
}

onMounted(() => {
    GET_CATEGORY_LIST_API()
})

</script>

<template>
<div class="list">
  <div class="table_main">
    <table class="table table-bordered table-hover table-responsive"  ref="printContent">
        <thead>
            <tr>
                <th>#</th>
                <th @click="sort('product_type')">
                    <div class="table_header">
                        <div class="table_head_title">
                            Product type
                        </div>
                        <div class="table_head_icon" v-if="table_icon">
                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                        </div>
                    </div>
                </th>
                <th @click="sort('product_name')">
                    <div class="table_header">
                        <div class="table_head_title">
                            Product name
                        </div>
                        <div class="table_head_icon" v-if="table_icon">
                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                        </div>
                    </div>
                </th>
                <th @click="sort('description')">
                    <div class="table_header">
                        <div class="table_head_title">
                            Description
                        </div>
                        <div class="table_head_icon" v-if="table_icon">
                            <i class="pi pi-sort-amount-down-alt" v-if="sortOrder === 'asc'"></i>
                            <i class="pi pi-sort-amount-down" v-if="sortOrder === 'desc'"></i>
                        </div>
                    </div>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="(data, index) in categoryListData.data" :key="index">
                <td>{{ index + 1 }}</td>
                <td>{{ data.product_type }}</td>
                <td>{{ data.product_name }}</td>
                <td> {{ data.description }} </td>
            </tr>
        </tbody>
    </table>
    <div class="print text-end">
        <Button label="Print" icon="pi pi-file-pdf" severity="danger" @click="print()" />
    </div>
  </div>
</div>
</template>

<style scoped>
.list{
    position: fixed;
    height: 100%;
    width: 100%;
    display: grid;
    justify-content: center;
    align-items: center;
    align-content: center;
}

.table_main{
    width: 50rem;
    margin: auto;
    padding: 10px;
    box-shadow: 0px 0px 10px 0px gray;
    border-radius: 5px;
}
.table_header{
    display: flex;
    justify-content: space-between;
}
</style>