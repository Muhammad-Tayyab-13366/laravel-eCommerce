<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use App\Models\SubCategory;

class SubCategoryController extends Controller
{
    //
    public function index(Request $request){
       
        $sub_categories = Subcategory::latest('id');
        $sub_categories = $sub_categories->where('status', 1)->with('category');
        if(!empty($request->get('keyword'))){
            $sub_categories->where('name', 'like', '%'.$request->get('keyword').'%');
        }
        $sub_categories =  $sub_categories->paginate(10);
        $data['sub_categories'] = $sub_categories;
        return view("admin.sub_category.list", $data);
    }

    public function create(){

        $categories = Category::where('status', 1)->get();
        return view('admin.sub_category.create', compact('categories'));
    }

    public function store(Request $resquest){
        $validator = Validator::make($resquest->all(),[
            "category" => "required",
            "name" => "required",
            "slug" => "required|unique:sub_categories,slug"
        ]);

        if($validator->passes()){

            $sub_category = new SubCategory;
            $sub_category->category_id = $resquest->category;
            $sub_category->name = $resquest->name;
            $sub_category->slug = $resquest->slug;
            $sub_category->status = $resquest->status;
            $sub_category->show_on_home_page = $resquest->show_on_home_page;
            $sub_category->save();

            $resquest->session()->flash('success', 'Sub-Category added successfully');
            return response()->json([
                "status" => true,
                "message" => "Sub-Category created successfully"
            ]);

        }else{
            return response()->json([
                "status" => false,
                "errors" => $validator->errors()
            ]);
        }
    }

    public function edit($sub_category, Request $request){
        $data['sub_category'] = SubCategory::find($sub_category);
        if(empty($data['sub_category'])){

            $request->session()->flash('error', "Sub-category not found");
            return redirect()->route('sub-categories.index');
        }
        $data['categories']   = Category::where('status',1)->get();
        return view('admin.sub_category.edit', $data);
    }

    public function update($sub_category_id, Request $request){

        $sub_category = SubCategory::find($sub_category_id);
        if(empty($sub_category)){
            $request->session()->flash('error', 'Sub-category not found');
            return response()->json([
                "status" => false,
                "message" => "Sub-category not found"
            ]);
        }else {

            $validator = Validator::make($request->all(),[
                "category" => "required",
                "name" => "required",
                "slug" => "required|unique:sub_categories,slug,".$sub_category_id
            ]);
    
            if($validator->passes()){
    
               
                $sub_category->category_id = $request->category;
                $sub_category->name = $request->name;
                $sub_category->slug = $request->slug;
                $sub_category->status = $request->status;
                $sub_category->show_on_home_page = $request->show_on_home_page;
                $sub_category->save();
    
                $request->session()->flash('success', 'Sub-Category updated successfully');
                return response()->json([
                    "status" => true,
                    "message" => "Sub-Category updated successfully"
                ]);
    
            }else{
                return response()->json([
                    "status" => false,
                    "errors" => $validator->errors()
                ]);
            }
        }

    }

    public function destroy($sub_category_id, Request $request){
        
        $sub_category = SubCategory::find($sub_category_id);
      
        if(empty($sub_category)){
            return response()->json([
                "status" => false,
                "message" => "Sub category not found"
            ]);
        }
        else{
            $sub_category->delete();
            return response()->json([
                "status" => true,
                "message" => "Sub category deleted"
            ]);
        }
    }

    public function getByCategoryId(Request $request){

        $category_id = $request->get('category_id');
        $sub_categories = SubCategory::where('category_id', $category_id)
        ->orderBy('name', 'ASC')
        ->get();

        return response()->json([
            "status" => true,
            "subCategories" => $sub_categories
        ]);

    }
}
