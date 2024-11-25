<script setup>
import { Button, FloatLabel, InputNumber, InputText, Message } from 'primevue';

const emit = defineEmits(['closeModal'])
const closeModal = () => {
   emit('closeModal')
}
</script>

<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="form-modal-action">
                <div class="">
                    <Button icon="pi pi-times" severity="danger" raised rounded @click="closeModal"/>
                </div>
            </div>
            <div class="form-modal-title mt-3">
               <Message severity="warn" icon="pi pi-user">New Customer</Message>
            </div>
            <fieldset>
                <form action="">
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="in">
                                <InputText id="in_label" fluid variant="filled" />
                                <label for="in_label">First Name</label>
                            </FloatLabel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="in">
                                <InputText id="in_label" fluid variant="filled" />
                                <label for="in_label">Middle Name</label>
                            </FloatLabel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="in">
                                <InputText id="in_label" fluid variant="filled" />
                                <label for="in_label">Last Name</label>
                            </FloatLabel>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="in">
                                <InputNumber   inputId="withoutgrouping" :useGrouping="false" fluid />
                                <label for="in_label">Mobile No.</label>
                            </FloatLabel>
                        </div>
                    </div>
                    <div class="submit-btn text-end">
                        <Button label="Submit" raised severity="contrast"/>
                    </div>
                </form>
            </fieldset>
        </div>
    </div>
</template>

<style scoped>
.form-modal-action{
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
        background:rgb(0, 0, 0, 0.5);
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