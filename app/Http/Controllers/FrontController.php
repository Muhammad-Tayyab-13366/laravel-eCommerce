<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class FrontController extends Controller
{
    //
    public function index(){

        $data = [];
        $data['feature_products'] = Product::where('is_featured', 'Yes')
                                    ->where('status', 1)
                                    ->orderBy('id', 'DESC')
                                    ->with('product_images')
                                    ->take(8)
                                    ->get();
        
        $data['latest_products'] = Product::orderBy('id', 'DESC')
                                    ->where('status', 1)
                                    ->with('product_images')
                                    ->take(8)
                                    ->get();
        return view('front.home', $data);
    }
}
