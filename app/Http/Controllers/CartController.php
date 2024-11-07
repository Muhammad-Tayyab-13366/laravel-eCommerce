<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
class CartController extends Controller
{
    //
    /*
        Shopping Cart package github link
       https://github.com/hardevine/LaravelShoppingcart
    */
    public function addToCart(Request $request){
        $id = $request->id;
        $status = '';
        $message = '';
        $product = Product::with('product_images')->find($id);
        if($product == null){
                return response()->json([
                    'status' => false,
                    'message' => 'Product Not Found'
                ]);

        }

        if(Cart::count() > 0){
           

            $cartContent = Cart::content();
            $productAlreadyExist = false;
            foreach ($cartContent as $key => $item) {
                if($item->id == $product->id){
                    $productAlreadyExist = true;
                }
            }

            if($productAlreadyExist == false){
                Cart::add($product->id,
                    $product->title,
                    1, 
                    $product->price, 
                    ['productImage' => (!empty($product->product_images)) ?  $product->product_images->first() : '' ]
                );

                $status = true;
                $message = $product->title. ' added in cart';
            }else{
                $status = true;
                $message = $product->title. ' already exist in cart';
            }
        }else
        {
            Cart::add($product->id,
                    $product->title,
                    1, 
                    $product->price, 
                    ['productImage' => (!empty($product->product_images)) ?  $product->product_images->first() : '' ]
                );
            $status = true;
            $message = $product->title. ' added in cart';
        }
       //Cart::add('293ad', 'Product 1', 1, 9.99);

        return response()->json([
            'status' => $status,
            'message' => $message
        ]);

    }

    public function cart(){

        $data['cartContent'] = Cart::content();

        
        return view('front.cart', $data);
    }
}
