<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
</script>

<template>
    <Header />
    <Navbar />
    <section class="section-category">
        <nav id="nav-category">
            <ul class="navbar nav">
                <li class="nav-item">
                    <a href="" class="nav-link">Home</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">Pod kits</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">Coil & Cartridge Replacement</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">E-Juice</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">Disposable Vape</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">Accessories</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">Blogs</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">Contact Us</a>
                </li>
            </ul>
        </nav>
    </section>

    <section class="section-one">
        <span>PROMO PRICE</span>
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
            </article>
        </div>
    </section>

    <section class="section-two">
        <span>NEW ARIVAL</span>
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
            </article>
        </div>
        
    </section>
</template>

<style scoped>
section {
    width: 70%;
    margin: auto;
}

.section-category nav a {
    color: black;
    font-size: 15px;
    transition: all linear 0.5s;
}

.section-category nav a:hover {
    text-decoration: underline;
}

.section-one span, .section-two span {
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
    height: 21rem;
}
article img{
    margin:auto;
}

figure {
    display: flex;
    justify-content: space-between;
}

summary {
    list-style: none;
}

.section-two-item {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;

}
</style>