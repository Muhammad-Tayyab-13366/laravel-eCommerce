<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\CustomerAddress;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

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

        $cartContent = Cart::content();
        $productAlreadyExist = false;
        foreach ($cartContent as $key => $item) {
            if($item->rowId == $request->rowId){
                $productAlreadyExist = true;
            }
        }

        // $itemInfo = Cart::get($request->rowId);
       
        if($productAlreadyExist == false){
            session()->flash('error', "Item not found in cart");
            return response()->json([
                "status" => false,
                "message" => "Item not found in cart"
            ]);
        }
        Cart::remove($request->rowId);
        $status = true;
        $message = "Item deleted successfully";
        session()->flash('success', $message);

        return response()->json([
            "status" => $status,
            "message" => $message
        ]);
    }

    public function checkout(){
        // if cart is empty redirect to cart page
        // if user not login then redirect to login page
        if(Cart::count() == 0){
            return redirect()->route('front.cart');
        }
        if(Auth::check() == false){
            
            if(!session()->has('url.intended')){
                session(['url.intended' => url()->current()]);
            }
            return redirect()->route('account.login');
        } 

        session()->forget('url.intended');
        $data['countries'] = Country::orderBy('name', 'ASC')->get();
        $data['cartContent'] = Cart::content();
        return view('front.checkout', $data);
    }

    public function processCheckout(Request $request){
       
        $validator = Validator::make($request->all(),[
            "first_name" => 'required',
            "last_name" => "required",
            "email" => "required|email",
            "country" => "required",
            "address" => "required",
            "city" => "required",
            "state" => "required",
            "zip" => "required",
            "mobile" => "required"

        ]);

        if($validator->passes()){

            $user_id = Auth::user()->id;
           
            CustomerAddress::updateOrCreate(
                ['user_id' => $user_id],  // conditions to find the user
                [
                    'user_id' =>  $user_id,
                    'first_name' => $request->first_name,
                    'last_name' => $request->last_name,
                    'email' => $request->email,
                    'mobile' => $request->mobile,
                    'country_id' => $request->country,
                    'address' => $request->address,
                    'apartment' => $request->apartment,
                    'city' => $request->city,
                    'state' => $request->state,
                    'zip' => $request->zip,
                    'notes' => $request->order_notes
                    
                ] // new or updated attributes
            );

            if($request->payment_method == 'cod'){

                $shipping = 0;
                $discount = 0;
                $subtotal = Cart::subtotal(2,'.','');
                $grand_total =  $subtotal + $shipping;

                $order = new Order;
                $order->user_id  = $user_id;
                $order->subtotal = $subtotal;
                $order->shipping = $shipping;
                $order->discount = $discount;
                $order->grand_total = $grand_total;

                $order->first_name = $request->first_name;
                $order->last_name =$request->last_name;
                $order->email =  $request->email;
                $order->mobile =$request->mobile;
                $order->country_id =$request->country;
                $order->address = $request->address;
                $order->apartment = $request->apartment;
                $order->city = $request->city;
                $order->state =  $request->state;
                $order->zip = $request->zip;
                $order->notes =  $request->order_notes;
                $order->save();

                foreach (Cart::content() as $key => $item) {
                    $order_items  = new OrderItem;
                    $order_items->product_id = $item->id;
                    $order_items->order_id = $order->id;
                    $order_items->name = $item->name;
                    $order_items->qty = $item->qty;
                    $order_items->price = $item->price;
                    $order_items->total = $item->price * $item->qty;
                    $order_items->save();
                    
                    // update stock product
                    $productData = Product::find($item->id);
                    $current_qty = $productData->qty;
                    $updated_qty = $current_qty - $item->qty;
                    $productData->qty = $updated_qty;
                    $productData->save();
                }
                session()->flash('success', 'Order saved successfully');
                Cart::destroy();

                sendOrderEmail($order->id);
                return response()->json([
                    'status' => true,
                    'message' => 'Order saved successfully',
                    'orderId' =>  $order->id
                ]);

            }else {

            }

           

           // $order->subtotal
        }else {
            return response()->json([
                "status" => false,
                "message" => "Please fix the errors",
                "errors" => $validator->errors()
            ]);
        }
    }

    public function thankyou(Request $request, $id){
        return view('front.thank', ['id' => $id]);
    }
}
