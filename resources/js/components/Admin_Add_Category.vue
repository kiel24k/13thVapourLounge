<script setup>
import Swal from 'sweetalert2';
import { ref } from 'vue';
import { useRouter } from 'vue-router';


const router = useRouter()
const emit = defineEmits(['closeModal', 'notification'])
const categoryInputs = ref({})
const categoryValidation = ref({})

const saveBtn = async () => {
    try {
        const response = await axios.post('api/create-category', {
            product_type: categoryInputs.value.product_type,
            product_name: categoryInputs.value.product_name,
            description: categoryInputs.value.description
        })
        if (response.status === 200) {
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "New category saved!",
                showConfirmButton: false,
                timer: 1500
            });
            emit('closeModal')
            emit('notification')
        }
    } catch (error) {
        if (error.status === 422) {
            categoryValidation.value = error.response.data.errors
        }
    }
}
const closeModal = () => {
    emit('closeModal')
}
</script>

<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="form-modal-action">
                <img src="/public/image/exit_icon.png" width="35" alt="" @click="closeModal">
            </div>
            <div class="form-modal-title">
                <span>CREATE NEW CATEGORY</span>
            </div>
            <fieldset>
                <form action="" @submit.prevent>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Category name</label>
                            <input type="text" placeholder="" v-model="categoryInputs.product_type">
                            <span v-if="categoryValidation.product_type">{{ categoryValidation.product_type[0] }}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Product type</label>
                            <input type="text" placeholder="" v-model="categoryInputs.product_name">
                            <span v-if="categoryValidation.product_name">{{ categoryValidation.product_name[0] }}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Details</label>
                            <textarea class="form-control" name="" id="" v-model="categoryInputs.description"></textarea>
                            <span v-if="categoryValidation.description">{{ categoryValidation.description[0] }}</span>
                        </div>
                    </div>
                    <div class="warning-change-message">
                        <small>
                            If you add your Category, you can't change it again for 60 days. Don't add any unusual
                            capitalization, punctuation, characters or random words. <a href="">Learn More</a>
                        </small>
                    </div>
                    <div class="submit-btn">
                        <button @click="saveBtn">Save</button>
                        <button class="bg-danger mt-2" @click="closeModal">Cancel</button>
                    </div>
                </form>
            </fieldset>
        </div>
    </div>
</template>

<style scoped>
@media screen and (min-width: 365px) {
    #form-modal {
        position: fixed;
        height: 100%;
        width: 100%;
        z-index: 999;
        display: grid;
        justify-content: center;
        align-items: center;
        background-color: rgb(199, 199, 199, 0.5);
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

    .form-modal-action {
        text-align: end;
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

    .form-input span {
        color: red;
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

    .submit-btn button {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 25px;
        background-color: rgb(0, 100, 224);
        font-size: 15px;
        font-weight: bold;
        color: white;
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

    .form-modal-action {
        display: flex;
        justify-content: end;
        align-items: center;
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

    .submit-btn button {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 25px;
        background-color: rgb(0, 100, 224);
        font-size: 15px;
        font-weight: bold;
        color: white;
    }

}
</style>