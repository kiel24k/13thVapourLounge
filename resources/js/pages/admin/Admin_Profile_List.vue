<script setup>
import Header from '@/components/Admin_Header.vue'
import Sidebar from '@/components/Admin_Sidebar.vue'
</script>

<template>
    <div id="section-one">
        <div class="header">
            <Header/>
        </div>
        <div class="content">
            <div class="sidebar">
                <Sidebar/>
            </div>
            <div class="main m-2">
                <div class="row" id="profile">
                    <div class="col">
                        <figure>
                            <img src="/public/image/370076_account_avatar_client_male_person_icon.png" alt="">
                            <figcaption class="profile-figcaption text-dark">
                                <span>KIEL ALARCON BERMUDEZ</span>
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
                </div>
                <section id="info">
                    <article>
                        <h2>Info</h2>
                        <div class="content">
                            <figure class="figure-info">
                                  <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="50" alt="">
                                  <figcaption class="figure-figcaption">
                                    keilbermudez@gmail.com
                                  </figcaption>
                            </figure>
                        </div>
                        <div class="content">
                            <figure class="figure-info">
                                  <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="50" alt="">
                                  <figcaption class="figure-figcaption">
                                    keilbermudez@gmail.com
                                  </figcaption>
                            </figure>
                        </div>
                        <div class="content">
                            <figure class="figure-info">
                                  <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="50" alt="">
                                  <figcaption class="figure-figcaption">
                                    keilbermudez@gmail.com
                                  </figcaption>
                            </figure>
                        </div>
                        <div class="content">
                            <figure class="figure-info">
                                  <img src="/public/image/5296499_fb_facebook_facebook logo_icon.png" width="50" alt="">
                                  <figcaption class="figure-figcaption">
                                    keilbermudez@gmail.com
                                  </figcaption>
                            </figure>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</template>

<style scoped>
#section-one{
    display: grid;
}
.content{
    display: flex;
}
.main{
    width: 100%;
    
}
#profile {
    max-width: 60rem;
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
    max-width: 60rem;
    margin:auto;
    box-shadow: 0px 0px 2px 0px gray;    
    border-radius: 10px;
    padding:10px;
    
}

.figure-info {
    display: flex;
}
.figure-figcaption{
    font-weight: 600;
}

</style>