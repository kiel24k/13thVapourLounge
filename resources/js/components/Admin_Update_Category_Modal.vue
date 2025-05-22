<script setup>
import axios from 'axios';
import Swal from 'sweetalert2';
import { onMounted, ref } from 'vue';


const emit = defineEmits(['closeUpdateModal'])
const props = defineProps(['updateModalId'])
const categoryList = ref({})
const input = ref({
    file: ''
})

const categoryData = ref({})

const updatedProductData = ref({})
const categoryValidation = ref({})
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
    emit('closeUpdateModal')
}
const GET_CATEGORY_API = async () => {
 await axios({
    method: 'GET',
    url: 'api/get-category',
    params: {
        id: props.updateModalId
    }
 }).then(response => {
    categoryData.value = response.data
 })
}



const saveBtn = async () => {
  await axios({
    method: 'POST',
    url: 'api/update-category',
    data: {
        id: props.updateModalId,
        category: categoryData.value.category,
        product_type: categoryData.value.product_type,
        description: categoryData.value.description
    }
  }).then(response => {
    if(response.status === 200){
        Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Category Updated",
                showConfirmButton: false,
                timer: 1500
            });
          emit('closeUpdateModal')
    }
    
  }).catch(e => {
    console.log();
    categoryValidation.value = e.response.data.errors

  })
}
onMounted(() => {
    GET_CATEGORY_API()
    
})

</script>
<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="row">
                <div class="col modal-title">
                    <span>Update Category</span>
                    <small>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque incidunt soluta doloribus
                        aliquam quae, maiores quam autem veritatis! Laboriosam, placeat quam reprehenderit cumque
                        eligendi incidunt repellat nisi magnam atque modi.</small>
                </div>
                
            </div>
            <hr>
            <fieldset>
                <form enctype="multipart/form-data">
                    <div class="row mt-2">
                        <div class="col">
                            <label for="">Category</label>
                            <input type="text" v-model="categoryData.category"></input>
                            <span v-if="categoryValidation.category">{{ categoryValidation.category[0] }}</span>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <label for="">Product type</label>
                            <input type="text" v-model="categoryData.product_type"></input>
                            <span v-if="categoryValidation.product_type">{{ categoryValidation.product_type[0] }}</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Description</label>
                            <textarea name="" rows="10" id="" v-model="categoryData.description"></textarea>
                            <span v-if="categoryValidation.description">{{ categoryValidation.description[0] }}</span>
                        </div>
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
