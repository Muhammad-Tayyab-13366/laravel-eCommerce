<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\SubCategory;
use Illuminate\Support\Facades\DB;

class ShopController extends Controller
{
    //
    
    public function index(Request $request, $categorySlug = null, $subCategorySlug = null){
        $data = [];
        $categorySelected = '';
        $subCategorySelected = '';
        
        $data['categories'] = Category::orderBy('name', 'ASC')
                ->with('sub_categories')
                ->where('status', 1)
                ->get();

        
        $products = Product::where('status', 1);
        if(!empty($categorySlug)){
            $category = Category::where('slug',  $categorySlug)->first();
            $products =  $products->where('category_id',  $category->id);
            $categorySelected =  $category->id;
           
        }

        if(!empty($subCategorySlug)){
            $subCategory = SubCategory::where('slug',  $subCategorySlug)->first();
            $products =  $products->where('sub_category_id',  $subCategory->id);
            $subCategorySelected = $subCategory->id;
        }

        $brandsArray = [];
        if($request->get('brand') !=''){
            $brandsArray = explode(',',$request->get('brand'));

            $products = $products->whereIn('brand_id', $brandsArray);
        }

        if($request->get('price_min') !='' && $request->get('price_max') !=''){
            $products = $products->whereBetween('price', [intval($request->get('price_min')), intval($request->get('price_max'))]);
        }

        if($request->get('sort') !=''){
            if($request->get('sort') == 'latest'){
                $products = $products->orderBy('id', 'DESC');
            }else  if($request->get('sort') == 'price_desc'){
                $products = $products->orderBy('price', 'DESC');
            }else  if($request->get('sort') == 'price_asc'){
                $products = $products->orderBy('price', 'ASC');
            }else{
                $products = $products->orderBy('id', 'DESC');
            }
        }else{
            $products = $products->orderBy('id', 'DESC');
        }
        $products =  $products->with('product_images')->paginate(6);
        $data['products']   = $products;
        $data['price_min'] = intval($request->get('price_min'));
        $data['price_max'] = intval($request->get('price_max'));
        $data['brandsArray'] = $brandsArray;
        $data['categorySelected'] = $categorySelected;
        $data['subCategorySelected'] = $subCategorySelected;
        $data['sort'] = $request->get('sort');
        return view('front.shop', $data);
    }

    public function product($slug){
    
        $product = Product::where('slug', $slug)->with('product_images')->first();
        if($product == null){
            abort(404);
        }
        
        return view('front.product');
    }
}
