<script setup>
import { onMounted, ref } from 'vue';


const emit = defineEmits(['closeModal'])
const province = ref(Object)
const provinceValue = ref()
const select = ref({
    province: '',
    district: '',
    ward: ''
})

const PROVINCE_API = async () => {
    const response = await axios.get('https://psgc.gitlab.io/api/provinces/')
    province.value = response.data
    provinceValue.value = province.value.sort((a,b) => a.name.localeCompare(b.name)) 
    console.log(provinceValue.value);
}
const closeModal = () => {
  emit('closeModal')
}

onMounted(() => {
    PROVINCE_API()
})

</script>

<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="form-modal-action">
                <div class="">
                    <img src="/public/image/exit_icon.png" width="35" alt="" @click="closeModal">
                </div>
            </div>
            <div class="form-modal-title">
                <span>Add New Address</span>
            </div>
            <fieldset>
                <form action="">
                    <div class="row">
                        <div class="col form-input">
                            <label for="">First Name</label>
                            <input type="text" placeholder="">
                        </div>
                        <div class="col form-input">
                            <label for="">Last Name</label>
                            <input type="text" placeholder="">
                    </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Floor Unit</label>
                            <input type="text" placeholder="">
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col form-input select">
                            <label for="">Province</label>
                            <select name="" id="" class="form-select" v-model="select.province">
                                <option value="" selected></option>
                                <option :value="data.name" v-for="(data,index) in provinceValue" :key="index" >
                                    {{ data }} {{ data.regionCode }}
                                </option>
                                
                            </select>
                        </div>
                        <div class="col form-input select">
                            <label for="">District</label>
                             <select name="" id="" class="form-select">
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input select">
                            <label for="">Ward</label>
                            <select name="" id="" class="form-select">
                                
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
                        <button>Review Change</button>
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
        fieldset option{
            font-size: 10px;
            height: 10px;
        }
        fieldset select:focus{
            box-shadow: none;
            border:none;
        }
        #form-modal{
            overflow: scroll;
        }
        @media screen and (min-width: 365px) {
            #form-modal {
                position: fixed;
                top:0;
                height: 100%;
                width: 100%;
                z-index: 999;
                display: grid;
                justify-content: center;
                align-items: center;
                background: rgb(255, 255, 255,0.5);
                backdrop-filter: blur(25px);
            }

            .form-modal-main {
                max-width: 50rem;
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