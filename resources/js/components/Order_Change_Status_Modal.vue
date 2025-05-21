<script setup>
import { Button, Message } from 'primevue';
import { ref } from 'vue';

const emits = defineEmits(['closeOrderChangeStatusModal'])
const props = defineProps(['userOrderProduct'])
const userOrder = ref(props.userOrderProduct)

const closeModal = () => {
    emits('closeOrderChangeStatusModal')
}

const submitBtn = () => {
   
    axios({
        method: 'POST',
        url: 'api/order-update-status',
        data:{
            id: userOrder.value.user_order_id,
            status: userOrder.value.status
        }
    }).then(response => {
      if(response.status === 200){
        emits('closeOrderChangeStatusModal')
      }
        
    })
}

</script>

<template>
    <div id="modal">
        <div class="main">
            <form action="" @submit.prevent>
                <div class="row">
                    <div class="col">
                        <Message severity="contrast">
                            <h4>Change status</h4>
                        </Message>
                         <hr>
                    </div>
                </div>
                  <div class="row modal-title">
                <div class="col user-info">
                    <Message severity="info">
                        {{ userOrderProduct.first_name }} {{ userOrderProduct.last_name }}'s Order
                    </Message>
                </div>
            </div>
                <div class="row">
                    <div class="col">
                        <Message severity="success" icon="pi pi-info">
                            <span>{{ userOrderProduct.product_name }}</span>
                        </Message>
                    </div>
                    <div class="col">
                        <Message severity="success" icon="pi pi-info">
                            <span>{{ userOrderProduct.product_label }}</span>
                        </Message>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <Message icon="pi pi-wallet" severity="success">
                            <span>{{ userOrderProduct.product_price }}</span>
                        </Message>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <Message severity="success" icon="pi pi-info">
                            <span>{{ userOrderProduct.description }}</span>
                        </Message>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="">Choose status:</label>
                        <select class="form-select" v-model="userOrderProduct.status">
                            <option value="cancelled">Cancel</option>
                            <option value="pending">Pending</option>
                            <option value="out-of-delivery">Out of delivery</option>
                            <option value="received">Received</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col content_action">
                        <Button severity="danger" label="Close" @click="closeModal()" />
                        <Button severity="info" label="Change" @click="submitBtn()"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</template>


<style scoped>
#modal {
    position: fixed;
    top: 0;
    z-index: 999;
    background-color: rgb(0, 0, 0, 0.5);
    display: grid;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
}

.main {
    background: white;
    padding: 15px;
    overflow-y: scroll;
}
form{
    display: grid;
    justify-content: center;
    gap:20px;
    align-items: center;
    width:40rem;
  
}
.content_action{
    display: flex;
    gap:20px;
    justify-content: end;
}
</style>