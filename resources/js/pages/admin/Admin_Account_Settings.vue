<script setup>
import Header from "@/components/Admin_Header.vue"
import Sidebar from "@/components/Admin_Sidebar.vue"
</script>

<template>
    <div id="account-settings">
        <div class="header">
            <Header />
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar />
            </div>
            <div id="settings" class="m-2">
                <div class="content-one">
                    <div class="content-one-title">
                        <b>Name</b>
                        <small>Changes will update all urls</small>
                    </div>
                    <div class="content-one-main">
                        <input type="text" placeholder="Kiel Bermudez">
                    </div>
                </div>
                <div class="content-two">
                    <div class="content-two-title">
                        <b>Default Branch</b>
                        <small>Changes will update all urls</small>
                    </div>
                    <div class="content-two-main">
                        <input type="text" placeholder="Kiel Bermudez">
                    </div>
                </div>
                <div class="content-three">
                    <div class="content-three-title">
                        <b>Default Branch</b>
                        <small>Changes will update all urls</small>
                    </div>
                    <div class="content-three-main">
                        <textarea name="" rows="5" id=""></textarea>
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
