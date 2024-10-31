<?php

use App\Models\Category;

function getCategories(){
    return Category::orderBy('name', 'ASC')
    ->with('sub_categories')
    ->where('show_on_home_page', 'Yes')
    ->where('status', 1)
    ->get();
}

?>