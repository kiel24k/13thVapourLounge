<script setup>
import { onMounted } from 'vue';


const props = defineProps(['userOrderProduct'])
const emit = defineEmits('closeModal')

const closeModal = () => {
    emit('closeModal')
}

onMounted(() => {
    console.log(props.userOrderProduct);
    
})
</script>

<template>
    <div id="modal">
        <div class="modal-main">
            <div class="row modal-title">
                <div class="col">
                        <b>Details</b>
                </div>
                <div class="col text-end">
                    <img src="/public/image/exit_icon.png" width="30" alt="" @click="closeModal">
                </div>
            </div>
            <div class="row ">
                <div class="col amount">
                    <span>Total</span>
                    <div class="amount-action p-4">
                        <div class="balance">
                           
                        </div>
                        <div class="">
                            <button class="btn btn-danger">Print</button>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="details">
                    <div class="">
                        <span>Order From</span>
                       {{props.userOrderProduct.fname}}  {{props.userOrderProduct.lname}}
                    </div>
                    <div class="">
                        <span>Date</span>
                        {{props.userOrderProduct.date}}
                        
                    </div>
                </div>
               <div class="row">
                <div class="col">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in props.userOrderProduct.data" :key="index">
                                <td class="productData">
                                    <div class="">
                                        <img :src="`/storage/product_image/${data.image}`" width="50" alt="">
                                    </div>
                                   <div class="">
                                    {{ data.product_label }}
                                   </div>
                                </td>
                                <td>x{{ data.quantity }}</td>
                                <td>{{ data.price }}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
               </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
    #modal {
        width: 100%;
        position: fixed;
        z-index:999;
        height: 100%;
        background: rgb(253, 253, 253,0.5);
        display: grid;
        justify-content: center;
        align-items: center;
    }

    .modal-main {
        max-width: 80rem;
        background: rgb(254, 255, 254);
        padding: 10px;
        border-radius: 15px;
        margin:10px;
        box-shadow: 0px 0px 5px 0px gray;
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
    .balance span{
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
        outline: rgb(226, 221, 221);;
        color:gray;

    }
    .productData{
       
        gap:10px;
     
    }
</style>