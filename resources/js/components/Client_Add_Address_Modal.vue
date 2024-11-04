<script setup>
import { computed, onMounted, ref, watch } from 'vue';


const emit = defineEmits(['closeModal'])
const province = ref(Object)
const municipalities = ref(Object)
const barangay = ref(Object)

const sortProvince = ref()
const sortMunicipalities = ref(Object)
const sortBarangay = ref(Object)

const isMunicipality = ref(true)
const isBaranggay = ref(true)
const isSelectedProvince = ref(false)

const selected = ref()

const select = ref({
    region_code: '',
    municipality_code: '',
    baranggay: ''
})

const inputValidations = ref({
    first_name: '',
    last_name: '',
    mobile_no:'',
    floor_unit_no: ''
})

const inputs = ref({})

const selectedProvinceName = () => {
    const provinceItem = sortProvince.value.find(p => p.code === select.value.region_code)
    if (!provinceItem) {
        isSelectedProvince.value = true
    } else {
        return provinceItem.name
        isSelectedProvince.value = false
    }
}

const selectedMunicipalityName = () => {
    const municipaltityItem = sortMunicipalities.value.find(m => m.code === select.value.municipality_code)
    return municipaltityItem.name
}

const selectedBaranggayName = () => {
    const barrangayItem = sortBarangay.value.find(b => b.code === select.value.baranggay)
    return barrangayItem.name
}

const PROVINCE_API = async () => {
    const response = await axios.get('https://psgc.gitlab.io/api/provinces/')
    province.value = response.data
    sortProvince.value = province.value.sort((a, b) => a.name.localeCompare(b.name))
    // console.log(provinceValue.value);   
}

const MUNICIPALITIES_API = async () => {
    const response = await axios.get(`https://psgc.gitlab.io/api/provinces/${select.value.region_code}/municipalities/`)
    municipalities.value = response.data
    sortMunicipalities.value = municipalities.value.sort((a, b) => a.name.localeCompare(b.name))
    isMunicipality.value = false
}

const BARANGAY_API = async () => {
    const response = await axios.get(`https://psgc.gitlab.io/api/municipalities/${select.value.municipality_code}/barangays/`)
    barangay.value = response.data
    sortBarangay.value = barangay.value.sort((a, b) => a.name.localeCompare(b))
    isBaranggay.value = false
}

const closeModal = () => {
    emit('closeModal')
}

watch(select.value, (oldVal, newVal) => {
    PROVINCE_API()
    MUNICIPALITIES_API()
    BARANGAY_API()
})

const submit = async () => {
    try {
        const response = await axios.post('/api/add-new-address', {
            first_name: inputs.value.first_name,
            last_name: inputs.value.last_name,
            mobile_no: inputs.value.mobile_no,
            floor_unit_no: inputs.value.floor_unit_no,
            province: selectedProvinceName(),
            municipality: selectedMunicipalityName(),
            baranggay: selectedBaranggayName()
        })
        if (response.status === 200) {
            emit('closeModal')
        }
    } catch (error) {
        if (error.response.status === 422) {
            inputValidations.value = error.response.data.errors
        }
    }
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
                <span>Add New Addresss</span>
            </div>
            {{ selected }}
            <fieldset>
                <form action="" @submit.prevent>
                    <div class="row ">
                        <div class="col form-input select">
                            <label for="">Province <span v-if="isSelectedProvince" class="text-info">: Select Province
                                    before proceed</span> </label>
                            <select name="" id="" class="form-select" v-model="select.region_code">
                                <option :value="data.code" :selected="data.name" v-for="(data, index) in sortProvince"
                                    :key="index">
                                    {{ data.name }}
                                </option>
                            </select>

                        </div>
                        <div class="col form-input select">
                            <label for="">Municipality</label>
                            <select name="" id="" class="form-select" :disabled="isMunicipality"
                                v-model="select.municipality_code">
                                <option :value="data.code" :selected="data.name"
                                    v-for="(data, index) in sortMunicipalities" :key="index">
                                    {{ data.name }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input select">
                            <label for="">Baranggay</label>
                            <select name="" id="" class="form-select" :disabled="isBaranggay"
                                v-model="select.baranggay">
                                <option :value="data.code" :selected="data.name" v-for="(data, index) in sortBarangay"
                                    :key="index">
                                    {{ data.name }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">First Name <span class="text-danger" v-if="inputValidations.first_name">{{
                                    inputValidations.first_name[0] }}</span>
                                </label>
                                    
                            <input type="text" placeholder="Ex: John" v-model="inputs.first_name">

                        </div>
                        <div class="col form-input">
                            <label for="">Last Name <span class="text-danger" v-if="inputValidations.last_name">{{
                                    inputValidations.last_name[0] }}</span></label>
                            <input type="text" placeholder="Ex: Doe" v-model="inputs.last_name">

                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Mobile No <span class="text-danger" v-if="inputValidations.mobile_no">{{
                                    inputValidations.mobile_no[0] }}</span></label>
                            <input type="number" placeholder="Ex: +63123456789" v-model="inputs.mobile_no">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Floor Unit <span class="text-danger" v-if="inputValidations.floor_unit_no">{{
                                    inputValidations.floor_unit_no[0] }}</span></label>
                            <input type="text" placeholder="Ex: Blk 1 lot 1 Phase 1" v-model="inputs.floor_unit_no">
                        </div>
                    </div>
                   
                    <div class="warning-change-message">
                        <small>
                            If you change your name, you can't change it again for 60 days. Don't add any unusual
                            capitalization, punctuation, characters or random words. <a href="">Learn More</a>
                        </small>
                    </div>
                    <div class="submit-btn">
                        <button class="btn" @click="submit">Add</button>
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

fieldset option {
    font-size: 10px;
    height: 10px;
}

fieldset select:focus {
    box-shadow: none;
}

#form-modal {
    overflow: scroll;
}

@media screen and (min-width: 365px) {
    #form-modal {
        position: fixed;
        top: 0;
        height: 100%;
        width: 100%;
        z-index: 999;
        display: grid;
        justify-content: center;
        align-items: center;
        background: rgb(255, 255, 255, 0.5);
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