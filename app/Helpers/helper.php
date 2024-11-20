<?php

use App\Mail\OrderEmail;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

function getCategories(){
    return Category::orderBy('name', 'ASC')
    ->with('sub_categories')
    ->where('show_on_home_page', 'Yes')
    ->where('status', 1)
    ->get();
}

function getBrands(){
    return  Brand::orderBy('name', 'ASC')
    ->where('status',1)
    ->get();
}

function getProductImage($id){
    return ProductImage::where('product_id', $id)->first();
}

function getProductSlug($id){
    return Product::where('id', $id)->first();
}

function sendOrderEmail($orderId, $user='customer'){
    $order = Order::where('id', $orderId)->with('order_items')->first();
    $subject = 'Thanks for your order';
    if( $user == 'admin'){
        $subject = 'You have received order';
    }
    $mailData = [
        "subject" => $subject,
        "order" => $order,
        'user' => $user
    ];
    $user_email = $order->email;
    if($user == 'admin'){
        $user_email = Auth::user()->email;
    }
    Mail::to($user_email)->send(new OrderEmail($mailData));
}

?>