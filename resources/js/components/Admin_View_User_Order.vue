<script setup>
import { onMounted, ref, watch } from 'vue';
import AdminStatusUpdateModal from '@/components/Admin_Update_Status_Modal.vue'


const props = defineProps(['userOrderProduct'])
const emit = defineEmits('closeModal','notification')
const adminStatusUpdateModal = ref(false)
const editStatusId = ref()



const editStatus = (id) => {
    editStatusId.value = id
    adminStatusUpdateModal.value = true
}


const closeModal = () => {
    emit('closeModal')
}

const updateStatusModal = () => {
    adminStatusUpdateModal.value =false
    emit('closeModal')
}

const submitCloseModal = () => {
    emit('notification')

}

onMounted(() => {



})
</script>

<template>

    <div id="modal">
        <AdminStatusUpdateModal v-if="adminStatusUpdateModal" @updateStatusModal="updateStatusModal" :editStatusId="editStatusId" @submitCloseModal="submitCloseModal" />
        <div class="modal-main">
            <div class="row modal-title">
                <div class="col user-info">
                    <b>{{ userOrderProduct.name }} Order</b>
                    <img src="/public/image/exit_icon.png" width="30" alt="" @click="closeModal">
                </div>
            </div>

            <div class="row ">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Product</th>
                                    <th>Sub Order Info</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <tr v-for="(data, index) in userOrderProduct.data" :key="index">
                                    <td>
                                        {{ index + 1 }}
                                    </td>
                                    <td class="productFigure">
                                        <figure>
                                            <img :src="`/storage/product_image/${data.order_image}`" width="50" alt="">
                                        </figure>
                                        <figcaption>
                                            
                                            {{ data.order_label }}
                                        </figcaption>
                                    </td>
                                    <td>
                                        {{ data.first_name }} {{ data.last_name }} / {{ data.mobile_no }}
                                    </td>
                                    <td>
                                        QTY: {{ data.order_quantity }}
                                    </td>
                                    <td>
                                        P{{ data.order_price }}
                                    </td>
                                    <td>
                                        <span> {{ data.status }}</span>
                                    </td>
                                    <td>
                                        <button class="btn btn-dark" @click="editStatus(data.id)">update status</button>
                                    </td>
                                    <td>
                                    </td>
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
    z-index: 999;
    height: 100%;
    background: rgb(253, 253, 253, 0.5);
    display: grid;
    justify-content: center;
    align-items: center;
}

.modal-main {
    width: 90rem;
    background: rgb(254, 255, 254);
    padding: 10px;
    border-radius: 15px;
    margin: 10px;
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

.productData {

    gap: 10px;

}

.productFigure {
    display: flex;
    gap: 10px;
}

.user-info {
    display: flex;
    justify-content: space-between;
}

.data-select {
    background: rgba(77, 75, 75, 0.5);
    backdrop-filter: blur(25);
    color: white;
    border: none;
    padding: 5px;
    border-radius: 20px;
    text-align: start;
    text-transform: capitalize;

}

.data-select option {
    color: white;
}
</style>