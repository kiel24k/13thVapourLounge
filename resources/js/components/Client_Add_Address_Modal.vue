<script setup>
import { Button, FloatLabel, InputNumber, InputText, Select } from 'primevue';
import { computed, onMounted, ref, watch } from 'vue';

import Swal from 'sweetalert2'







const inputs = ref({})
const inputsValidation = ref({})

const select_island_groups = ref()
const select_regions = ref({})
const select_provinces = ref()
const selected_municipality = ref()
const selected_barangays = ref()

const islandGroups = ref([])
const regions = ref({})
const provinces = ref({})
const municipality = ref({})
const barangay = ref({})

const emit = defineEmits(['closeModal'])
const closeModal = () => {
emit('closeModal')
}





const ISLAND_GROUPS = async () => {
    const response = await axios.get('https://psgc.gitlab.io/api/island-groups/')
    islandGroups.value = response.data
}

watch(select_island_groups, async (oldVal, newVal) => {
    const response = await axios.get(`https://psgc.gitlab.io/api/island-groups/${select_island_groups.value.code}/regions/`)
    regions.value = response.data


}
)

watch(select_regions, async (oldVal, newVal) => {
    const region_code = regions.value.find((el) => el.name === select_regions.value.name)
    const response = await axios.get(`https://psgc.gitlab.io/api/regions/${region_code.code}/provinces/`)
    provinces.value = response.data
})

watch(select_provinces, async (oldVal, newVal) => {
    const province_code = provinces.value.find((el) => el.name === select_provinces.value.name)
    const response = await axios.get(`https://psgc.gitlab.io/api/provinces/${province_code.code}/municipalities/`)
    municipality.value = response.data
})

watch(selected_municipality, async (oldVal, newVal) => {
    const barangay_code = municipality.value.find((el) => el.name === selected_municipality.value.name)
    const response = await axios.get(`https://psgc.gitlab.io/api/municipalities/${barangay_code.code}/barangays/`)
    barangay.value = response.data
})

const submit = async () => {
    try {
        const response = await axios.post('api/add-new-address',
            {
                mobile_no: inputs.value.mobile_no,
                floor_unit_no: inputs.value.floor_unit_no,
                island: select_island_groups.value.name,
                regions: select_regions.value.name,
                province: select_provinces.value.name,
                municipality: selected_municipality.value.name,
                barangay: selected_barangays.value.name
            })
      

        if (response.status === 200) {
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: false,
                timer: 1500
            });
            emit('closeModal')
            
        }

    } catch (error) {
        if (error.status === 422) {
            inputsValidation.value = error.response.data.errors
        }
    }
}

onMounted(() => {
    ISLAND_GROUPS()
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
                <form @submit.prevent>
                    <div class="address" ref="test">
                        <div class="row">
                            <div class="col">
                                <b>Country / Region *</b>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <FloatLabel variant="on">
                                    <InputNumber id="on_label" size="small" :invalid="inputsValidation.mobile_no"
                                        v-model="inputs.mobile_no" autocomplete="off" fluid :useGrouping="false" />
                                    <label for="on_label">Mobile No.</label>
                                </FloatLabel>
                                <span class="text-danger" v-if="inputsValidation.mobile_no">{{
                                    inputsValidation.mobile_no[0] }}</span>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col">
                                <FloatLabel variant="on">
                                    <InputText id="on_label" size="small" :invalid="inputsValidation.floor_unit_no"
                                        v-model="inputs.floor_unit_no" autocomplete="off" fluid :useGrouping="false" />
                                    <label for="on_label">Floor Unit No.</label>
                                </FloatLabel>
                                <span class="text-danger" v-if="inputsValidation.floor_unit_no">{{
                                    inputsValidation.floor_unit_no[0] }}</span>
                            </div>
                           </div>
                           <div class="row mt-4">
                            <div class="col">
                                <Select v-model="select_island_groups" :options="islandGroups"
                                    :invalid="inputsValidation.island" optionLabel="name" clearable
                                    placeholder="Select Island" fluid/>
                                <span class="text-danger" v-if="inputsValidation.island">{{ inputsValidation.island[0]
                                    }}</span>
                            </div>
                          </div>
                        <div class="row mt-4">
                            <div class="col">
                                <el-alert :closable="false" :title="inputsValidation.regions[0]" type="error"
                                    v-if="inputsValidation.regions" start show-icon />
                                <Select v-model="select_regions" :options="regions" :invalid="inputsValidation.regions"
                                    optionLabel="name" clearable placeholder="Select Region" fluid />
                                <span class="text-danger" v-if="inputsValidation.regions">{{ inputsValidation.regions[0]
                                    }}</span>
                            </div>
                            <div class="col">
                                <Select v-model="select_provinces" :options="provinces"
                                    :invalid="inputsValidation.province" optionLabel="name" clearable
                                    placeholder="Select Province" fluid />
                                <span class="text-danger" v-if="inputsValidation.province">{{
                                    inputsValidation.province[0] }}</span>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col">
                                <Select name="" id="" v-model="selected_municipality" :options="municipality"
                                    :invalid="inputsValidation.municipality" optionLabel="name" clearable
                                    placeholder="Select Municipality" fluid />
                                <span class="text-danger" v-if="inputsValidation.municipality">{{
                                    inputsValidation.municipality[0] }}</span>
                            </div>
                            <div class="col">
                                <el-alert :closable="false" :title="inputsValidation.barangay[0]" type="error"
                                    v-if="inputsValidation.barangay" start show-icon />
                                <Select name="" id="" v-model="selected_barangays" :options="barangay"
                                    :invalid="inputsValidation.barangay" optionLabel="name" clearable
                                    placeholder="Select Barangay" fluid/>
                                <span class="text-danger" v-if="inputsValidation.barangay">{{
                                    inputsValidation.barangay[0] }}</span>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col text-end">
                                <Button @click="submit" label="Submit" severity="info" />
                            </div>
                        </div>
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

fieldset select:focus {
    box-shadow: none;
}

#form-modal {
    overflow: scroll;
}

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
</style>