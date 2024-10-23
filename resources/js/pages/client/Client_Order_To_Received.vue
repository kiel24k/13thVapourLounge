<script setup>
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
import NavbarOrder from '@/components/Client_Navbar_Order.vue'
</script>


<template>
    <Navbar />
    <NavbarCategory />
    <section>
        <div class="title">
            <h2>My Order</h2>
        </div>
        <div class="row">
            <div class="col p-4">
                <input type="text" class="form-control" placeholder="search by item">
            </div>
        </div>
        <NavbarOrder />
        <article>
            <div class="row p-4">
                <div class="col">
                    <figure>
                        <img src="/public/image/manage-icon.png" alt="">
                        <figcaption>
                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quibusdam itaque cumque provident
                            optio maiores. Sint culpa ad temporibus praesentium debitis odio doloribus nisi aliquid
                            dolorum facere at mollitia, iste earum.
                        </figcaption>
                    </figure>
                </div>
                <div class="col">
                    P190.00
                </div>
                <div class="col">
                    QTY: 1
                </div>
                <hr>
            </div>
        </article>
        <article>
            <div class="row p-4">
                <div class="col">
                    <figure>
                        <img src="/public/image/manage-icon.png" alt="">
                        <figcaption>
                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quibusdam itaque cumque provident
                            optio maiores. Sint culpa ad temporibus praesentium debitis odio doloribus nisi aliquid
                            dolorum facere at mollitia, iste earum.
                        </figcaption>
                    </figure>
                </div>
                <div class="col">
                    P190.00
                </div>
                <div class="col">
                    QTY: 1
                </div>
                <hr>
            </div>
        </article>
    </section>

</template>

<style scoped>
section {
    max-width: 70%;
    margin: auto;
    background: white;
    margin-top: 10px;
}

figure {
    display: flex;
    justify-content: center;
    align-items: center;
    align-content: center;
}

figcaption {
    width: 20rem;
    height: 3rem;
    overflow: hidden;
}
</style>