<script setup>
import Header from "@/components/Admin_Header.vue"
import Sidebar from "@/components/Admin_Sidebar.vue"
import { ref } from "vue";

const showSidebar = ref(true)
const closeSidebar = () => {
    if (showSidebar.value == true) {
        showSidebar.value = false
    } else if (showSidebar.value === false) {
        showSidebar.value = true
    }
}
</script>

<template>
    <div id="account-settings">
        <div class="header">
            <Header @closeSidebar="closeSidebar"/>
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar v-if="showSidebar"/>
            </div>
            <div id="settings" class="m-2">
                <div class="content-one">
                    <div class="content-one-title">
                        <b>Old Password</b>
                        <small>Changes will update all urls</small>
                    </div>
                    <div class="content-one-main">
                        <input type="text" placeholder="Enter Old Password">
                    </div>
                </div>
                <div class="content-two">
                    <div class="content-two-title">
                        <b>New Password</b>
                        <small>Changes will update all urls</small>
                    </div>
                    <div class="content-two-main">
                        <input type="text" placeholder="Enter New Password">
                    </div>
                </div>
                <div class="content-three">
                    <div class="content-three-title">
                        <b>Confirm Password</b>
                        <small>Changes will update all urls</small>
                    </div>
                    <div class="content-three-main">
                        <input type="text" placeholder="Confirm Password"></input>
                    </div>
                </div>
                <div class="content-four">
                    <div class="content-four-title">
                        <button class="btn btn-danger">Change Password</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
#account-settings {
    display: grid;
}

.content {
    display: flex;

}

@media screen and (min-width: 769px) {
    #settings {
        width: 100%;
        display: grid;
        gap: 15px;
        justify-content: center;
        background: white;
        padding:10px;
        box-shadow: 0px 0px 5px 0px gray;
        

    }

    #settings input,
    textarea {
        width: 20rem;
        border: solid 2px rgb(194, 187, 187);
        border-radius: 5px;
        outline: none;
        padding: 10px;
    }

    .content-one {
        display: flex;
        align-items: start;
        gap: 10rem;
    }

    .content-one-title {
        display: grid;
    }

    .content-two {
        display: flex;
        align-items: start;
        gap: 10rem;
    }

    .content-two-title {
        display: grid;
    }

    .content-three {
        display: flex;
        align-items: start;
        gap: 10rem;
    }

    .content-three-title {
        display: grid;
    }

}

@media screen and (max-width: 769px) {
    #settings {
        display: grid;
        gap: 15px;
        justify-content: center;
        max-width: 10rem;
        margin: auto;
    }

    #settings input,
    textarea {
        width: 20rem;
        border: solid 2px rgb(194, 187, 187);
        border-radius: 5px;
        outline: none;
        padding: 10px;
    }

    .content-one {
        display: flex;
        align-items: start;
        gap: 10px;
        flex-wrap: wrap;
    }

    .content-one-title {
        display: grid;
    }

    .content-two {
        display: flex;
        align-items: start;
        gap: 10px;
        flex-wrap: wrap;
    }

    .content-two-title {
        display: grid;
    }

    .content-three {
        display: flex;
        align-items: start;
        gap: 10px;
        flex-wrap: wrap;
    }

    .content-three-title {
        display: grid;
    }

}
</style>
