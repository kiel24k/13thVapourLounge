<script setup lang="ts">
import { Button, FileUpload, FloatLabel, InputText, Password } from 'primevue';
import Swal from 'sweetalert2';
import { ref } from 'vue';
const emit = defineEmits('closeUpdateStaffModal')
const props = defineProps(['staffData'])

const staffInfo = ref(props.staffData)
const validation = ref([])

const closeModal = () => {
    emit('closeUpdateStaffModal')
}

const submit = () => {
    axios({
        method: 'POST',
        url: 'api/update-staff',
        data: {
            id: staffInfo.value.id,
            first_name: staffInfo.value.first_name,
            middle_name: staffInfo.value.middle_name,
            last_name: staffInfo.value.last_name,
            email: staffInfo.value.email,
            password: staffInfo.value.password
        }
    }).then(response => {
        if (response.status === 200) {
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Data has been updated",
                showConfirmButton: false,
                timer: 1500
            });
            emit('closeUpdateStaffModal')
        }
    }).catch(e => {
        validation.value = e.response.data.errors
    })
}





</script>

<template>
    <div id="modal">
        <div class="main">
            <form action="" @submit.prevent>
                <div class="row">
                    <div class="col form_title">
                        <h4>Change Staff Info</h4>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="staffInfo.first_name" />
                            <label for="on_label">First Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.first_name">{{ validation.first_name[0] }}</span>
                    </div>
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="staffInfo.middle_name" />
                            <label for="on_label">Middle Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.middle_name">{{ validation.middle_name[0] }}</span>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="staffInfo.last_name" />
                            <label for="on_label">Last Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.last_name">{{ validation.last_name[0] }}</span>
                    </div>
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" v-model="staffInfo.email" />
                            <label for="on_label">Email</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.email">{{ validation.email[0] }}</span>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col">
                        <FloatLabel variant="on">
                            <Password v-model="staffInfo.password" fluid inputId="on_label" />
                            <label for="on_label">Password</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="validation.password">{{ validation.password[0] }}</span>
                    </div>
                </div>



                <div class="row mt-4">
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