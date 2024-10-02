<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
</script>

<template>
    <Header />
    <Navbar />
    <NavbarCategory />
    <section class="section-one">
        <span>New arrivals</span>
        <div class="section-one-item">
            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>Flava Oxbar Maze Pro Disposable Vape</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>

            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>

            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
        </div>
    </section>

    <section class="section-two">
        <span>Best Sellers</span>
        <div class="section-one-item">
            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>Flava Oxbar Maze Pro Disposable Vape</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>

            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>

            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱400.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱20.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
            <article>
                <figure>
                    <div class="image-one-content">
                        <img src="/public/image/sample-vape-image.png" width="150" alt="" />
                    </div>
                </figure>
                <summary>
                    <p>10 Simple steps to revolutionise work flows with our project</p>
                    <small>₱401.00 PHP</small>
                </summary>
                <div class="text-start">
                    <button class="btn btn-dark">Add to Cart</button>
                </div>
            </article>
        </div>

    </section>
</template>

<style scoped>
section {
    width: 70%;
    margin: auto;
}



.section-one span,
.section-two span {
    font-size: 40px;
    font-weight: 600;
}

.section-one-item {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;

}

article {
    width: 11rem;
    border-radius: 10px;
    box-shadow: 0px 0px 5px 0px gray;
    padding: 15px;
    margin: 10px;
    height: 23em;
}

article img {
    margin: auto;
}

figure {
    display: flex;
    justify-content: space-between;
}

summary {
    list-style: none;
    height: 9rem;
}

.section-two-item {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;

}
</style>