<script setup   >
import { Button } from 'primevue';


const emit = defineEmits(['closeModalReceipt'])
const closeModal = () => {
emit('closeModalReceipt')
}
</script>   

<template>
    <div id="modal">
        <div class="modal-main">
            <div class="row modal-title">
                <div class="col">
                    <span>
                        <b>Balance Details</b>, Be honest!</span>
                </div>
                <div class="col text-end">
                    <Button icon="pi pi-times" severity="danger" rounded  @click="closeModal"/>
                </div>
            </div>
            <div class="row ">
                <div class="col amount">
                    <span>Amount</span>
                    <div class="amount-action p-4">
                        <div class="balance">
                            <span>$323,232,00</span>
                        </div>
                        <div class="">
                            <button class="btn btn-danger">Cancel</button>
                            <button class="btn btn-primary">Save Changes</button>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="details">
                    <div class="">
                        <span>SUBMITTED BY</span>
                        <p>:Kiel Bermudez</p>
                    </div>
                    <div class="">
                        <span>DATE</span>
                        <p>:Kiel Bermudez</p>
                    </div>
                </div>
                <div class="note">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Neque similique quaerat quod amet ab
                        delectus sit officiis, aliquid velit sint mollitia fuga suscipit, dolorum ea nostrum nihil
                        dolorem molestias id.</p>
                </div>
                <div class="enter-amount">
                    <fieldset>
                        <form action="">
                            <label for="">Enter Amount</label>
                            <input type="text">
                        </form>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</template>
<style scoped>
    #modal {
        width: 100%;
        position: fixed;
        z-index:999;
        height: 100%;
        background: rgb(0, 0, 0,0.5);
        display: grid;
        justify-content: center;
        align-items: center;
    }

    .modal-main {
        max-width: 30rem;
        background: rgb(254, 255, 254);
        padding: 10px;
        border-radius: 15px;
        margin:10px;
    }

    .modal-title {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .amount-action {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        background-color: rgb(231, 184, 243);
        border-radius: 15px;
    }
    .balance span{
        font-weight: 500;
        font-size: 25px;
    }

    .details>div:not(span) {
        width: 60%;
        display: flex;
        justify-content: space-between;

    }

    .details span {
        color: gray;
    }

    .enter-amount form {
        display: grid;
    }

    .enter-amount input {
        padding: 5px;
        border-radius: 10px;
        border: solid 1px rgb(226, 221, 221);
    }

    .enter-amount input:focus {
        outline: rgb(226, 221, 221);;
        color:gray;

    }
</style>