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
        // dd($data['cartContent'] );
        return view('front.cart', $data);
    }

    public function updateCart(Request $request){
        $rowId = $request->rowId;
        $qty   = $request->qty;

        $status = '';
        $message = '';
        
        $itemInfo = Cart::get($rowId);
        $productId = $itemInfo->id;
        $product = Product::find($productId);
        //dd($product);
        $data = [];
        $data['qty'] = $qty;
        if($product->track_qty == 'Yes'){
            if($product->qty >= $qty  ){
                Cart::update($rowId, $data);
                $status = true;
                $message = 'Cart updated successfully';
                session()->flash('success', $message);

            }else {
                $status = false;
                $message = 'Requested qty ('. $qty.') for '.$product->title.' is not available in stock';
                session()->flash('error', $message);
            }
        }else{

            Cart::update($rowId, $data);
            $status = true;
            $message = 'Cart updated successfully';
            session()->flash('success', $message);
        }
        return response()->json([
            "status" => $status,
            "message" => $message
        ]);
        
    }

    function deleteCartItem(Request $request){

       
        Cart::remove($request->rowId);
        $status = true;
        $message = "Item deleted successfully";
        session()->flash('success', $message);

        return response()->json([
            "status" => $status,
            "message" => $message
        ]);
    }
}
