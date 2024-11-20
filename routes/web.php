<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\AdminLoginController;
use App\Http\Controllers\admin\HomeController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\SubCategoryController;
use App\Http\Controllers\admin\BrandController;
use App\Http\Controllers\admin\OrderController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\FrontController;
use App\Http\Controllers\ShopController;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get('/test', function(){
    sendOrderEmail(7);
});
Route::get('/', [FrontController::class, 'index'])->name('front.home');
Route::get('/shop/{categorySlug?}/{subCategorySlug?}', [ShopController::class, 'index'])->name('front.shop');
Route::get('/product/{slug}', [ShopController::class, 'product'])->name('front.product');

//Cart
Route::get('/cart', [CartController::class, 'cart'])->name('front.cart');
Route::post('/add-to-cart', [CartController::class, 'addToCart'])->name('front.addToCart');
Route::post('/update-cart', [CartController::class, 'updateCart'])->name('front.updateCart');
Route::post('/delete-cart-item', [CartController::class, 'deleteCartItem'])->name('front.deleteCartItem'); 
Route::get('/checkout', [CartController::class, 'checkout'])->name('front.checkout');
Route::post('/processCheckout', [CartController::class, 'processCheckout'])->name('front.processCheckout'); 
Route::get('/thanks/{orderId}', [CartController::class, 'thankyou'])->name('front.thanks');

Route::group(['prefix' => 'account'], function(){

    Route::group(['middleware' => 'guest'], function(){
        Route::get('/register', [AuthController::class, 'register'])->name('account.register');
        Route::post('/process-register', [AuthController::class, 'processRegister'])->name('account.processRegister');
        Route::get('/login', [AuthController::class, 'login'])->name('account.login');
        Route::post('/process-login', [AuthController::class, 'processLogin'])->name('account.processLogin');
        

    });

    Route::group(['middleware' => 'auth'], function(){
        Route::get('/profile', [AuthController::class, 'profile'])->name('account.profile');
        Route::get('/logout', [AuthController::class, 'logout'])->name('account.logout');
        Route::get('/orders', [AuthController::class, 'orders'])->name('account.orders');
        Route::get('/order/{orderId}', [AuthController::class, 'orderDetail'])->name('account.orderDetail');
       
    });
});
Route::group(['prefix' => 'admin'], function(){

   // Route::group(['middleware' => 'admin.guest'], function(){
        Route::get('/login', [AdminLoginController::class, 'index'])->name('admin.login');
        Route::post('/authenticate', [AdminLoginController::class, 'authenticate'])->name('admin.authenticate');
   // });

    Route::group(['middleware' => 'admin.auth'], function(){
        Route::get('/dashboard', [HomeController::class, 'index'])->name('admin.dashboard');
        Route::get('/logout', [HomeController::class, 'logout'])->name('admin.logout');

       // Category routes
       Route::get('/categories', [CategoryController::class, 'index'])->name('categories.index');
       Route::get('/categories/create', [CategoryController::class, 'create'])->name('categories.create');
       Route::post('/categories/store', [CategoryController::class, 'store'])->name('categories.store');
       Route::get('/categories/{category}/edit', [CategoryController::class, 'edit'])->name('categories.edit');
       Route::put('/categories/{category}', [CategoryController::class, 'update'])->name('categories.update');
       Route::delete('/categories/{category}/delete', [CategoryController::class, 'destroy'])->name('categories.delete');

       // Sub Category 
       Route::get('/sub-categories', [SubCategoryController::class, 'index'])->name('sub-categories.index');
       Route::get('/sub-categories/create', [SubCategoryController::class, 'create'])->name('sub-categories.create');
       Route::post('/sub-categories/store', [SubCategoryController::class, 'store'])->name('sub-categories.store');
       Route::get('/sub-categories/{sub_category}/edit', [SubCategoryController::class, 'edit'])->name('sub-categories.edit');
       Route::put('/sub-categories/{sub_category}', [SubCategoryController::class, 'update'])->name('sub-categories.update');
       Route::delete('/sub-categories/{sub_category}/delete', [SubCategoryController::class, 'destroy'])->name('sub-categories.delete');
       Route::post('/sub-categories/get-by-category-id', [SubCategoryController::class, 'getByCategoryId'])->name('sub-categories.get-by-category-id');
        
       // Brands
       Route::resource('brands', BrandController::class);

       // Product routes
       Route::get('/products', [ProductController::class, 'index'])->name('products.index');
       Route::get('/products/create', [ProductController::class, 'create'])->name('products.create');
       Route::post('/products/store', [ProductController::class, 'store'])->name('products.store');
       Route::get('/products/{product}/edit', [ProductController::class, 'edit'])->name('products.edit');
       Route::post('/products/{product}', [ProductController::class, 'update'])->name('products.update');
       Route::delete('/products/{product}/delete', [ProductController::class, 'destroy'])->name('products.destroy');
       Route::post('/prducts/image', [ProductController::class, 'product_image_store'])->name('products.images.save');
       Route::post('/prducts/image/delete', [ProductController::class, 'product_image_delete'])->name('products.images.delete');
       Route::get('/get-products', [ProductController::class, 'getProducts'])->name('product.getProducts');

       Route::get('/orders', [OrderController::class, 'index'])->name('admin-order.list');
       Route::get('/order/{orderId}', [OrderController::class, 'detail'])->name('admin-order.detail');
       Route::post('/order/change-status', [OrderController::class, 'changeStatus'])->name('admin-order.changeStatus');

    });

});


Route::get('/getSlug', function(Request $request){
    $slug = '';
    if(!empty($request->title)){
        $slug = Str::slug($request->title);
    }
    return response()->json(["slug" => $slug]);
})->name('getSlug');