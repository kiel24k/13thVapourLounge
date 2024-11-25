<script setup>
import axios from 'axios';
import { Button, FloatLabel, InputNumber, InputText, Message } from 'primevue';
import { onMounted, ref } from 'vue';
import Swal from 'sweetalert2';

const emit = defineEmits(['closeModal'])
const input = ref({})
const inputValidation = ref({})

const closeModal = () => {
    emit('closeModal')
}

const submit = async () => {
    try {
        const response = await axios.post('api/add-customer', {
            first_name: input.value.first_name,
            middle_name: input.value.middle_name,
            last_name: input.value.last_name,
            mobile_no: input.value.mobile_no
        })
        if (response.status === 200) {
            emit('closeModal')
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Customer Added",
                showConfirmButton: false,
                timer: 1500
            });
        }



    } catch (er) {
        inputValidation.value = er.response.data.error
    }
}




</script>

<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="form-modal-action">
                <div class="">
                    <Button icon="pi pi-times" severity="danger" raised rounded @click="closeModal" />
                </div>
            </div>
            <div class="form-modal-title mt-3">
                <Message severity="warn" icon="pi pi-user">New Customer</Message>
            </div>
            <fieldset>
                <form @submit.prevent>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="in">
                                <InputText id="in_label" fluid variant="filled" :invalid="inputValidation.first_name"
                                    v-model="input.first_name" />
                                <label for="in_label">First Name</label>
                            </FloatLabel>
                            <Message severity="error" v-if="inputValidation.first_name">{{ inputValidation.first_name[0]
                                }}</Message>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="in">
                                <InputText id="in_label" fluid variant="filled" v-model="input.middle_name" />
                                <label for="in_label">Middle Name</label>
                            </FloatLabel>
                            <Message severity="error" v-if="inputValidation.middle_name">{{
                                inputValidation.middle_name[0] }}</Message>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="in">
                                <InputText id="in_label" fluid variant="filled" v-model="input.last_name" />
                                <label for="in_label">Last Name</label>
                            </FloatLabel>
                            <Message severity="error" v-if="inputValidation.last_name">{{ inputValidation.last_name[0]
                                }}</Message>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="in">
                                <InputNumber inputId="withoutgrouping" :useGrouping="false" fluid
                                    v-model="input.mobile_no" />
                                <label for="in_label">Mobile No.</label>
                            </FloatLabel>
                            <Message severity="error" v-if="inputValidation.mobile_no">{{ inputValidation.mobile_no[0]
                                }}</Message>
                        </div>
                    </div>
                    <div class="submit-btn text-end">
                        <Button label="Submit" raised severity="contrast" @click="submit" />
                    </div>
                </form>
            </fieldset>
        </div>
    </div>
</template>

<style scoped>
.form-modal-action {
    display: flex;
    justify-content: end;


}

@media screen and (min-width: 365px) {
    #form-modal {
        position: fixed;
        height: 100%;
        width: 100%;
        z-index: 999;
        display: grid;
        justify-content: center;
        align-items: center;
        background: rgb(0, 0, 0, 0.5);
    }

    .form-modal-main {
        width: 35rem;
        background: rgb(255, 255, 255);
        border-radius: 10px;
        display: grid;
        padding: 10px;
        margin: 10px;
        box-shadow: 0px 0px 3px 0px gray;
    }



    .form-modal-title span {
        font-weight: 550;
        font-size: 30px;
    }

    fieldset {
        background: rgb(248, 248, 248);
        padding: 15px;
        border-radius: 10px;
        margin: 10px;

    }

    fieldset form {
        display: grid;
        gap: 10px;
    }

    .form-input {
        display: grid;
    }

    fieldset input {
        padding: 10px;
        border: solid 1px rgb(197, 195, 195);
        border-radius: 10px;

    }

    fieldset input:focus {
        outline: 0;
        color: gray;
    }
}

@media screen and (max-width: 365px) {
    #form-modal {
        position: fixed;
        height: 100%;
        width: 100%;
        z-index: 999;
        display: grid;
        justify-content: center;
        align-items: center;
    }

    .form-modal-main {
        max-width: 35rem;
        background: rgb(255, 255, 255);
        border-radius: 10px;
        display: grid;
        padding: 10px;
        margin: 10px;
        box-shadow: 0px 0px 3px 0px gray;
    }



    .form-modal-title span {
        font-weight: 550;
        font-size: 30px;
    }

    fieldset {
        background: rgb(248, 248, 248);
        padding: 15px;
        border-radius: 10px;
        margin: 10px;

    }

    fieldset form {
        display: grid;
        gap: 10px;
    }

    .form-input {
        display: grid;
    }

    fieldset input {
        padding: 10px;
        border: solid 1px rgb(197, 195, 195);
        border-radius: 10px;
        min-width: 1rem;

    }

    fieldset input:focus {
        outline: 0;
        color: gray;
    }



}
</style>