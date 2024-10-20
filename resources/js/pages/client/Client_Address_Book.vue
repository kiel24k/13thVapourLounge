<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarAccount from '@/components/Client_Navbar_Account.vue'
</script>

<template>
    <Header/>
    <Navbar/>
    <NavbarCategory/>
    <section class="row" id="profile">
        <div class="col">
            <figure>
                <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="">
                <figcaption class="profile-figcaption text-dark">
                    <span>Full name sample</span>
                </figcaption>
            </figure>
        </div>
        <div class="col profile-action">
            <div class="">
                <button class="btn btn-dark">Edit Profile</button>
                <button class="btn btn-dark">Add story</button>
            </div>
        </div>
        <hr>
    </section>

    <nav>
        <NavbarAccount/>
    </nav>

    <section id="info">
        <article>
            <table class="table">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Address</th>
                        <th>Postcode</th>
                        <th>Phone Number</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Kiel Alarcon Bermudez</td>
                        <td>Paradahan 1</td>
                        <td>Cavite</td>
                        <td>09193471522</td>
                        <td>
                            <span class="text-primary">Edit</span>
                        </td>
                    </tr>
                </tbody>
             
            </table>
           <div class="text-end">
            <button class="btn btn-primary">Add new address</button>
           </div>
        </article>
    </section>
</template>

<style scoped>
    #profile {
        max-width: 70%;
        margin: auto;
        display: flex;
        flex-wrap: wrap;
    }

    figure {
        display: flex;
        align-items: center;
        gap: 10px
    }

    .profile-figcaption {
        font-weight: 600;
    }

    .profile-action {
        display: flex;
        justify-content: end;
        align-items: center;
    }

    #info{
        max-width:70%;
        margin: auto;
        padding:10px;
        background: white;
    }

    #info table th{
        background: rgb(236, 235, 235);
        color:gray;
        font-weight: 500;
        font-size: 12px;
    }

    #info table td {
        color:black;
        font-size: 15px;
        background: #ffffff;
    }


    
</style>
