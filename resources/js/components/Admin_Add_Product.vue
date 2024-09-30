<script setup>
import axios from 'axios';
import { onMounted, ref } from 'vue';


const emit = defineEmits(['closeModal'])
const categoryList = ref({})
const input = ref({
    file: ''
})
const productValidation = ref({})
const fileName = ref('')
const imageUrl = ref('')
const image = (event) => {
    const selectedFile = event.target.files[0]
    if (selectedFile) {
        input.value.file = selectedFile
        fileName.value = selectedFile.name
        imageUrl.value = URL.createObjectURL(selectedFile)
    }
}


const cancelBtn = () => {
    emit('closeModal')
}
const category = async () => {
    try {
        const response = await axios.get('api/category-list')
        categoryList.value = response.data
    } catch (error) {
    }
}

const saveBtn = async () => {
    try {
        const response = await axios.post('api/create-product', {
            product_name: input.value.category,
            product_label: input.value.label,
            product_price: input.value.price,
            quantity: input.value.quantity,
            description: input.value.description,
            image: input.value.file,
        }, {
            headers: {
                'content-type': 'multipart/form-data'
            }
        })
        console.log(response);
        if (response.status === 200) {
            emit('closeModal')
        }
    } catch (error) {
        console.log(error);

        if (error.response.status === 422) {
            productValidation.value = error.response.data.errors
        }

    }
}
onMounted(() => {
    category()
})

</script>
<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="row">
                <div class="col modal-title">
                    <span>Detailed Course Pricing Breakdown</span>
                    <small>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque incidunt soluta doloribus
                        aliquam quae, maiores quam autem veritatis! Laboriosam, placeat quam reprehenderit cumque
                        eligendi incidunt repellat nisi magnam atque modi.</small>
                </div>
                <div class="col text-end help-action">
                    <button class="help-btn">
                        <img src="/public/image/help-icon.png" width="25" alt="">
                        <small>Help!</small>
                    </button>
                    <button>
                        <img src="/public/image/view-eye.png" width="25" alt="">
                        <small>Preview</small>
                    </button>
                </div>
            </div>
            <hr>
            <fieldset>
                <form  enctype="multipart/form-data">
                    <div class="row">
                        <div class="col">
                            <label for="">Product Type</label>
                            <select name="" id="" v-model="input.category">
                                <option :value="data.product_name" v-for="(data, index) in categoryList" :key="index">
                                    {{ data.product_type }} / {{ data.product_name }}
                                </option>
                            </select>
                            <span v-if="productValidation.product_name">{{ productValidation.product_name[0] }}</span>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <label for="">Product Label</label>
                            <input type="text" v-model="input.label">
                            <span v-if="productValidation.product_label">{{ productValidation.product_label[0] }}</span>
                        </div>
                        <div class="col">
                            <label for="">Product Price</label>
                            <input type="number" v-model="input.price">
                            <span v-if="productValidation.product_price">{{ productValidation.product_price[0] }}</span>
                        </div>
                        <div class="col">
                            <label for="">Quantity</label>
                            <input type="number" placeholder="x1" v-model="input.quantity">
                            <span v-if="productValidation.quantity">{{ productValidation.quantity[0] }}</span>
                        </div>
                    </div>

                    <div class="row field-img">
                        <img :src="imageUrl" width="10" alt="">
                        <input type="file" @change="image">
                    </div>
                    <div class="row">
                        <label for="">Description</label>
                        <textarea name="" rows="10" id="" v-model="input.description"></textarea>
                        <span v-if="productValidation.description">{{ productValidation.description[0] }}</span>
                    </div>
                </form>
            </fieldset>
            <div class="row">
                <div class="col text-end form-action-save">
                    <button class="btn " @click="cancelBtn">Cancel</button>
                    <button class="btn " @click="saveBtn">Save</button>
                </div>
            </div>

        </div>

    </div>
</template>
<style scoped>
#form-modal {
    position: fixed;
    width: 100%;
    height: 100%;
    z-index: 999;
    background: rgb(240, 235, 235, 0.5);
    backdrop-filter: blur(5px);
    display: grid;
    justify-content: center;
    align-items: center;
    overflow: scroll;
}

.form-modal-main {
    max-width: 70rem;
    box-shadow: 0px 0px 5px 0px gray;
    padding: 20px;
    border-radius: 10px;
    background: rgb(255, 255, 255);
    margin: 10px;
    height: auto;
    z-index: 999;
}

.modal-title {
    display: grid;
}

.modal-title span {
    font-size: 25px;
    font-weight: bolder;
}

.select {
    display: flex;
    gap: 5px;
}

.select select,
.add-category-field input,
fieldset select {
    width: 100%;
    border-radius: 5px;
    border: solid 1px rgb(214, 214, 214);
    padding: 5px;
    transition: all linear 1s;
}

.add-category-field {
    display: flex;
    gap: 5px;
    align-items: center;


}



.select select:focus {
    outline: 0;
    padding: 5px;
}

.select button {
    border: 0;
    background: none;
    color: rgb(90, 182, 235);
    border-radius: 5px;
    display: flex;

}

fieldset {
    box-shadow: 0px 0px 2px 0px gray;
    padding: 10px;
    margin-top: 10px;
    border-radius: 10px;
}

fieldset .col {
    display: grid;

}

fieldset label {
    color: gray;
}

fieldset input,
textarea {
    border: 1px solid rgb(182, 178, 178);
    padding: 5px;
    border-radius: 5px;
}

fieldset input,
textarea:focus {
    outline: 0;
    color: rgb(83, 82, 82);
}

fieldset span {
    color: red;
}

.help-action button {
    border: 1px solid rgb(197, 195, 195);
    border-radius: 5px;
    background: 0;
}

.form-action-save button {
    border: 0;
    margin-top: 20px;
    font-size: 15px;
    font-weight: 600;

}

.form-action-save button:nth-child(1) {
    background: white;
    color: red;
}

.form-action-save button:nth-child(2) {
    background: rgb(90, 182, 235);
    color: white;
}

.field-img img {
    width: 100px;
}
</style>
