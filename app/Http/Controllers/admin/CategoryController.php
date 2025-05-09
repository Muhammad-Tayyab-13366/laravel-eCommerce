<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use Intervention\Image\Laravel\Facades\Image;

class CategoryController extends Controller
{
    //

    public function index(Request $request){

        $categories = Category::latest();

        if(!empty($request->get('keyword'))){
            $categories->where('name', 'like', '%'.$request->get('keyword').'%');
        }
        $categories = $categories->paginate(10);
        $data['categories'] = $categories;
        return view('admin.category.list', $data);
    }

    public function create(){
        return view('admin.category.create');
    }

    public function store(Request $request){
    
       // print_r($request->all());
        $validator = Validator::make($request->all(),[
            "name" => "required",
            "slug" => "required|unique:categories",
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        
        if($validator->passes()){
            $path = '';
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $newFileName =   $request->slug.date('Y_m_d_h_i_s').'.'.$image->getClientOriginalExtension();
                $path  = $image->storeAs('images/categories', $newFileName, 'public'); // Store in 'storage/app/public/images

                $sourcePath = storage_path('/app/public/images/categories/'. $newFileName);
                $destinationPathLarge = storage_path('/app/public/images/categories/'. $newFileName);
                $image = Image::read($sourcePath);
                // Resize image
                $image->resize(300, 300,function ($constraint) {
                    $constraint->aspectRatio();
                })->save($destinationPathLarge);
            }

            $category = new Category;
            $category->name = $request->name;
            $category->slug = $request->slug;
            $category->status = $request->status;
            $category->show_on_home_page = $request->show_on_home_page;
            $category->image  = $path;
            $category->save();
        
            

            $request->session()->flash('success', 'Category added successfully');

            return response()->json([
                "status" => true,
                "message" => "Category added successfully"
            ]);

        }else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
        
    }

    public function edit($category_id, Request $request){
        
        $category = Category::find($category_id);

        if(empty($category)){
            return redirect()->route('categories.index');
        }
        $data['category'] = $category;
        return view('admin.category.edit', $data);
    }

    public function update($category_id, Request $request){
       
        $category = Category::find($category_id);
       
        if(empty($category)){
            return response()->json([
                "status" => false,
                "notFound" => true,
                "message" => 'Category not found'
            ]);
        }
       
        $validator = Validator::make($request->all(),[
            "name" => "required",
            "slug" => "required|unique:categories,slug,". $category->id.",id",
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        if($validator->passes()){

            if($request->hasFile('image')){
                $image = $request->file('image');
                //$newFileName = $request->slug.".".$image->getClientOriginalExtension();
                //$path = $image->storeAs('images/categories', $newFileName, 'public');
                $newFileName =   $request->slug.date('Y_m_d_h_i_s').'.'.$image->getClientOriginalExtension();
                $path = $image->storeAs('images/categories', $newFileName, 'public'); // Store in 'storage/app/public/images

                $sourcePath = storage_path('/app/public/images/categories/'. $newFileName);
                $destinationPathLarge = storage_path('/app/public/images/categories/'. $newFileName);
                $image = Image::read($sourcePath);
                // Resize image
                $image->resize(300, 300,function ($constraint) {
                    $constraint->aspectRatio();
                })->save($destinationPathLarge);


                $category->image = $path;
            }

            $category->name = $request->name;
            $category->slug = $request->slug;
            $category->status = $request->status;
            $category->show_on_home_page = $request->show_on_home_page;
            $category->save();

            $request->session()->flash('success', 'Category updated successfully');
            //return redirect()->route('categories.index');
            return response()->json([
                "status" => true,
                "message" => "Category updated successfully"
            ]);
            
        }else{
            return response()->json([
                "status" => false,
                "errors" => $validator->errors()
            ]);
        }
    }

    public function destroy($category_id, Request $request){
        $category = Category::find($category_id);
        if(empty($category)){
            return response()->json([
                "status" => false,
                "message" => "Category not found"
            ]);
        }

        $category->delete();
       // $request->session()->flash('success', 'Category deleted');

        return response()->json([
            "status" => true,
            "message" => "Category deleted"
        ]);
    }
}
