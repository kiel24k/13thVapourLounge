<script setup lang="ts">
import { Button, FileUpload, FloatLabel, InputText, Password } from 'primevue';
import Swal from 'sweetalert2';
import { ref } from 'vue';
const emit = defineEmits('closeNewStaffModal')

//API VARIABLES

//COMPONENTS FUNCTION
const input = ref({})
const validation = ref({})



//API FUNCTION 
const ADD_STAFF_API = () => {
    axios({
        method: 'POST',
        url: '/api/add-staff',
        data: {
            first_name: input.value.first_name,
            middle_name: input.value.last_name,
            last_name: input.value.last_name,
            email: input.value.email,
            password: input.value.password
        }
    }).then(response => {
        if (response.status === 200) {
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: false,
                timer: 1500
            });
            emit('closeNewStaffModal')
        }

    }).catch(e => {
        validation.value = e.response.data.errors


    })
}


//COMPONENTS FUNCTION 
const closeModal = () => {
    emit('closeNewStaffModal')
}

</script>

<template>
    <div id="modal">
        <div class="main">
            <form action="">
                <div class="row">
                    <div class="col form_title">
                        <h4>New Staff</h4>
                        <hr>
                    </div>
                </div>
                <div class="row">

                    <div class="col">

                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="input.first_name" />
                            <label for="on_label">First Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.first_name">{{ validation.first_name[0] }}</span>
                    </div>
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="input.middle_name" />
                            <label for="on_label">Middle Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.middle_name">{{ validation.middle_name[0] }}</span>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="input.last_name" />
                            <label for="on_label">Last Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.last_name">{{ validation.last_name[0] }}</span>
                    </div>
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="input.email" />
                            <label for="on_label">Email</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.email">{{ validation.email[0] }}</span>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <Password fluid placeholder="Password" toggleMask v-model="input.password" />
                        <span class="text-danger" v-if="validation.password">{{ validation.password[0] }}</span>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col form_action">
                        <Button label="Close" severity="danger" @click="closeModal()" />
                        <Button label="Submit" severity="info" @click="ADD_STAFF_API()" />
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
    z-index: 9999;
    width: 100%;
    height: 100%;
    display: grid;
    justify-content: center;
    background: rgb(0, 0, 0, 0.5);
    align-items: center;
}

.main {
    background: white;
    padding: 20px;
}

.form_action {
    display: flex;
    gap: 10px;
    justify-content: end;
}
</style>