<script setup>
import { onMounted, ref } from 'vue';

const emit = defineEmits(['closeModal'])
const props = defineProps(['user'])
const inputs = ref({})
const imageFile = ref()
const imagePreview = ref('')

const closeModal = () => {
   emit('closeModal')
}

const user_emit = () => {
    inputs.value = props.user 
}

const submit = async () => {
    try {
        // console.log(imageFile.value);
        
        const response = await axios.post('api/update-admin-profile',
            {   
                first_name: inputs.value.first_name,
                last_name:inputs.value.last_name,
                email: inputs.value.email,
                image: imageFile.value
            },
            {
                headers:{
                    'content-type': 'multipart/form-data'
                }
            }
        )
        console.log(response);
        
    } catch (error) {
        console.log(error);
        
        
    }
}

const image = (e) => {
     const file =  e.target.files[0]  
    if(file){
        imageFile.value = file
        imagePreview.value = URL.createObjectURL(file)
    }
}

onMounted(() => {
   
   user_emit()
    
})
</script>

<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="form-modal-title">
                <span>Name</span>
                <img src="/public/image/exit_icon.png"  width="35" alt="" @click="closeModal">
            </div>
            <fieldset>
                <form action="" @submit.prevent enctype="multipart/form-data">
                    <div class="row">
                        <div class="col form-input">
                            <label for="">First Name</label>
                            <input type="text" placeholder="" v-model="inputs.first_name" >
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Last Name</label>
                            <input type="text" placeholder="" v-model="inputs.last_name">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Email</label>
                            <input type="text" placeholder="" v-model="inputs.email">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Image</label>
                            <img :src="imagePreview" alt="" v-if="imagePreview" class="p-4" width="100" height="100">
                            <input type="file" placeholder="" class="form-control" @change="image">
                        </div>
                    </div>
                    <div class="warning-change-message">
                        <small>
                            If you change your name, you can't change it again for 60 days. Don't add any unusual
                            capitalization, punctuation, characters or random words. <a href="">Learn More</a>
                        </small>
                    </div>
                    <div class="submit-btn">
                        <button @click="submit">Review Change</button>
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
        .form-modal-title{
            display: flex;
            justify-content: space-between;
            align-items: center;
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
                background-color: rgb(0, 0, 0,0.5);
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