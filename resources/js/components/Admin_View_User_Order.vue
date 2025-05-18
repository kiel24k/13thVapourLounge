<script setup>
import { onMounted, ref, watch } from 'vue';
import AdminStatusUpdateModal from '@/components/Admin_Update_Status_Modal.vue'
import { Button, Message } from 'primevue';


const props = defineProps(['userOrderProduct'])
const emit = defineEmits('closeModal', 'notification')
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
    adminStatusUpdateModal.value = false
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
        <AdminStatusUpdateModal v-if="adminStatusUpdateModal" @updateStatusModal="updateStatusModal"
            :editStatusId="editStatusId" @submitCloseModal="submitCloseModal" />
        <div class="modal-main">
            <div class="row modal-title">
                <div class="col user-info">
                    <Message severity="contrast">
                        {{ userOrderProduct.first_name }} {{ userOrderProduct.last_name }}'s Order
                    </Message>
                </div>
            </div>
            <div class="modal_content mt-3">
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
                    <div class="col text-end">
                        <Button severity="danger" label="Close" @click="closeModal()"/>
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
    background: rgba(0, 0, 0, 0.5);
    display: grid;
    justify-content: center;
    align-items: center;
}

.modal-main {
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
.modal_content{
    display: grid;
    justify-content: center;
    gap:20px;
    align-items: center;
    width:40rem;
}
</style>