<script setup lang="ts">
import { Button, FileUpload, FloatLabel, Image, InputText, Select, Textarea } from 'primevue';
import Swal from 'sweetalert2';
import { onMounted, ref } from "vue";

const input = ref({})

//API VARIABLES
const serviceData = ref({})
//COMPONENTS VARIABLES
const emits = defineEmits(['closeAdminCmsService'])
const isUpdate = ref(false)
const src = ref(null);
const imageFile = ref()



//API FUNCTIONS
const GET_SERVICE_API = async () => {
    await axios({
        method: 'GET',
        url: 'api/get-service'
    }).then(response => {
        serviceData.value = response.data
    })

}

//COMPONENT FUNCTION



function onFileSelect(event) {
    const file = event.files[0];
    input.value.image = file
    const reader = new FileReader();

    reader.onload = async (e) => {
        src.value = e.target.result;
    };

    reader.readAsDataURL(file);
}

const closeModal = () => {
    emits('closeAdminCmsService')
}

const submit = async () => {
    await axios({
        method: 'POST',
        url: 'api/submit-service',
        headers: {
            'Content-Type': 'multipart/form-data'
        },
        data: {
            caption: input.value.caption,
            details: input.value.details,
            status: input.value.status,
            image: input.value.image
        }
    }).then(response => {
        if (response.status === 200) {
            Swal.fire("Content added!");
            GET_SERVICE_API()
            input.value = {
                caption: '',
                details: '',
                status: ''
            }
            src.value = null
        }
    })

}

const discard = () => {
    input.value = {
        id: '',
        caption: '',
        details: '',
        status: '',
        image: ''
    }
    src.value = null
    isUpdate.value = false
}

const updateBtn = (data) => {

    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Proceed"
    }).then((result) => {
        if (result.isConfirmed) {
            isUpdate.value = true
            input.value = {
                id: data.id,
                caption: data.caption,
                details: data.details,
                status: data.status,
                image: data.image
            }
            src.value = null
        }
    });
}

const deleteBtn = (id) => {
    Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!"
    }).then((result) => {
        if (result.isConfirmed) {
            axios({
                method: "DELETE",
                url: 'api/delete-service',
                params: {
                    id: id
                }
            }).then(response => {
                if (response.status === 200) {
                    GET_SERVICE_API()
                }

            })
        }



    });
}

const updateForm = () => {
    axios({
        method: 'POST',
        url: 'api/update-service',
        headers: {
            'Content-Type': 'multipart/form-data'
        },
        data: {
            id: input.value.id,
            caption: input.value.caption,
            details: input.value.details,
            status: input.value.status,
            image: input.value.image
        }
    }).then(response => {
        console.log(response);
        if (response.status === 200) {
          
            input.value = {
                id: '',
                caption: '',
                details: '',
                status: '',
                image: ''
            }
            src.value = null
            Swal.fire("Data Updated!");
            GET_SERVICE_API()
        }

    })
}



//HOOKD
onMounted(() => {
    GET_SERVICE_API()
})

</script>

<template>
    <div id="modal">
        <div class="main">
            <section>
                <form action="" class="">
                    <div class="row">
                        <div class="col">
                            <h3>Manage Service Content</h3>
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

                    <div class="row">
                        <div class="col form_field">
                            <div class="field_info">
                                <label for="" class="form-label">Status: </label>
                                <select class="form-select" v-model="input.status">
                                    <option value="published">published</option>
                                    <option value="unpublished">unpublished</option>
                                </select>
                                <FloatLabel variant="on">
                                    <Textarea id="over_label" v-model="input.caption" rows="2" cols="50" fluid />
                                    <label for="on_label">Caption</label>
                                </FloatLabel>

                            </div>
                            <div class="details mt-3">
                                <FloatLabel variant="on">
                                    <Textarea id="over_label" v-model="input.details" rows="5" cols="50" fluid />
                                    <label for="on_label">Details</label>
                                </FloatLabel>
                            </div>
                            <div class="row">
                                <div class="col file_content">
                                    <FileUpload mode="basic" @select="onFileSelect" customUpload auto
                                        severity="secondary" class="p-button-outlined" />
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <Image v-if="src != null" :src="src" alt="Image" width="150" height="120" preview />
                                    <Image :src="`/image/cms_image/${input.image}`" width="150" height="120" alt=""
                                        v-else-if="input.image" preview/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form_action">
                            <Button label="Discard" severity="secondary" @click="discard()" />
                            <Button label="Submit" severity="success" @click="submit()" v-if="!isUpdate" />
                            <Button @click="updateForm()" label="Update" severity="info" v-if="isUpdate" />
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Caption</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="data in serviceData">
                                        <td>{{ data.caption }}</td>
                                        <span class="table_status" :style="data.status === 'published' ? 'background: skyblue' : 'background-color:red;'">{{ data.status }}</span>
                                        <td class="data_action">
                                            <div class="table_action">
                                                <Button icon="pi pi-pencil" variant="outlined" rounded raised
                                                    severity="info" @click="updateBtn(data)" />
                                                <Button icon="pi pi-trash" variant="outlined" rounded raised
                                                    severity="danger" @click="deleteBtn(data.id)" />
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-end">
                            <Button severity="danger" label="Close" @click="closeModal()" />
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
    overflow-y: scroll;

}

form {
    background: white;
    padding: 20px;
    border-radius: 10px;
    width: 50rem;

}

.form_upload {
    display: grid;
    justify-content: start;
}

.form_field {
    display: grid;
}

.field_info {
    display: grid;
    gap: 10px;
}

select:focus {
    box-shadow: none;
}

.form_action {
    display: flex;
    gap: 10px;
    justify-content: end;
}

.data_action {
    width: 10rem;
    ;
}

.table_action {
    display: flex;
    gap: 10px;
}

.file_content {
    display: flex;
    justify-content: start;
}
.table_status{
    padding:5px;
    font-weight: bold;
    color: aliceblue;
    border-radius: 50px;
}
</style>