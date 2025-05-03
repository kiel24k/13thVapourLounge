<script setup lang="ts">
import { Button, FileUpload, FloatLabel, InputText } from 'primevue';
import { ref } from "vue";

const src = ref(null);

//COMPONENTS VARIABLES
const emits = defineEmits(['closeAdminCmsAboutUs'])
//COMPONENT FUNCTION
function onFileSelect(event) {
    const file = event.files[0];
    const reader = new FileReader();

    reader.onload = async (e) => {
        src.value = e.target.result;
    };
    reader.readAsDataURL(file);
}

const closeModal = () => {
    emits('closeAdminCmsAboutUs')
}


</script>

<template>
    <div id="modal">
        <div class="main">
            <section>
                <form action="">
                    <div class="row">
                        <div class="col">
                            <h3>Manage About Us Content</h3>
                        </div>
                    </div>
                    <!-- <div class="row">
                        <div class="col">
                            <FloatLabel variant="in">
                                <InputText id="in_label" v-model="value2" variant="filled" fluid />
                                <label for="in_label">Title Name</label>
                            </FloatLabel>
                        </div>
                    </div> -->
                    <div class="row mt-3">
                        <div class="col form_upload">
                            <FileUpload mode="basic" @select="onFileSelect" accept="image/*" auto severity="danger" />
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <img v-if="src" :src="src" alt="Image" width="200" height="150" />
                        </div>
                        <hr>
                    </div>
                    <div class="row">
                        <div class="col form_action">
                            <Button severity="danger" label="Close" @click="closeModal()"/>
                            <Button severity="info" label="Submit"/>
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
form{
    background: white;
    padding:20px;
    border-radius: 10px;
}
.form_upload{
    display: grid;
    justify-content: start;
}
.form_action {
    display: flex;
    gap:10px;
    justify-content: end;
}
</style>