<script setup>
import { Button, FloatLabel, InputNumber, InputText, Message } from 'primevue';
import { ref } from 'vue';
import html2pdf from 'html2pdf.js'

const printContent = ref(null)
const emit = defineEmits(['closeModalReceipt'])
const inputs = ref({})
const date = new Date()
const formatter = new Intl.NumberFormat();



const props = defineProps(['itemSection', 'propsForCustomerName', 'overAllTotal'])
const closeModal = () => {
    emit('closeModalReceipt')
}

const printReceipt = () => {
    const elem = printContent.value
    const options = {
        margin: 1,
        filename: 'receipt.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 4 },
        jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait' },
    };
    html2pdf()
        .from(elem)
        .set(options)
        .save();
};
</script>

<template>
    <div id="modal">
        <div class="modal-main">
            <div class="row modal-title">
                <div class="col text-end">
                    <Button icon="pi pi-times" severity="danger" rounded @click="closeModal" />
                </div>
            </div>
            <div class="row ">

                <div class="receipt-content" ref="printContent">
                    <div class="receipt_title">
                        <h1>Vapour Lounge</h1>
                        <h5>Trece Martires City, Cavite</h5>
                        <span>Brgy San Agustin</span>
                    </div>
                    <div class="receipt_id">
                        
                    </div>
                    <div class="mt-3">
                        <h2>Order</h2>
                        <table class="table">
                            <tbody>
                                <tr v-for="(data) in itemSection">
                                    <td>{{ data.product_label }}</td>
                                    <td>₱{{ data.product_price }}.00</td>
                                    <td>x{{ data.quantity }}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="table-total">
                           
                            <b>Total: ₱{{ formatter.format(overAllTotal) }}.00</b>
                            
                            <hr>
                            <label for=""><b>Cash:</b></label>
                            <input type="number" placeholder="ex: 999,999,9" v-model="inputs.amount"
                                class="form-control">
                            
                            <hr>
                            <b v-if="inputs.amount >= overAllTotal">Exhange: ₱{{ formatter.format(inputs.amount -
                                overAllTotal) }}.00</b>
                            <b v-else>Exhange: ₱0.00</b>
                        </div>
                        <div class="receipt_footer mt-3">
                            <h4>Date issued</h4>
                            <span>{{ date.toLocaleDateString() }}</span>
                        </div>
                    </div>
                </div>
               
                <div class="mt-3 text-end">
                    <Button label="Receipt" severity="info" icon="pi pi-angle-double-right" @click="printReceipt"
                        v-if="inputs.amount >= overAllTotal" />
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
#modal {
    width: 100%;
    position: fixed;
    z-index: 999;
    height: 100%;
    background: rgb(0, 0, 0, 0.5);
    display: grid;
    justify-content: center;
    align-items: center;
}

.modal-main {
    max-width: 50rem;
    background: rgb(254, 255, 254);
    padding: 10px;
    border-radius: 15px;
    margin: 10px;

}

.buyer-info-table td {
    display: flex;
    gap: 10px;
}

.receipt-content {
    z-index: 9999;
}

.modal-title {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.amount-action {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    background-color: rgb(231, 184, 243);
    border-radius: 15px;
}

.balance span {
    font-weight: 500;
    font-size: 25px;
}

.details>div:not(span) {
    width: 60%;
    display: flex;
    justify-content: space-between;

}

.details span {
    color: gray;
}

.enter-amount form {
    display: grid;
}

.enter-amount input {
    padding: 5px;
    border-radius: 10px;
    border: solid 1px rgb(226, 221, 221);
}

.enter-amount input:focus {
    outline: rgb(226, 221, 221);
    color: gray;

}

.receipt_title {
    display: grid;
    font-size: 20px;
    justify-content: center;
    text-align: center;
}

.receipt_footer {
    display: grid;
    justify-content: center;
    text-align: center;
}

.table-total input {
    background-color: white;
    outline: none;
    box-shadow: none;

}

</style>