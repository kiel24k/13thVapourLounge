<script setup lang="ts">
import { Button, FloatLabel, InputText } from 'primevue';

//COMPONENTS VARIABLE 
const emits = defineEmits(['closeChangePasswordModal'])
//COMPONENTS FUNCTION 
const closeModal = () => {
    emits('closeChangePasswordModal')
}
</script>

<template>
<div id="modal">
    <div class="main">
        <form action="" class="p-5">
            <div class="row">
                <div class="col">
                    <h4>Change Password</h4>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <FloatLabel variant="on">
                        <InputText id="on_label" v-model="value3" />
                        <label for="on_label">Current Password</label>
                    </FloatLabel>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <FloatLabel variant="on">
                        <InputText id="on_label" v-model="value3" />
                        <label for="on_label">New Password</label>
                    </FloatLabel>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <FloatLabel variant="on">
                        <InputText id="on_label" v-model="value3" />
                        <label for="on_label">Confirma Password</label>
                    </FloatLabel>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col form_action">
                   <Button label="Close" severity="danger" @click="closeModal()"/>
                   <Button label="Submit" severity="info"/>
                </div>
            </div>
        </form>

    </div>
</div>
</template>

<style scoped> 
#modal{
    position: fixed;
    z-index: 999;
    width: 100%;
    height: 100%;
    display: grid;
    align-items: center;
    justify-content: center;
    background:rgb(0,0,0,0.5)
}
form{
    box-shadow: 0px 0px 10px gray;
    background-color: white;
}
.form_action{
    display: flex;
    gap:10px;
    justify-content: end;
}

</style>