<script setup lang="ts">
import { Button, FileUpload, FloatLabel, InputText, Select, Textarea } from 'primevue';
import Swal from 'sweetalert2';
import { ref } from "vue";

const input = ref({})

//API VARIABLES
const aboutUsData = ref({})
//COMPONENTS VARIABLES
const emits = defineEmits(['closeAdminCmsAboutUs'])
const isUpdate = ref(false)


//API FUNCTIONS
const GET_ABOUT_US_API = async () => {
    await axios({
        method: 'GET',
        url: 'api/get-about-us'
    }).then(response => {
        aboutUsData.value = response.data
    })

}

//COMPONENT FUNCTION
const closeModal = () => {
    emits('closeAdminCmsAboutUs')
}

const submit = async () => {
    await axios({
        method: 'POST',
        url: 'api/submit-about-us',
        data: {
            caption: input.value.caption,
            details: input.value.details,
            status: input.value.status
        }
    }).then(response => {
        if (response.status === 200) {
            Swal.fire("Content added!");
            GET_ABOUT_US_API()
            input.value = {
                caption: '',
                details: '',
                status: ''
            }
        }
    })

}

const discard = () => {
    input.value = {
        id: '',
        caption: '',
        details: '',
        status: ''
    }
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
                status: data.status
            }
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
            url: 'api/delete-about-us',
            params: {
                id: id
            }
        }).then(response => {
            if (response.status === 200) {
                GET_ABOUT_US_API()
            }

        })
        } f



    });
}

const updateForm = () => {
    console.log(input.value.caption);

    axios({
        method: 'POST',
        url: 'api/update-about-us',
        data: {
            id: input.value.id,
            caption: input.value.caption,
            details: input.value.details,
            status: input.value.status
        }
    }).then(response => {
        console.log(response);
        if (response.status === 200) {
            GET_ABOUT_US_API()
        }

    })
}



//HOOKD
GET_ABOUT_US_API()

</script>

<template>
    <div id="modal">
        <div class="main">
            <section>
                <form action="" class="">
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
                                    <tr v-for="data in aboutUsData">
                                        <td>{{ data.caption }}</td>
                                        <td>
                                            <span class="table_status" :style="data.status === 'published' ? 'background: skyblue' : 'background-color:red;'">{{ data.status }}</span>
                                        </td>
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
.table_status{
    padding:5px;
    font-weight: bold;
    color: aliceblue;
    border-radius: 50px;
}
</style>