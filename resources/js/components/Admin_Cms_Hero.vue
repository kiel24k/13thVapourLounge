<script setup lang="ts">
import { Button, FileUpload, FloatLabel, InputText, Select, Textarea } from 'primevue';
import Swal from 'sweetalert2';
import { ref } from "vue";

const src = ref(null);




//COMPONENTS VARIABLES
const emits = defineEmits(['closeAdminCmsHero'])
const props = defineProps(['heroData'])
const propsData = ref(props.heroData)

//API FUNCTION 
const submit = () => {

    axios({
        method: 'POST',
        url: 'api/update-hero',
        headers: {
            'Content-Type': 'multipart/form-data'
        },
        data: {
            details: propsData.value.details,
            status: propsData.value.status,
            image: propsData.value.image,
            hero_id: propsData.value.id
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
            emits('closeAdminCmsHero')
        }

    })
}

//COMPONENT FUNCTION
function onFileSelect(event) {
    const file = event.files[0];
    const reader = new FileReader();
    propsData.value.image = file
    reader.onload = async (e) => {
        src.value = e.target.result;
    };
    reader.readAsDataURL(file);
}

const closeModal = () => {
    emits('closeAdminCmsHero')
}


</script>

<template>
    <div id="modal">
        <div class="main">
            <section>
                <form action="">
                    <div class="row">
                        <div class="col">
                            <h3>Manage Hero Content</h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <Textarea cols="50" rows="10" placeholder="Details" v-model="propsData.details" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
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
    display: grid;
    justify-content: start;
}

.form_action {
    display: flex;
    gap: 10px;
    justify-content: end;
}
select:focus{
    box-shadow: none;
}
</style>