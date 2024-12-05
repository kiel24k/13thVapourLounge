<script setup>
import { Button, FloatLabel, InputNumber, InputText, Message } from 'primevue';
import { ref } from 'vue';
import html2pdf from 'html2pdf.js'

const printContent = ref(null)
const emit = defineEmits(['closeModalReceipt'])
const inputs = ref({})


const props = defineProps(['itemSection', 'propsForCustomerName', 'overAllTotal'])
const closeModal = () => {
    emit('closeModalReceipt')
}

const printReceipt = () => {
    const elem = printContent.value
    const options = {
        margin: 1,
        filename: 'document.pdf',
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
                <div class="">
                    <span>Buyer's Name: {{ propsForCustomerName.first_name }} {{ propsForCustomerName.last_name
                        }}</span>
                    <hr>
                </div>
                <div class="mt-3">
                    <FloatLabel variant="in">
                        <InputNumber :useGrouping="false" fluid v-model="inputs.contact_no" />
                        <label for="in_label">Contact No.</label>
                    </FloatLabel>
                </div>
                <div class="mt-3">
                    <FloatLabel variant="in">
                        <InputText :useGrouping="false" fluid v-model="inputs.address" />
                        <label for="in_label">Address</label>
                    </FloatLabel>
                </div>
                <div class="mt-3">
                    <FloatLabel variant="in">
                        <InputNumber :useGrouping="false" fluid v-model="inputs.amount" />
                        <label for="in_label">Amount</label>
                    </FloatLabel>

                </div>
                <div class="receipt-content" ref="printContent">
                    <div class="mt-3" v-if="inputs">
                        <h2>Buyers Info</h2>
                        <table class="table buyer-info-table">
                            <tbody>
                                <tr>
                                    <td>
                                        <i class="pi pi-phone"></i>{{ inputs.contact_no }}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="pi pi-warehouse"></i>{{ inputs.address }}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="pi pi-wallet"></i>P{{ inputs.amount }}.00
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-3">
                        <h2>Orders</h2>
                        <table class="table">
                            <tbody>
                                <tr v-for="(data) in itemSection">
                                    <td>{{ data.product_label }}</td>
                                    <td>P{{ data.product_price }}</td>
                                    <td>x{{ data.quantity }}</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="table-total">
                            <b>Total: P{{ overAllTotal }}.00</b>
                            <hr>
                            <b v-if="inputs.amount">Exhange: P{{ inputs.amount - overAllTotal }}.00</b>
                        </div>
                    </div>
                </div>
                <div class="mt-3 text-end">
                    <Button label="Go to Receipt" severity="info" icon="pi pi-angle-double-right"
                        @click="printReceipt" />
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
.buyer-info-table td{
    display: flex;
    gap:10px;
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
    ;
    color: gray;

}
</style>