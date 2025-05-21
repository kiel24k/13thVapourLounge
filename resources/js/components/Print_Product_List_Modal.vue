<script setup>
import { ref } from 'vue';
import { Button } from 'primevue';
import html2pdf from 'html2pdf.js'

const emit = defineEmits(['closePrintProductListModal'])
const props = defineProps(['productData'])

const printContent = ref(null)
const print = () => {
    const elem = printContent.value
    const options = {
        margin: 1,
        filename: 'Product List.pdf',
        image: { type: 'jpeg', quality: 10 },
        html2canvas: { scale: 2, useCORS: true },
        jsPDF: { unit: 'pt', format: 'a4', orientation: 'landscape' },
    }
    html2pdf()
        .from(elem)
        .set(options)
        .save();
    emit('closePrintProductListModal')


}

const closeModal = () => {
    emit('closePrintProductListModal')
}
</script>

<template>
    <div id="modal">
        <div class="main">
            <section ref="printContent" class="print-container">
                <div class="row">
                    <div class="col title">
                        <figure>
                            <img src="/public/image/shopcover.jpg" width="250" height="100" alt="">
                        </figure>
                        <figcaption>
                            <h4>Trece Martires City, Cavite</h4>
                            <h4> Brgy San Agustin</h4>
                        </figcaption>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                       <div class="print-container">
                        <table class="table table-hover  ">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th @click="sort('product_name')">
                                        <div class="table_header">
                                            <div class="table_head_title">
                                                Name
                                            </div>
                                        </div>
                                    </th>
                                    <th @click="sort('product_label')">
                                        <div class="table_header">
                                            <div class="table_head_title">
                                                Label
                                            </div>
                                         
                                        </div>
                                    </th>
                                    <th @click="sort('product_price')">
                                        <div class="table_header">
                                            <div class="table_head_title">
                                                Price
                                            </div>
                                           
                                        </div>
                                    </th>
                                    <th @click="sort('quantity')">
                                        <div class="table_header">
                                            <div class="table_head_title">
                                                Quantity
                                            </div>
                                          
                                        </div>
                                    </th>
                                    <th @click="sort('description')">
                                        <div class="table_header">
                                            <div class="table_head_title">
                                                Description
                                            </div>
                                           
                                        </div>
                                    </th>   
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(data, index) in productData.data" :key="index">
                                    <td>{{ index + 1 }}</td>
                                    <td style="display: flex; gap:10px;">
                                        <div class="">
                                            <img :src="`http://127.0.0.1:8000/storage/product_image/${data.image}`"
                                                width="40" height="40" alt="">
                                        </div>
                                        <div style="display: grid;">
                                            <span>{{ data.product_label }}</span>
    
                                            <small style="font-weight: 600; color:gray">{{ data.date_released }}</small>
                                        </div>
                                    </td>
                                    <td>{{ data.product_name }}</td>
                                    <td>₱{{ data.product_price }}</td>
    
                                    <td> x{{ data.quantity }} </td>
                                    <td> {{ data.description }} </td>
                                </tr>
                            </tbody>
                        </table>
                       </div>
                    </div>
                </div>
            </section>
            <div class="row">
                <div class="col modal_action">
                    <Button label="Close" severity="danger" @click="closeModal()" />
                    <Button label="Okay" severity="info" @click="print()" />
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
#modal {
    position: fixed;
    top: 0;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background-color: rgb(0, 0, 0, 0.5);
    display: grid;
    justify-content: center;
    align-items: center;
    align-content: center;

}

.main {
    padding: 10px;
    background: white;
    height: auto;
}

figure {
    display: grid;
    justify-content: center;
}

figcaption {
    display: grid;
    text-align: center;
}

.modal_action {
    display: flex;
    gap: 5px;
    justify-content: end;
}



  .print-container{
    width: 841.89pt;
    height: 595.28pt;
    padding: 20px;
    box-sizing: border-box;
  }
</style>