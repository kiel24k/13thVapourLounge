<template>
    <div id="form-modal">
        <div class="form-modal-main">
            <div class="form-modal-action">
                <img src="/public/image/back.png" width="20" alt="">
                <img src="/public/image/exit_icon.png" width="35" alt="">
            </div>
            <div class="form-modal-title">
                <span>New Category</span>
            </div>
            <fieldset>
                <form action="">
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Product Type</label>
                            <input type="text" placeholder="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Product Name</label>
                            <input type="text" placeholder="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col form-input">
                            <label for="">Product Label</label>
                            <input type="text" placeholder="">
                        </div>
                    </div>
                    <div class="warning-change-message">
                        <small>
                            If you change your name, you can't change it again for 60 days. Don't add any unusual
                            capitalization, punctuation, characters or random words. <a href="">Learn More</a>
                        </small>
                    </div>
                    <div class="submit-btn">
                        <button>Review Change</button>
                    </div>
                </form>
            </fieldset>
        </div>
    </div>
</template>

<style scoped>
        @media screen and (min-width: 365px) {
            #form-modal {
                position: fixed;
                height: 100%;
                width: 100%;
                z-index: 999;
                display: grid;
                justify-content: center;
                align-items: center;
                background-color: rgb(199, 199, 199,0.5);
            }

            .form-modal-main {
                max-width: 35rem;
                background: rgb(255, 255, 255);
                border-radius: 10px;
                display: grid;
                padding: 10px;
                margin: 10px;
                box-shadow: 0px 0px 3px 0px gray;
            }

            .form-modal-action {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .form-modal-title span {
                font-weight: 550;
                font-size: 30px;
            }

            fieldset {
                background: rgb(248, 248, 248);
                padding: 15px;
                border-radius: 10px;
                margin: 10px;

            }

            fieldset form {
                display: grid;
                gap: 10px;
            }

            .form-input {
                display: grid;
            }

            fieldset input {
                padding: 10px;
                border: solid 1px rgb(197, 195, 195);
                border-radius: 10px;

            }

            fieldset input:focus {
                outline: 0;
                color: gray;
            }

            .submit-btn button {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 25px;
                background-color: rgb(0, 100, 224);
                font-size: 15px;
                font-weight: bold;
                color: white;
            }
        }

        @media screen and (max-width: 365px) {
            #form-modal {
                position: fixed;
                height: 100%;
                width: 100%;
                z-index: 999;
                display: grid;
                justify-content: center;
                align-items: center;
            }

            .form-modal-main {
                max-width: 35rem;
                background: rgb(255, 255, 255);
                border-radius: 10px;
                display: grid;
                padding: 10px;
                margin: 10px;
                box-shadow: 0px 0px 3px 0px gray;
            }

            .form-modal-action {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .form-modal-title span {
                font-weight: 550;
                font-size: 30px;
            }

            fieldset {
                background: rgb(248, 248, 248);
                padding: 15px;
                border-radius: 10px;
                margin: 10px;

            }

            fieldset form {
                display: grid;
                gap: 10px;
            }

            .form-input {
                display: grid;
            }

            fieldset input {
                padding: 10px;
                border: solid 1px rgb(197, 195, 195);
                border-radius: 10px;
                min-width: 1rem;

            }

            fieldset input:focus {
                outline: 0;
                color: gray;
            }

            .submit-btn button {
                width: 100%;
                padding: 10px;
                border: none;
                border-radius: 25px;
                background-color: rgb(0, 100, 224);
                font-size: 15px;
                font-weight: bold;
                color: white;
            }

        }
    </style>