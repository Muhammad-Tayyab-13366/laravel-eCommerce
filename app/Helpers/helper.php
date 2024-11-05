<?php

use App\Models\Category;
use App\Models\Brand;
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

?>