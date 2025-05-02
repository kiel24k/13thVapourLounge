<script setup>
import { Button, FloatLabel, InputText } from 'primevue';
import { onMounted, ref } from 'vue';
import { useRouter } from 'vue-router';
import Swal from 'sweetalert2';

const router = useRouter()
const emit = defineEmits(['closeModal'])
const inputValidation = ref({})
const user = ref({})


const exitModal = () => {
    emit('closeModal')
}

const USER_API = async () => {
    try {
        const response = await axios.get('api/user')
        user.value = response.data
    } catch (error) {

    }

}

const saveProfileBtn = async () => {
    try {
        const response = await axios.post('api/edit-profile', {
            first_name: user.value.first_name,
            last_name: user.value.last_name,
            birthday: user.value.birthday,
            mobile_no: user.value.mobile_no,
            gender: user.value.gender
        })
        if (response.status == 200) {
            emit('closeModal')
            Swal.fire({
                position: "top-end",
                icon: "Update Successful",
                title: "Your Profile was update",
                showConfirmButton: false,
                timer: 1500
            });
           
        }
    } catch (error) {
        console.log(error);
        inputValidation.value = error.response.data.errors
    }

}

onMounted(() => {
    USER_API()
})
</script>

<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="form-modal-action ">
                <div class="">
                    <img src="/public/image/exit_icon.png" width="35" alt="" @click="exitModal">
                </div>
            </div>
            <div class="form-modal-title">
                <span>My Account</span>
            </div>
            <fieldset>
                <form action="" @submit.prevent>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="on">
                                <InputText id="on_label" v-model="user.first_name" :invalid="inputValidation.first_name"
                                    autocomplete="off" fluid />
                                <label for="on_label">First Name</label>
                            </FloatLabel>
                            <span class="text-danger" v-if="inputValidation.first_name">{{ inputValidation.first_name[0]
                                }}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <FloatLabel variant="on">
                                <InputText id="on_label" v-model="user.last_name" :invalid="inputValidation.last_name"
                                    autocomplete="off" fluid />
                                <label for="on_label">Last Name</label>
                            </FloatLabel>
                            <span class="text-danger" v-if="inputValidation.last_name">{{ inputValidation.last_name[0]
                                }}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for=""></label>
                            <FloatLabel variant="on">
                                <InputText id="on_label" v-model="user.mobile_no" :invalid="inputValidation.mobile_no"
                                    autocomplete="off" fluid />
                                <label for="on_label">Mobile No.</label>
                            </FloatLabel>
                            <span class="text-danger" v-if="inputValidation.mobile_no">{{ inputValidation.mobile_no[0]
                                }}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <select name="" id="" class="form-select" v-model="user.gender" placeholder="Sex">
                                <option value="" disabled selected>-Sex-</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="warning-change-message">
                        <small>
                            If you change your name, you can't change it again for 60 days. Don't add any unusual
                            capitalization, punctuation, characters or random words. <a href="">Learn More</a>
                        </small>
                    </div>
                    <div class="submit-btn">
                        <Button @click="saveProfileBtn" severity="info" label="Save" raised rounded />
                        <Button @click="exitModal" severity="danger" label="Cancel" raised rounded />
                    </div>
                </form>
            </fieldset>
        </div>
    </div>
</template>

<style scoped>
#form-modal {
    background: rgba(56, 56, 56, 0.5);
    backdrop-filter: blur(5px);
    overflow: scroll;

}

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
        top: 0;
    }

    .form-modal-main {
        max-width: 35rem;
        background: rgb(255, 255, 255);
        border-radius: var(--floating-border-radius);
        display: grid;
        padding: 10px;
        margin: 10px;
        box-shadow: var(--floating-box-shadow);
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

    .submit-btn button {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 25px;
        font-size: 15px;
        font-weight: bold;
        color: white;
        margin-top: 5px;
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