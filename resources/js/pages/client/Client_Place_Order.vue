<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import Footer from '@/components/Client_Footer.vue'
import { useRoute, useRouter } from 'vue-router'
import { onMounted, ref, watch } from 'vue'
import Cookies from 'js-cookie'
import ChooseAddress from '@/components/Client_Choose_Address_Modal.vue'
import Swal from 'sweetalert2'

const router = useRouter()
const route = useRoute()
const total = ref()
const order = ref()
const chooseAddress = ref(false)
const inputs = ref({})

const select_island_groups = ref()
const select_regions = ref()
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
}



watch(select_island_groups, async (oldVal, newVal) => {
    const response = await axios.get(`https://psgc.gitlab.io/api/island-groups/${select_island_groups.value}/regions/`)
    regions.value = response.data
}
)

watch(select_regions, async (oldVal, newVal) => {
    const region_code = regions.value.find((el) => el.name === select_regions.value)
    const response = await axios.get(`https://psgc.gitlab.io/api/regions/${region_code.code}/provinces/`)
    provinces.value = response.data



})

watch(select_provinces, async (oldVal, newVal) => {
    const province_code = provinces.value.find((el) => el.name === select_provinces.value)
    const response = await axios.get(`https://psgc.gitlab.io/api/provinces/${province_code.code}/municipalities/`)
    municipality.value = response.data
})

watch(selected_municipality, async (oldVal, newVal) => {
    const barangay_code = municipality.value.find((el) => el.name === selected_municipality.value)
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
                island: select_island_groups.value,
                regions: select_regions.value,
                province: select_provinces.value,
                municipality: selected_municipality.value,
                barangay: selected_barangays.value

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
        console.log(error);


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
                    <input type="text" placeholder="First Name" v-model="inputs.first_name">
                </div>
                <div class="col">
                    <input type="text" placeholder="Last Name" v-model="inputs.last_name">
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
                    {{ select_island_groups }}
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <input type="text" placeholder="Mobile No." v-model="inputs.mobile_no">
                </div>
                <div class="col">
                    <input type="text" placeholder="Floor Unit No." v-model="inputs.floor_unit_no">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="">Island</label>
                    <select name="" id="" class="form-select" v-model="select_island_groups">
                        <option value="" selected>Select</option>
                        <option :value="data.code" v-for="(data, index) in islandGroups" :key="index">
                            {{ data.code }}
                        </option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="">Regions</label>
                    <select name="" id="" class="form-select" v-model="select_regions">
                        <option :value="data.name" v-for="(data, index) in regions" :key="index">
                            {{ data.name }}
                        </option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="">Provinces</label>
                    <select name="" id="" class="form-select" v-model="select_provinces">
                        <option :value="data.name" v-for="(data, index) in provinces" :key="index">
                            {{ data.name }}
                        </option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="">Municipalities</label>
                    <select name="" id="" class="form-select" v-model="selected_municipality">
                        <option :value="data.name" v-for="(data, index) in municipality" :key="index">
                            {{ data.name }}
                        </option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="">Barangay</label>
                    <select name="" id="" class="form-select" v-model="selected_barangays">
                        <option :value="data.name" v-for="(data, index) in barangay" :key="index">
                            {{ data.name }}
                        </option>
                    </select>
                </div>
            </div>
        </div>
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
}

.address {
    display: grid;
    gap: 10px;
    box-shadow: 0px 0px 2px gray;
    padding: 10px;
    margin-top: 20px;
    border-radius: 3px;
    background-color: rgb(248, 246, 237);

}

.address input {
    padding: 15px;
    border-radius: 5px;
    border: solid 1px gray;
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

/* Slide In Effect */
</style>