<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\SubCategory;
use App\Models\TempImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Laravel\Facades\Image;
use Spatie\FlareClient\View;

class ProductController extends Controller
{
    public function index(Request $request){

        $products = Product::latest('id')->with('product_images');
        if(!empty($request->get('keyword'))){
            $products = $products->where('title', 'like', '%'.$request->get('keyword').'%');
        }
        $products = $products->paginate(10);
       
        $data['products'] = $products;
        return view('admin.products.list', $data);
    }
    //
    public function create(){
      
        $data = [];
        $data['categories'] = Category::orderBy('name', 'ASC')->get();
        $data['sub_categories'] = SubCategory::orderBy('name', 'ASC')->get();
        $data['brands'] = Brand::orderBy('name', 'ASC')->get();
        return view('admin.products.create', $data);
    }

    public function store(Request $request){

        $rules = [
            'title' => "required",
            'slug' => "required|unique:products",
            'price' => "required",
            'sku' => "required|unique:products",
            'track_qty' => "required|in:Yes,No",
            'category' => "required|numeric",
            'is_featured' => 'required|in:Yes,No'
        ];

        if(!empty($request->track_qty) && $request->track_qty == 'Yes'){
            $rules['qty'] = 'required|numeric';
        }
        $validator = Validator::make($request->all(),$rules);

        if($validator->passes()){
            $product = new Product;
            $product->title = $request->title;
            $product->slug  = $request->slug;
            $product->description = $request->desciption;
            $product->price = $request->price;
            $product->compare_price = $request->compare_price;
            $product->sku = $request->title;
            $product->barcode = $request->barcode;
            $product->track_qty = $request->track_qty;
            $product->qty = $request->qty;
            $product->status = $request->status;
            $product->category_id = $request->category;
            $product->sub_category_id = $request->sub_category;
            $product->brand_id = $request->brand;
            $product->is_featured = $request->is_featured;
            $product->save();
            $inserted_id = $product->id;
            
            $image_array = $request->image_array;

            
            if(!empty($request->image_array)){
                foreach ($request->image_array as $temp_img_id) {
                    $temp_img_obj = TempImage::find($temp_img_id);
                    $temp_image_url = $temp_img_obj->image_url;
                    $temp_image_name = $temp_img_obj->image_name;
                    $sourcePath = storage_path('/app/public/images/products/temp/'. $temp_image_name);
                    $destinationPathLarge = storage_path('/app/public/images/products/large/'. $temp_image_name);
                    $destinationPathSmall = storage_path('/app/public/images/products/small/'. $temp_image_name);
                  
                    $image = Image::read($sourcePath);
                    // Resize image
                    $image->resize(1400, null,function ($constraint) {
                        $constraint->aspectRatio();
                    })->save($destinationPathLarge);

                    $image = Image::read($sourcePath);
                    // Resize image
                    $image->resize(300, 300,function ($constraint) {
                        $constraint->aspectRatio();
                    })->save($destinationPathSmall);
                   
                    
                   // Resize while maintaining aspect ratio
                   
                
                    $productImage = new ProductImage;
                    $productImage->image = $temp_image_name;
                    $productImage->product_id = $inserted_id;
                    $productImage->save();
                }
            }
            


            $request->session()->flash('success', 'Product added successfully');
            return response()->json([
                "status" => true,
                "message" => "Product added successfully"
            ]);


        }else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function product_image_store(Request $request){
       
        $validator = Validator::make($request->all(),[
            'image' => 'required|file|max:2048', // Max size 2MB
        ]);

        
        if($validator->passes()){
            $extension = $request->file('image')->getClientOriginalExtension();

            // Create the custom file name
            $customName = date('Y_m_d_h_i_s') . '.' . $extension;
            $path = $request->file('image')->storeAs('images/products/temp/', $customName, 'public');
            
            $sourcePath = storage_path('/app/public/images/products/temp/'. $customName);
            $destinationPathLarge = storage_path('/app/public/images/products/temp/'. $customName);
            
            $image = Image::read($sourcePath);
            // Resize image
            $image->resize(300, 300,function ($constraint) {
                $constraint->aspectRatio();
            })->save($destinationPathLarge);
           
            $tempImage = new TempImage;
            $tempImage->image_name =  $customName;
            $tempImage->image_url = $path;
            $tempImage->save();
            $id = $tempImage->id;
        

            return response()->json([
                'status' => true,
                'image_name' => $customName,
                'path' => $path,
                'id' => $id
            ]);
        }else {
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function edit($id, Request $request){
        
        $product = Product::find($id);
        if(!empty($product)){
            $data = [];
            $data['product'] = $product;
            $data['categories'] = Category::orderBy('name', 'ASC')->get();
            $data['sub_categories'] = SubCategory::orderBy('name', 'ASC')->get();
            $data['brands'] = Brand::orderBy('name', 'ASC')->get();
            return view('admin.products.edit',$data);
        }else {
            return redirect()->route('prducts.index')->with('error', 'Product not found');
        }
    }

    public function update($id, Request $request){
        $product = Product::find($id);
       
        if(!empty($product)){
            $rules = [
                'title' => "required",
                'slug' => "required|unique:products,slug,".$id.",id",
                'price' => "required",
                'sku' => "required|unique:products,sku,".$id.",id",
                'track_qty' => "required|in:Yes,No",
                'category' => "required|numeric",
                'is_featured' => 'required|in:Yes,No'
            ];

            if(!empty($request->track_qty) && $request->track_qty == 'Yes'){
                $rules['qty'] = 'required|numeric';
            }
            $validator = Validator::make($request->all(),$rules);
            
            if($validator->passes()){
               
                $product->title = $request->title;
                $product->slug  = $request->slug;
                $product->description = $request->desciption;
                $product->price = $request->price;
                $product->compare_price = $request->compare_price;
                $product->sku = $request->title;
                $product->barcode = $request->barcode;
                $product->track_qty = $request->track_qty;
                $product->qty = $request->qty;
                $product->status = $request->status;
                $product->category_id = $request->category;
                $product->sub_category_id = $request->sub_category;
                $product->brand_id = $request->brand;
                $product->is_featured = $request->is_featured;
                $product->save();
                
                $image_array = $request->image_array;

                
                if(!empty($request->image_array)){
                    foreach ($request->image_array as $temp_img_id) {
                        $temp_img_obj = TempImage::find($temp_img_id);
                        $temp_image_url = $temp_img_obj->image_url;
                        $temp_image_name = $temp_img_obj->image_name;
                        $sourcePath = storage_path('/app/public/images/products/temp/'. $temp_image_name);
                        $destinationPathLarge = storage_path('/app/public/images/products/large/'. $temp_image_name);
                        $destinationPathSmall = storage_path('/app/public/images/products/small/'. $temp_image_name);
                    
                        $image = Image::read($sourcePath);
                        // Resize image
                        $image->resize(1400, null,function ($constraint) {
                            $constraint->aspectRatio();
                        })->save($destinationPathLarge);

                        $image = Image::read($sourcePath);
                        // Resize image
                        $image->resize(300, 300,function ($constraint) {
                            $constraint->aspectRatio();
                        })->save($destinationPathSmall);
                    
                        
                    // Resize while maintaining aspect ratio
                    
                    
                        $productImage = new ProductImage;
                        $productImage->image = $temp_image_name;
                        $productImage->product_id = $product->id;
                        $productImage->save();
                    }
                }
                


                $request->session()->flash('success', 'Product updated successfully');
                return response()->json([
                    "status" => true,
                    "message" => "Product updated successfully"
                ]);


            }else{
                return response()->json([
                    'status' => false,
                    'errors' => $validator->errors()
                ]);
            }

        }else{

        }
    }
}
