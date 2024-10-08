<script setup>
import Header from '@/components/Client_Header.vue'
import Navbar from '@/components/Client_Navbar.vue'
import NavbarCategory from '@/components/Client_Navbar_Category.vue'
</script>

<template>
    <Header/>
    <Navbar/>
    <NavbarCategory/>
    <section class="section-one">
        <div id="cart">
            <div class="row title">
                <div class="col">
                    <h2>SHOPPING CART</h2>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Image and more</td>
                                <td>P220.00</td>
                                <td>
                                    <button>+</button>
                                    <button>-</button>
                                </td>
                                <td>Subtotal</td>
                            </tr>
                        </tbody>
                    </table>
                    <button class="btn btn-white">CONTINUE SHIPPING</button>
                    <button class="btn btn-dark">UPDATE CART</button>
                </div>
                <div class="col">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>CART TOTALS</th>
                                <th>P</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Subtotal</td>
                                <td>P1,170.00</td>
                            </tr>
                            <tr>
                                <td>Total</td>
                            <td>P1,170.00</td>
                            </tr>
                        </tbody>
                    </table>
                    <button class="btn btn-dark proceed-btn">PROCEED TO CHECKOUT</button>
                </div>
            </div>
        </div>
    </section>
</template>
<style scoped>
section{
    width: 70%;
    margin: auto;
}
    .table th{
        color:rgb(118,118,119);
    }
    .proceed-btn{
        background:rgb(103,103,102);
        border:0;
    }
    
</style>