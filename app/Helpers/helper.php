<?php

use App\Models\Category;
use App\Models\Brand;
use App\Models\Product;
use App\Models\ProductImage;

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

?>