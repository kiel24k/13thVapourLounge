<script setup lang="ts">
import { Button, FileUpload, FloatLabel, InputText } from 'primevue';
import Swal from 'sweetalert2';
import { ref } from "vue";

const src = ref(null);
const fileVal = ref()

//API VARIABLES

//COMPONENTS VARIABLES
const emits = defineEmits(['closeAdminCmsTitle'])
const props = defineProps(['titleData'])
const input = ref({})
const propsData = ref(props.titleData)


//COMPONENT FUNCTION
function onFileSelect(event) {
    const file = event.files[0];
    propsData.value.image = file
    const reader = new FileReader();

    reader.onload = async (e) => {
        src.value = e.target.result;


    };
    reader.readAsDataURL(file);
}

//API FUNCTIONS


const submit = () => {
    console.log(propsData.value.status);

    axios({
        method: 'POST',
        url: 'api/update-title',
        headers: {
            'Content-Type': 'multipart/form-data'
        },
        data: {
            caption: propsData.value.caption,
            status: propsData.value.status,
            image: propsData.value.image,
            title_id: propsData.value.id
        }
    }).then(response => {
        if (response.status === 200) {
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "Your work has been saved",
                showConfirmButton: false,
                timer: 1500
            });
            emits('closeAdminCmsTitle')
        }

    })
}
const closeModal = () => {
    emits('closeAdminCmsTitle')
}




</script>

<template>
    <div id="modal">
        <div class="main">
            <section>
                <form action="" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col">
                            <h3>Manage Title Content</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <FloatLabel variant="in">
                                <InputText id="in_label" v-model="propsData.caption" variant="filled" fluid />
                                <label for="in_label">Title Name</label>
                            </FloatLabel>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col ">
                            <select class="form-select" v-model="propsData.status">
                                <option value="published">published</option>
                                <option value="unpublished">unpublished</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col form_upload">
                            <FileUpload mode="basic" @select="onFileSelect" accept="image/*" auto severity="danger" />

                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <img v-if="src" :src="src" alt="Image" width="200" height="150" />
                            <img :src="`storage/cms_image/${propsData.image}`" alt="" width="150"
                                v-else-if="src === null">

                        </div>
                        <hr>
                    </div>
                    <div class="row">
                        <div class="col form_action">
                            <Button severity="danger" label="Close" @click="closeModal()" />
                            <Button severity="info" label="Submit" @click="submit()" />
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</template>
<style scoped>
#modal {
    position: fixed;
    width: 100%;
    height: 100%;
    display: grid;
    justify-content: center;
    align-items: center;
    background: rgb(0, 0, 0, 0.5);
    z-index: 999;

}

form {
    background: white;
    padding: 20px;
    border-radius: 10px;
}

.form_upload {
    display: flex;
    justify-content: start;
}

.form_action {
    display: flex;
    gap: 10px;
    justify-content: end;
}

select:focus {
    box-shadow: none;

}
</style>