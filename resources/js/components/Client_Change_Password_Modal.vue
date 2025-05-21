<script setup lang="ts">
import { Button, FloatLabel, InputText } from 'primevue';
import Swal from 'sweetalert2';
import { ref } from 'vue';

//API VARIABLE
const input = ref({})
const validation = ref([])
const passwordValidation = ref(false)

//COMPONENTS VARIABLE 
const emits = defineEmits(['closeChangePasswordModal'])
//COMPONENTS FUNCTION 
const closeModal = () => {
    emits('closeChangePasswordModal')
}

//API FUNCTION
const submit = () => {
    axios({
        method: 'POST',
        url: '/api/change-password',
        data: {
            current_password: input.value.current_password,
            password: input.value.password,
            password_confirmation: input.value.password_confirmation
        }
    }).then(response => {
        console.log(response);
        
        if (response.status === 200) {
            Swal.fire("Password changed!");
            emits('closeChangePasswordModal')
        }
    }).catch(e => {
if(e.response.status === 422){
    validation.value = e.response.data.errors
}else{
    validation.value = {}
}
       if(e.response.data.messages === 'current password is not matched'){
        passwordValidation.value = true
       }







    })
}
</script>

<template>
    <div id="modal">
        <div class="main">
            <form action="" @submit.prevent class="p-5">
                <div class="row">
                    <div class="col">
                        <h4>Change Password</h4>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <p class="text-danger" v-if="passwordValidation">Current password not matched</p>
                        <p class="validation text-danger" v-if="validation.current_password">{{
                            validation.current_password[0] }}</p>
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="input.current_password" />
                            <label for="on_label">Current Password</label>
                        </FloatLabel>
                    </div>
             
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <p class=" validation text-danger" v-if="validation.password">{{ validation.password[0] }}</p>
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="input.password" />
                            <label for="on_label">New Password</label>
                        </FloatLabel>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                         <p class=" validation text-danger" v-if="validation.password_confirmation">{{
                                validation.password_confirmation[0] }}</p>
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="input.password_confirmation" />
                            <label for="on_label">Confirm Password</label>
                        </FloatLabel>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col form_action">
                        <Button label="Close" severity="danger" @click="closeModal()" />
                        <Button label="Submit" severity="info" @click="submit()" />
                    </div>
                </div>
            </form>

        </div>
    </div>
</template>

<style scoped>
#modal {
    position: fixed;
    z-index: 9999;
    width: 100%;
    height: 100%;
    display: grid;
    align-items: center;
    justify-content: center;
    background: rgb(0, 0, 0, 0.5)
}

form {
    box-shadow: 0px 0px 10px gray;
    background-color: white;
}

.form_action {
    display: flex;
    gap: 10px;
    justify-content: end;
}

form .validation {
    width: 12rem;
}
</style>