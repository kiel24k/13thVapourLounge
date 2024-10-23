<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClientController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::controller(AuthController::class)->group(function () {
    route::post('/signup', 'signup');
    route::post('/login', 'login');
    route::get('/user', 'user');
    route::get('/logout','logout');
});
Route::controller(AdminController::class)->group(function () {
    route::post('/create-category', 'createCategory');
    route::get('/category-list', 'categoryList');
    route::post('/create-product', 'createProduct');
    route::get('/product-list', 'productList');
    route::get('/delete-product', 'deleteProduct');
    route::get('/display-only-category', 'displayOnlyCategory');
    route::get('/user-list', 'userList');
    route::post('/delete-user','deleteUser');
    route::get('/order-list', 'orderList');
});

Route::controller(ClientController::class)->group(function () {
    route::get('/client-auth', 'clientAuth');
    route::get('/new-arrival-list', 'newArrivalList');
    route::get('/best-seller', 'bestSeller');
    route::get('/all-products', 'allProduct');
    route::get('/client-category-list','categoryList');
    route::get('/check-product', 'checkProduct');
    route::get('/item-on-category', 'itemOnCategory');
    route::get('/products-overview', 'productsOverview');
    route::post('/client-order', 'ClientOrder');
    route::post('/edit-profile', 'editProfile');
    route::post('/add-new-address' , 'addNewAddress');
    route::get('/address-list', 'addressList');
    route::get('/all-order','allOrder');
});
