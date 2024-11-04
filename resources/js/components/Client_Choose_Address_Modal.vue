<script setup>
import { ref } from 'vue';

const emit = defineEmits(['closeModal'])
const modalOpen = ref(true)
const closeModal = () => {
    modalOpen.value = false
    emit('closeModal')
}
</script>

<template>
    <div id="alert">
            <div class="content">
                <b>My address</b>
                <hr>
                <table class="table">

                    <tbody>
                        <tr>
                            <td style="width: 10px;">
                                <input type="radio">
                            </td>
                            <td style="width: 20rem;">
                                <b>Rhona | (+63)9193471522</b>
                                <br>
                                <span>
                                    Block 1 Lot 1, Barangay 101
                                    Barangay 101, Caloocan City, Metro Manila, Metro Manila, 4108
                                </span>
                            </td>
                            <td class="text-end text-primary">
                                <span>Edit</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                                <input type="radio">
                            </td>
                            <td style="width: 20rem;">
                                <b>Rhona | (+63)9193471522</b>
                                <br>
                                <span>
                                    Block 1 Lot 1, Barangay 101
                                    Barangay 101, Caloocan City, Metro Manila, Metro Manila, 4108
                                </span>
                            </td>
                            <td class="text-end text-primary">
                                <span>Edit</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                                <input type="radio">
                            </td>
                            <td style="width: 20rem;">
                                <b>Rhona | (+63)9193471522</b>
                                <br>
                                <span>
                                    Block 1 Lot 1, Barangay 101
                                    Barangay 101, Caloocan City, Metro Manila, Metro Manila, 4108
                                </span>
                            </td>
                            <td class="text-end text-primary">
                                <span>Edit</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                                <input type="radio">
                            </td>
                            <td style="width: 20rem;">
                                <b>Rhona | (+63)9193471522</b>
                                <br>
                                <span>
                                    Block 1 Lot 1, Barangay 101
                                    Barangay 101, Caloocan City, Metro Manila, Metro Manila, 4108
                                </span>
                            </td>
                            <td class="text-end text-primary">
                                <span>Edit</span>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10px;">
                                <input type="radio">
                            </td>
                            <td style="width: 20rem;">
                                <b>Rhona | (+63)9193471522</b>
                                <br>
                                <span>
                                    Block 1 Lot 1, Barangay 101
                                    Barangay 101, Caloocan City, Metro Manila, Metro Manila, 4108
                                </span>
                            </td>
                            <td class="text-end text-primary">
                                <span>Edit</span>
                            </td>
                        </tr>

                    </tbody>
                </table>
                <div class="text-start">
                    <button class="btn btn-light">
                        <img src="/public/image/add-icon.png" width="20" alt="" class="m-2">
                        <span>Add New Address</span>
                    </button>
                </div>
                <div class="text-end mt-5">
                    <button class="btn btn-white" @click="closeModal">Cancel</button>
                    <button class="btn btn-warning text-white">
                        <b>Confirm</b>
                    </button>
                </div>
            </div>
    </div>

</template>
<style scoped>
#alert {
    position: fixed;
    height: 100%;
    width: 100%;
    display: grid;
    justify-content: center;
    align-items: center;
    align-content: center;
    background-color: rgb(146, 147, 146, 0.6);
    z-index: 9999;
}

.content {
    background-color: rgb(255, 255, 255);
    overflow-y: scroll;
    max-height: 50rem;
    padding: 10px;
   
}

td {
    width: 10rem;
}


</style>