<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarAccount from '@/components/Client_Navbar_Account.vue'
import { onMounted, ref } from 'vue';
import { Button } from 'primevue';

const user = ref(Object)
const USER_API = async () => {
    try {
        const response = await axios.get('/api/user')
        user.value = response.data
    } catch (error) {

    }
}

onMounted (() => {
    USER_API()
})
</script>

<template>
    <Navbar/>
    <NavbarCategory/>
    <section class="row" id="profile">
        <div class="col">
            <figure>
                <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="">
                <figcaption class="profile-figcaption text-dark">
                    <span>{{ user.first_name }} {{ user.last_name }}</span>
                    <br>
                    <small>{{ user.email }}</small>
                </figcaption>
            </figure>
        </div>
        <div class="col profile-action">
            <div class="">
               <Button label="Change Image" severity="contrast" icon="pi pi-pen-to-square" raised/>
            </div>
        </div>
        <hr>
    </section>

    <nav>
        <NavbarAccount/>
    </nav>

    <section id="info">
        <article>
            <h2>Info</h2>
            <div class="content">
                <figure class="figure-info">
                      <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="50" alt="">
                      <figcaption class="figure-figcaption">
                        emailsample@gmail.com
                      </figcaption>
                </figure>
            </div>
            <div class="content">
                <figure class="figure-info">
                      <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="50" alt="">
                      <figcaption class="figure-figcaption">
                        emailsample@gmail.com
                      </figcaption>
                </figure>
            </div>
            <div class="content">
                <figure class="figure-info">
                      <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="50" alt="">
                      <figcaption class="figure-figcaption">
                        emailsample@gmail.com
                      </figcaption>
                </figure>
            </div>
            <div class="content">
                <figure class="figure-info">
                      <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="50" alt="">
                      <figcaption class="figure-figcaption">
                        emailsample@gmail.com
                      </figcaption>
                </figure>
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
        background: white;
        box-shadow: var(--floating-box-shadow);
        border-radius: var(--floating-border-radius);
        margin-top: 10px;
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
        max-width: 70%;
        margin:auto;
        padding:10px;
        background: white;
        box-shadow: var(--floating-box-shadow);
        border-radius: var(--floating-border-radius);
        
    }

    .figure-info {
        display: flex;
    }
    .figure-figcaption{
        font-weight: 600;
    }
</style>
