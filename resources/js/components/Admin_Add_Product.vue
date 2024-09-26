<script setup>
import axios from 'axios';
import { ref } from 'vue';

const emit = defineEmits(['closeModal'])
const inputs = ref({})
const categoryInput = ref({})
const categoryValidation = ref('')

const saveCategory = async () => {
    try {
        const response = await axios.post('api/create-category',{
            category_type: categoryInput.value.category_type, 
            category_name: categoryInput.value.category_name
        })
        if(response.status === 200){
            categoryValidation.value = false
            categoryInput.value = ''
        }
        
    } catch (error) {
        if(error.response.status === 422){
            categoryValidation.value = error.response.data.errors
        }
    }

}
const cancelBtn = () => {
    emit('closeModal')
}

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
          <div class="text-center" v-for="(data, index) in categoryValidation" :key="index">
            {{ data[0] }}
          </div>
            <div class="row">
                <div class="col select">
                    <select name="" value="dasdsa" id="">
                        <option value="" disabled selected>Create or select a name of our project</option>
                    </select>
                    <div class="add-category-field">
                        <img src="/public/image/exit_icon.png" width="15" height="15" alt="">
                        <input type="text" placeholder="Category Name" v-model="categoryInput.category_type">
                        <input type="text" placeholder="Category Type" v-model="categoryInput.category_name">
                        <button>
                           <div class="save">
                            <button class="btn btn-success" @click="saveCategory">Save!</button>
                           </div>
                        </button>
                    </div>
                </div>
            </div>
            

            <fieldset>
                <form action="">
                    <div class="row">
                        <div class="col">
                            <label for="">Budget Name</label>
                            <input type="text" placeholder="Standard Aspiring Artist" v-model="inputs">
                        </div>
                        <div class="col">
                            <label for="">Amount</label>
                            <input type="text" placeholder="Standard Aspiring Artist">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <label for="">Description</label>
                            <textarea name="" rows="15" id=""></textarea>
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
.add-category-field input {
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

.add-category-field input {
    width: 30%;
    transition: all linear 1s;

}

.select select,
.add-category-field input:focus {
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
</style>
