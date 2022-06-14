<?php

use App\Http\Controllers\CategoryController;
use Illuminate\Support\Facades\Route;

use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\HomeController;

use App\Http\Controllers\FrontEndController;
use App\Http\Controllers\SubCategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\InventoryController;
use App\Http\Controllers\CustomerRegisterController;
use App\Http\Controllers\CustomerLoginController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CouponController;
use App\Http\Controllers\CheckoutController;
use Faker\Guesser\Name;

Auth::routes();

// front-end
Route::get('/',  [FrontEndController::class, 'welcome'])->name('index');
Route::get('/product/details/{slug}', [FrontEndController::class, 'product_details'])->name('product.details');

Route::post('/getsize', [FrontEndController::class, 'getsize']);

Route::get('/home', [HomeController::class, 'index'])->name('home');

// user
Route::get('/users', [HomeController::class, 'users'])->name('users');
// user delete
Route::get('/delete/user/{user_id}', [HomeController::class, 'delete'])->name('delete.user');

// Category
Route::get('/category', [CategoryController::class, 'index'])->name('category');
Route::post('/category/store', [CategoryController::class, 'store'])->name('category.store');
Route::get('/category/edit/{catagory_id}', [CategoryController::class, 'edit'])->name('category.edit');
Route::post('/category/update', [CategoryController::class, 'update'])->name('category.update');

Route::get('/category/delete/{category_id}', [CategoryController::class, 'delete'])->name('category.delete');

Route::get('/category/restore/{category_id}', [CategoryController::class, 'restore'])->name('category.restore');
Route::get('/category/forced/delete/{category_id}', [CategoryController::class, 'forced_delete'])->name('category.forced.delete');

Route::post('/category/marked/delete', [CategoryController::class, 'mark_delete'])->name('category.marked');
// subcategory
Route::get('/subcategory', [SubCategoryController::class, 'index'])->name('subcategory');




Route::post('/subcategory/store', [SubCategoryController::class, 'store'])->name('subcategory.store');

Route::get('/subcategory/edit/{subcategory_id}', [SubCategoryController::class, 'edit'])->name('subcategory.edit');
Route::post('/subcategory/update', [SubCategoryController::class, 'update'])->name('subcategory.update');


Route::get('/subcategory/forced/delete/{subcatagory_id}', [SubCategoryController::class, 'delete'])->name('subcategory.forced.delete');

// productXZ

Route::get('/add.product', [ProductController::class, 'add_product'])->name('add.product');

Route::post('/getsubcategory', [ProductController::class, 'getsubcategory']);
Route::post('/product/store', [ProductController::class, 'store'])->name('product.store');

Route::get('/product/view', [ProductController::class, 'view'])->name('product.view');


Route::get('/product/delete/{product_id}', [ProductController::class, 'delete'])->name('product.delete');
Route::get('/product/edit/{product_id}', [ProductController::class, 'edit'])->name('product.edit');
Route::post('/product/update', [ProductController::class, 'update'])->name('product.update');

Route::get('/product/inventory/{product_id}', [InventoryController::class, 'inventory'])->name('inventory');

Route::get('/product/variation', [InventoryController::class, 'variation'])->name('variation');
Route::post('/add/color', [InventoryController::class, 'addcolor'])->name('add.color');
Route::post('/add/size', [InventoryController::class, 'addsize'])->name('add.size');
Route::post('/add/inventory', [InventoryController::class, 'addinventory'])->name('add.inventory');

///customer
Route::get('/customer/register/login', [CustomerRegisterController::class, 'register_login'])->name('customer.register.login');
Route::post('/customer/register/store', [CustomerRegisterController::class, 'register_store'])->name('customer.register.store');
Route::post('/customer/login', [CustomerLoginController::class, 'customer_login'])->name('customer.login');
Route::get('/customer/logout', [CustomerController::class, 'customer_logout'])->name('customer.logout');


// cart
Route::post('/cart/store', [CartController::class, 'cart_store'])->name('cart.store');
Route::get('/cart/remove/{cart_id}', [CartController::class, 'cart_remove'])->name('cart.remove');
Route::get('/cart', [CartController::class, 'cart'])->name('cart');
Route::post('/cart/update', [CartController::class, 'cart_update'])->name('cart.update');


// coupon
Route::get('/add/coupon', [CouponController::class, 'add_coupon'])->name('add.coupon');
Route::post('/coupon/store', [CouponController::class, 'coupon_store'])->name('coupon.store');



//checkout

Route::get('/checkout', [CheckoutController::class, 'checkout'])->name('checkout');
Route::post('/getCity', [CheckoutController::class, 'getCity']);
Route::post('/order/store', [CheckoutController::class, 'order_store'])->name('order.store');
