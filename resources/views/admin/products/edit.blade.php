@extends('admin.layouts.app')
@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">					
        <div class="container-fluid my-2">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Edit Product</h1>
                </div>
                <div class="col-sm-6 text-right">
                    <a href="{{ route('products.index') }}" class="btn btn-primary">Back</a>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
         <form action="" method="post" name="productForm" id="productForm">
            @csrf
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">								
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="title">Title</label>
                                            <input type="text" name="title" id="title" value="{{ $product->title }}" class="form-control" placeholder="Title">	
                                            <p class="custom_error"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="slug">Slug</label>
                                            <input type="text" name="slug" id="slug" value="{{ $product->slug }}" class="form-control" placeholder="Slug">	
                                            <p class="custom_error"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="description">Description</label>
                                            <textarea name="description"  id="description" cols="30" rows="10" class="summernote" placeholder="Description">{{ $product->description }}</textarea>
                                        </div>
                                    </div>
                                                                                
                                </div>
                            </div>	                                                                      
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h2 class="h4 mb-3">Media</h2>								
                                <div id="image" class="dropzone dz-clickable">
                                    <div class="dz-message needsclick">    
                                        <br>Drop files here or click to upload.<br><br>                                            
                                    </div>
                                </div>
                            </div>	                                                                      
                        </div>
                        
                        <div id="product-gallery" class="d-flex">
                                @if (!empty($product_images))
                                    @foreach ($product_images as $product_image)
                                        <div class="col-md-3" id="dimg_{{ $product_image->id }}">
                                            <input type="hidden" name="image_array[]" value="{{ $product_image->id }}">
                                            <div class="card" style=""> 
                                                <img class="card-img-top" src="{{ asset('storage/images/products/small/'.$product_image->image) }}" alt="Card image cap">
                                                <div class="card-body pt-2">
                                                    <a href="javascript:void(0);" class="btn btn-danger" onclick=deleteImage({{ $product_image->id }})>Delete</a>
                                                </div>
                                            </div>
                                        </div> 
                                    @endforeach
                                @endif                                                               
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h2 class="h4 mb-3">Pricing</h2>								
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="price">Price</label>
                                            <input type="text" name="price" id="price" value="{{ $product->price }}" class="form-control" placeholder="Price">	
                                            <p class="custom_error"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="compare_price">Compare at Price</label>
                                            <input type="text" name="compare_price" value="{{ $product->compare_price }}" id="compare_price" class="form-control" placeholder="Compare Price">
                                            <p class="text-muted mt-3">
                                                To show a reduced price, move the product’s original price into Compare at price. Enter a lower value into Price.
                                            </p>	
                                        </div>
                                    </div>                                            
                                </div>
                            </div>	                                                                      
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h2 class="h4 mb-3">Inventory</h2>								
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="sku">SKU (Stock Keeping Unit)</label>
                                            <input type="text" name="sku" id="sku"  value="{{ $product->sku }}" class="form-control" placeholder="sku">	
                                            <p class="custom_error"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="barcode">Barcode</label>
                                            <input type="text" name="barcode" id="barcode"  value="{{ $product->barcode }}" class="form-control" placeholder="Barcode">	
                                        </div>
                                    </div>   
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <div class="custom-control custom-checkbox">
                                                <input type="hidden" name="track_qty" value="No">
                                                <input class="custom-control-input" type="checkbox" id="track_qty" value="Yes" name="track_qty"  @if($product->track_qty == 'Yes') checked @endif>
                                                <label for="track_qty" class="custom-control-label">Track Quantity</label>
                                                <p class="custom_error"></p>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <input type="number" min="0" name="qty"  value="{{ $product->qty }}" id="qty" class="form-control" placeholder="Qty">	
                                            <p class="custom_error"></p>
                                        </div>
                                    </div>                                         
                                </div>
                            </div>	                                                                      
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-3">
                            <div class="card-body">	
                                <h2 class="h4 mb-3">Product status</h2>
                                <div class="mb-3">
                                    <select name="status" id="status" class="form-control">
                                        <option value="1" @if($product->status == 1) selected @endif >Active</option>
                                        <option value="0"  @if($product->status == 0) selected @endif>Block</option>
                                    </select>
                                </div>
                            </div>
                        </div> 
                        <div class="card">
                            <div class="card-body">	
                                <h2 class="h4  mb-3">Product category</h2>
                                <div class="mb-3">
                                    <label for="category">Category</label>
                                    <select name="category" id="category" class="form-control">
                                        <option value="">Select Category</option>
                                        @foreach ($categories as $category )
                                            <option @if($product->category_id ==  $category->id) selected @endif value="{{  $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="category">Sub category</label>
                                    <select name="sub_category" id="sub_category" class="form-control">
                                        <option value="">Select Sub-category</option>
                                        @foreach ($sub_categories as $sub_category )
                                            <option @if($product->sub_category_id == $sub_category->id) selected @endif value="{{  $sub_category->id }}">{{ $sub_category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div> 
                        <div class="card mb-3">
                            <div class="card-body">	
                                <h2 class="h4 mb-3">Product brand</h2>
                                <div class="mb-3">
                                    <select name="brand" id="brand" class="form-control">
                                        <option value="">Select Brand</option>
                                        @foreach ($brands as $brand )
                                            <option @if($product->brand_id == $brand->id) selected @endif value="{{  $brand->id }}">{{ $brand->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div> 
                        <div class="card mb-3">
                            <div class="card-body">	
                                <h2 class="h4 mb-3">Featured product</h2>
                                <div class="mb-3">
                                    <select name="is_featured" id="is_featured" class="form-control">
                                        <option value="No" @if($product->is_featured == 'No') selected @endif >No</option>
                                        <option value="Yes"  @if($product->is_featured == 'Yes') selected @endif>Yes</option>                                                
                                    </select>
                                </div>
                            </div>
                        </div>                                 
                    </div>
                </div>
                
                <div class="pb-5 pt-3">
                    <button class="btn btn-primary">Update</button>
                    <a href="products.html" class="btn btn-outline-dark ml-3">Cancel</a>
                </div>
            </div>
        </form>
       
        <!-- /.card -->
    </section>
    <!-- /.content -->
@endsection

@section('customejs')
<script>
    $("#title").on('input', function(){
        name = $(this).val();
        $.ajax({
            url : ' {{ route("getSlug") }}',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            type: 'get',
            data: { "title" : name },
            dataType: 'json',
            success: function(response){

                if(response['slug']){
                    $("#slug").val(response['slug']);
                }
            },
            error: function(jqXHR, exception){

            }
        });
    });

    $("#category").on('change', function(){
        
        category_id = $(this).val();

        $.ajax({
            url: '{{ route("sub-categories.get-by-category-id") }}',
            type: 'post',
            data: { category_id : category_id},
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function(response){
                if(response['status'] == true){
                    $("#sub_category").find('option:not(:first)').remove();
                   
                    options = '';
                    subCategories = response['subCategories'];
                    subCategories.forEach((subCategory, index, array) => {
                        console.log(subCategory.name);
                        options += '<option value="'+subCategory.id+'">'+subCategory.name+'</option>';
                    });
                    $("#sub_category").append(options);
                }
            },
            error: function(){

            }
        })

    });

    $("#productForm").submit(function(e){
        e.preventDefault();
        formArray = $(this).serializeArray();
        $(".custom_error").html('');
        $("button[type='submit']").prop("disabled", true);
        $("input[type='text'],input[type='number'], select").removeClass('is-invalid');
        $.ajax({
            url: '{{ route("products.update", $product->id) }}',
            type: 'post',
            data: formArray,
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function(response){
                $("button[type='submit']").prop("disabled", false);
                if(response['status'] == false){
                    errors = response['errors'];
                    if(errors['title']){
                        $("#title").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['title']);
                    }
                    if(errors['slug']){
                        $("#slug").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['slug']);
                    }
                    if(errors['price']){
                        $("#price").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['price']);
                    }
                    if(errors['sku']){
                        $("#sku").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['sku']);
                    }
                    if(errors['track_qty']){
                        $("#track_qty").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['track_qty']);
                    }
                    if(errors['category']){
                        $("#category").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['category']);
                    }
                    if(errors['is_featured']){
                        $("#is_featured").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['is_featured']);
                    }
                    if(errors['qty']){
                        $("#qty").addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(errors['qty']);
                    }
                }else{
                    window.location.href = "{{ route('products.index') }}";
                }
            },
            error: function(){

            }
        })

    });

    
    Dropzone.autoDiscover = false;

    const dropzone = $("#image").dropzone({
        init: function (){
            this.on('addfile', function(file){
                if(this.files.lenght > 1){
                    this.removeFile(this.files[0]);
                }
            });
        },
        url: "{{ route('products.images.save')}}",
        maxFiles: 10,
        paramName: 'image',
        params: {
            isEdit: 1, // Example of an extra parameter
            product_id : "{{ $product->id }}"
        },
        addRemoveLinks: true,
        acceptedFiles: 'image/jpeg,image/png,image/gif',
        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
        success: function(file, response){

            if(response.status == true){
                img_path = response.path;
                img_path_full = "{{ url('storage') }}/"+img_path;
                var html = `
                    <div class="col-md-3" id="dimg_${response.id}">
                        <input type="hidden" name="image_array[]" value="${response.id}">
                        <div class="card pt-0" style="" >
                            <img class="card-img-top" src="${img_path_full}" alt="Card image cap">
                            <div class="card-body pt-2">
                                <a href="javascript:void(0);" class="btn btn-danger" onclick=deleteImage(${response.id})>Delete</a>
                            </div>
                        </div>
                    </div> `;

                $("#product-gallery").append(html);
            }
        },
        complete: function(file){
            this.removeFile(file);
        }
    });
  
    function deleteImage(id){

        $.ajax({
            url: '{{ route("products.images.delete") }}',
            type: 'post',
            data: { id: id },
            dataType: 'json',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function(response){
                if(response.status == true){
                    $("#dimg_"+id).remove();
                }else {
                    alert(response.message);
                }
            },
            error: function(){

            }
        })
    }




</script>
@endsection