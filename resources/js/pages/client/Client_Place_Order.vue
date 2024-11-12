<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import Footer from '@/components/Client_Footer.vue'
import { useRoute, useRouter } from 'vue-router'
import { onMounted, reactive, ref, watch } from 'vue'
import Cookies from 'js-cookie'
import ChooseAddress from '@/components/Client_Choose_Address_Modal.vue'
import Swal from 'sweetalert2'
import { FloatLabel, InputText, Select } from 'primevue'



const router = useRouter()
const route = useRoute()
const total = ref()
const order = ref()
const chooseAddress = ref(false)
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






const PRODUCTS = () => {
    const paramsId = route.query.item_id.map(Number)
    const cartItems = JSON.parse(localStorage.getItem('cart') || [])
    const getIdOnCart = cartItems.filter((el) => paramsId.includes(el.id))
    order.value = getIdOnCart
    total.value = order.value.reduce((total, val) => total + parseInt(val.price) * val.quantity, 0)
}

const ISLAND_GROUPS = async () => {
    const response = await axios.get('https://psgc.gitlab.io/api/island-groups/')
    islandGroups.value = response.data
    // console.log("Island Groups:", response.data);
}

watch(select_island_groups, async (oldVal, newVal) => {
    const response = await axios.get(`https://psgc.gitlab.io/api/island-groups/${select_island_groups.value.code}/regions/`)
    regions.value = response.data
    
    
}
)

watch(select_regions, async  (oldVal, newVal) => {
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




const chooseAddressModal = () => {
    chooseAddress.value = true
}
const closeModal = () => {
    chooseAddress.value = false
}

const removeOrderCart = () => {
    const paramsId = route.query.item_id.map(Number)
    const cartItems = JSON.parse(localStorage.getItem('cart') || [])
    const updateCart = cartItems.filter((el) => !paramsId.includes(el.id))
    return localStorage.setItem('cart', JSON.stringify(updateCart))
}

const submit = async () => {
    try {
        const response = await axios.post('api/client-order',
            {
                order: order.value,
                first_name: inputs.value.first_name,
                last_name: inputs.value.last_name,
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
            removeOrderCart()
            router.push('/cart')
        }

    } catch (error) {
        if (error.status === 422) {
            inputsValidation.value = error.response.data.errors
        }
    }
}
onMounted(() => {
    PRODUCTS()
    ISLAND_GROUPS()
})



</script>

<template>
    <transition name="fade">
        <ChooseAddress v-if="chooseAddress" @closeModal="closeModal" class="chooseAddress" />
    </transition>
    <Header />
    <Navbar />
    <NavbarCategory />
    

    <section class="section-one">
        <form @submit.prevent>
            <div class="address" ref="test">
                <div class="row">
                    <div class="col">
                        Already Address? <small class="text-primary" @click="chooseAddressModal">Choose Address</small>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <b>Full Name *</b>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" size="small" :invalid="inputsValidation.first_name" v-model="inputs.first_name" autocomplete="off" fluid />
                            <label for="on_label">First Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="inputsValidation.first_name">{{ inputsValidation.first_name[0] }}</span>
                    </div>
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" size="small" :invalid="inputsValidation.last_name" v-model="inputs.last_name" autocomplete="off" fluid />
                            <label for="on_label">First Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="inputsValidation.last_name">{{ inputsValidation.last_name[0] }}</span>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col">
                        <b>Country / Region *</b>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <b>Philippines</b>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" size="small" :invalid="inputsValidation.mobile_no" v-model="inputs.mobile_no" autocomplete="off" fluid />
                            <label for="on_label">Mobile No.</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="inputsValidation.mobile_no">{{ inputsValidation.mobile_no[0] }}</span>
                    </div>
                    <div class="col">
                        <FloatLabel variant="on">
                            <InputText id="on_label" size="small" :invalid="inputsValidation.floor_unit_no" v-model="inputs.floor_unit_no" autocomplete="off" fluid />
                            <label for="on_label">First Name</label>
                        </FloatLabel>
                        <span class="text-danger" v-if="inputsValidation.floor_unit_no">{{ inputsValidation.floor_unit_no[0] }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <!-- <el-alert :closable="false"  :title="inputsValidation.island[0]" type="error"  v-if="inputsValidation.island" start show-icon/>
                        <label for="" v-elses>Island</label> -->
                        <Select v-model="select_island_groups" :options="islandGroups" :invalid="inputsValidation.island" optionLabel="name" clearable placeholder="Select Island" />
                        <span class="text-danger" v-if="inputsValidation.island">{{ inputsValidation.island[0] }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <el-alert :closable="false"  :title="inputsValidation.regions[0]" type="error"  v-if="inputsValidation.regions" start show-icon/>
                        <Select v-model="select_regions" :options="regions" :invalid="inputsValidation.regions" optionLabel="name" clearable placeholder="Select Region" />
                        <span class="text-danger" v-if="inputsValidation.regions">{{ inputsValidation.regions[0] }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <!-- <el-alert :closable="false"  :title="inputsValidation.province[0]" type="error"  v-if="inputsValidation.province" start show-icon/>
                        <label for="" v-else>Provinces</label> -->
                        <Select v-model="select_provinces" :options="provinces" :invalid="inputsValidation.province" optionLabel="name" clearable placeholder="Select Province" />
                        <span class="text-danger" v-if="inputsValidation.province">{{ inputsValidation.province[0] }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <Select name="" id=""  v-model="selected_municipality" :options="municipality" :invalid="inputsValidation.municipality" optionLabel="name" clearable placeholder="Select Municipality"/>
                        <span class="text-danger" v-if="inputsValidation.municipality">{{ inputsValidation.municipality[0] }}</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <el-alert :closable="false"  :title="inputsValidation.barangay[0]" type="error"  v-if="inputsValidation.barangay" start show-icon/>
                        <Select name="" id=""  v-model="selected_barangays" :options="barangay" :invalid="barangay" optionLabel="name" clearable placeholder="Select Barangay"/>
                        <span class="text-danger" v-if="inputsValidation.barangay">{{ inputsValidation.barangay[0] }}</span>
                    </div>
                </div>
            </div>
        </form>
        <div class="your-order">
            <div class="row">
                <div class="col">
                    <b>Your Order</b>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>PRODUCT</th>
                                <th>Qty</th>
                                <th>TOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(data, index) in order" :key="index">
                                <td>{{ data.product_label }}</td>
                                <td> <small>x{{ data.quantity }}</small></td>
                                <td><b>P{{ data.price * data.quantity }}</b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
            <div class="row">
                <div class="col">
                    <span>Shipping</span>
                </div>
                <div class="col text-end">
                    <b>P500</b>
                </div>
                <hr>

            </div>
            <div class="row">
                <div class="col">
                    <span>Total</span>
                </div>
                <div class="col text-end">
                    <b>P{{ total + 500 }}</b>
                </div>
                <hr>
            </div>
            <div class="row">
                <div class="col text-end">
                    <button class="btn btn-dark" @click="submit">PLACE ORDER</button>
                </div>
            </div>

        </div>



    </section>
    <Footer />

</template>
<style scoped>
section {
    width: 70%;
    margin: auto;
}

.section-one {
    display: flex;
    gap: 10px;
    justify-content: center;
    flex-wrap: wrap;
}

.address {
    display: grid;
    gap: 10px;
    box-shadow: 0px 0px 2px gray;
    padding: 10px;
    margin-top: 20px;
    border-radius: 3px;
    background-color: rgb(255, 255, 255);
    width: 50rem;

}

input {
    padding: 15px;
    border-radius: 5px;
    border: solid 1px rgb(5, 5, 5);
}

.address select {
    padding: 15px;
    border: solid 1px gray;
}

.your-order {
    display: grid;
    gap: 10px;
    border: solid 1px black;
    padding: 10px;
    margin-top: 20px;
    border-radius: 3px;
    background-color: rgb(255, 255, 255);
    align-items: center;
    align-content: center;
    height: max-content
}

.chooseAddress {
    transition: all linear 2s;
}

/* Fade Transition */
.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.2s;
}

.fade-enter,
.fade-leave-to {
    opacity: 0;

}

.col {
    display: grid;
}

/* Slide In Effect */
</style>