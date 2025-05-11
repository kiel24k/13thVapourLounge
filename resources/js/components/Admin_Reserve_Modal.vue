<script setup>
import { Button, FloatLabel, InputNumber, InputText, Message, Textarea } from 'primevue';
import Swal from 'sweetalert2';
import { ref } from 'vue';

//COMPONENT VARIABLES
const props = defineProps(['posTableData','overAllTotal', 'quantityTotal'])
const emit = defineEmits(['closeReserve', 'submitSuccess'])
const input = ref({})
const validation = ref({})

//COMPONENTS FUNCTION
const submit = async () => {
    console.log(props.posTableData);
    
    await axios({
        method: 'POST',
        url: '/api/pos-reserve-product',
        data: {
            product: props.posTableData,
            name: input.value.name,
            note: input.value.note,
            overall_quantity: props.overAllTotal,
            overall_total:props.quantityTotal
        }
    }).then(response => {
        console.log(response);
        
        if (response.status === 200) {
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Reserved",
                showConfirmButton: false,
                timer: 1500
            });
            emit('submitSuccess')
            emit('closeReserve')
        }

    }).catch(e => {
        console.log(e);
        
        if(e.response.status === 422){
            validation.value = e.response.data.errors
        }
    })
}

const closeReserve = () => {
    emit('closeReserve')
}
</script>

<template>
    <div id="modal">
        <div class="main">
            <section class="bg-white p-5">
                <div class="row">
                    <div class="col form_title">
                        <Message icon="pi pi-info" severity="secondary">
                            <h4>Reserve form</h4>
                        </Message>
                    </div>
                </div>
                <div class="row ">
                    <div class="col ">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product label</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="data in posTableData">
                                    <td>{{data.product_label}}</td>
                                    <td>{{data.quantity}}</td>
                                    <td>{{data.price}}</td>
                                    <td>{{data.total}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <span class="text-danger" v-if="validation.name">{{ validation.name[0] }}</span>
                        <FloatLabel variant="on">
                            <Textarea id="over_label" v-model="input.name" rows="1" cols="70"  />
                            <label for="on_label">Name</label>
                        </FloatLabel>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <FloatLabel variant="on">
                            <Textarea id="over_label" v-model="input.note" rows="5" cols="70"  />
                            <label for="on_label">Note</label>
                        </FloatLabel>
                    </div>
                </div>
             
                <div class="row mt-3">
                    <div class="col modal_action">
                        <Button label="Close" severity="danger" raised @click="closeReserve()"/>
                        <Button label="Submit" severity="info" raised @click="submit()"/>
                    </div>
                </div>
            </section>
        </div>
    </div>
</template>

<style scoped>
#modal {
    position: fixed;
    height: 100%;
    width: 100%;
    justify-content: center;
    align-items: center;
    display: grid;
    background-color: rgb(0, 0, 0, 0.5);
    z-index: 999;
}


.modal_action{
    display: flex;
    justify-content: end;
    gap:10px;
}
</style>