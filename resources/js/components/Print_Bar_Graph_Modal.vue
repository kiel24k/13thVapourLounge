<script setup>
import { ref } from 'vue';
import BarChart from '@/components/Admin_Bar_Chart.vue'
import { Button } from 'primevue';
import html2pdf from 'html2pdf.js'

const emit = defineEmits(['closePrintBarGraphModal'])

const printContent = ref(null)
const print = () => {
    const elem = printContent.value
    const options = {
        margin: 1,
        filename: 'Monthly Sales.pdf',
        image: { type: 'jpeg', quality: 2.0 },
        html2canvas: { scale: 3, useCORS: true },
        jsPDF: { unit: 'pt', format: 'a4', orientation: 'landscape' },
    }
    html2pdf()
        .from(elem)
        .set(options)
        .save();
    emit('closePrintBarGraphModal')


}

const closeModal = () => {
    emit('closePrintBarGraphModal')
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
                        <BarChart />
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

.print-container {
    width: 841.89pt;
    /* A4 landscape width */
    height: 595.28pt;
    /* A4 landscape height */
    overflow: hidden;
    box-sizing: border-box;
    transform-origin: top left;
}
</style>