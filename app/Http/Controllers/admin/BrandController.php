<?php

namespace App\Http\Controllers\admin;

use  App\Models\Brand;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $brands = Brand::latest('id');
        $brands = $brands->where('status', 1);
        if(!empty($request->get('keyword'))){
            $brands->where('name', 'like', '%'.$request->get('keyword').'%');
        }
        $brands =  $brands->paginate(10);
        $data['brands'] = $brands;
        return view("admin.brand.list", $data);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.brand.create');

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $validator = Validator($request->all(),[
            "name" => "required",
            "slug" => "required|unique:brands,name",
            "status" => "required"
        ],
        [
            'slug.unique' => 'Slug already exist in the table',
        ]);

        if($validator->passes()){

            $brand = new Brand;
           
            $brand->name = $request->name;
            $brand->slug = $request->slug;
            $brand->status = $request->status;
            $brand->save();

            $request->session()->flash('success', 'Brand added successfully');
            return response()->json([
                "status" => true,
                "message" => "Brand created successfully"
            ]);

        }else{
            return response()->json([
                "status" => false,
                "errors" => $validator->errors()
            ]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id, Request $request)
    {
        //
        $data['brand'] = Brand::find($id);
        if(empty($data['brand'])){

            $request->session()->flash('error', "Brand not found");
            return redirect()->route('brands.index');
        }
       
        return view('admin.brand.edit', $data);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $brand = Brand::find($id);
        if(empty($brand)){
            $request->session()->flash('error', 'Brand not found');
            return response()->json([
                "status" => false,
                "message" => "Brand not found"
            ]);
        }else {

            $validator = Validator::make($request->all(),[
                "name" => "required",
                "slug" => "required|unique:brands,slug,".$id
            ]);
    
            if($validator->passes()){
    
               
             
                $brand->name = $request->name;
                $brand->slug = $request->slug;
                $brand->status = $request->status;
                $brand->save();
    
                $request->session()->flash('success', 'Brand updated successfully');
                return response()->json([
                    "status" => true,
                    "message" => "Brand updated successfully"
                ]);
    
            }else{
                return response()->json([
                    "status" => false,
                    "errors" => $validator->errors()
                ]);
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id, Request $request)
    {
        $brand = Brand::find($id);
      
        if(empty($brand)){
            return response()->json([
                "status" => false,
                "message" => "Brand not found"
            ]);
        }
        else{
            $brand->delete();
            return response()->json([
                "status" => true,
                "message" => "Brand deleted"
            ]);
        }
    }
}
