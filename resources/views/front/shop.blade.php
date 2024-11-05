@extends('front.layouts.app')

@section('content')
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="#">Home</a></li>
                <li class="breadcrumb-item active">Shop</li>
            </ol>
        </div>
    </div>
</section>

<section class="section-6 pt-5">
    <div class="container">
        <div class="row">            
            <div class="col-md-3 sidebar">
                <div class="sub-title">
                    <h2>Categories</h3>
                </div>
                
                <div class="card">
                    <div class="card-body">
                        <div class="accordion accordion-flush" id="accordionExample">
                            @if($categories->isNotEmpty())
                                @foreach ($categories as $category)
                                    <div class="accordion-item">
                                        @if ($category->sub_categories->isNotEmpty())
                                            <h2 class="accordion-header" id="headingOne">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#{{ 'category_'.$category->id }}" aria-expanded="false" aria-controls="collapseOne">
                                                    {{ $category->name }}
                                                </button>
                                            </h2>
                                        @else
                                            <a href="{{route('front.shop', $category->slug) }}" class="nav-item nav-link {{ ($categorySelected == $category->id) ? 'text-primary' : '' }} ">{{ $category->name }}</a>
                                        @endif
                                        @if ($category->sub_categories->isNotEmpty())
                                            <div id="{{ 'category_'.$category->id }}" class="accordion-collapse collapse {{ ($categorySelected == $category->id) ? 'show' : '' }}" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                                                <div class="accordion-body">
                                                    <div class="navbar-nav">
                                                        @foreach ($category->sub_categories as $sub_category)
                                                            <a href="{{ route('front.shop', [$category->slug, $sub_category->slug]) }} " class="nav-item nav-link {{ ($subCategorySelected == $sub_category->id) ? 'text-primary' : '' }} "> {{  $sub_category->name }} </a>
                                                        @endforeach                                    
                                                    </div>
                                                </div>
                                            </div>
                                        @endif    
                                    </div>
                                @endforeach
                            @endif                      
                        </div>
                    </div>
                </div>

                <div class="sub-title mt-5">
                    <h2>Brand</h3>
                </div>
                
                <div class="card">
                    <div class="card-body">
                        @if(getBrands()->isNotEmpty())
                            @foreach (getBrands() as $brand)
                                <div class="form-check mb-2">
                                    <input {{ (in_array($brand->id, $brandsArray)) ? 'checked' : '' }} class="form-check-input brand-label" type="checkbox" value="{{ $brand->id }}" id="{{ $brand->name.'_'.$brand->id }}">
                                    <label class="form-check-label" for="{{ $brand->name.'_'.$brand->id }}">
                                        {{ $brand->name }}
                                    </label>
                                </div>
                            @endforeach
                        @endif                 
                    </div>
                </div>

                <div class="sub-title mt-5">
                    <h2>Price</h3>
                </div>
                
                <div class="card">
                    <div class="card-body">
                        <input type="text" class="js-range-slider" name="my_range" value="" />                
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-end mb-4">
                            <div class="ml-2">
                                <!-- <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-bs-toggle="dropdown">Sorting</button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">Latest</a>
                                        <a class="dropdown-item" href="#">Price High</a>
                                        <a class="dropdown-item" href="#">Price Low</a>
                                    </div>
                                </div>    
                                                                 -->
                                <select name="sort" id="sort" class="form-control">
                                    <option value="latest" {{ ($sort== 'latest') ? 'selected' : '' }} >Latest</option>
                                    <option value="price_desc"  {{ ($sort== 'price_desc') ? 'selected' : '' }}>Price High</option>
                                    <option value="price_asc"  {{ ($sort== 'price_asc') ? 'selected' : '' }}>Price Low</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    @if($products->isNotEmpty())
                        @foreach ($products as $product )
                            
                            @php
                                $f_prduct_image = '';
                                if($product->product_images->isNotEmpty()){
                                    $f_prduct_image = $product->product_images->first();
                                }
                                
                            @endphp
                            <div class="col-md-4">
                                <div class="card product-card">
                                    <div class="product-image position-relative">
                                        <a href="" class="product-img">
                                            @if(!empty($f_prduct_image))
                                                <img class="card-img-top" src="{{ asset('storage/images/products/small/'.$f_prduct_image->image) }}" alt="">
                                            @endif
                                        </a>
                                        <a class="whishlist" href="222"><i class="far fa-heart"></i></a>                            

                                        <div class="product-action">
                                            <a class="btn btn-dark" href="#">
                                                <i class="fa fa-shopping-cart"></i> Add To Cart
                                            </a>                            
                                        </div>
                                    </div>                        
                                    <div class="card-body text-center mt-3">
                                        <a class="h6 link" href="product.php">{{ $product->title }}</a>
                                        <div class="price mt-2">
                                            <span class="h5"><strong>Rs. {{ number_format($product->price) }}</strong></span>
                                            @if ( $product->compare_price !='')
                                                <span class="h6 text-underline"><del>Rs. {{ number_format($product->compare_price) }}</del></span>
                                            @endif
                                        </div>
                                    </div>                        
                                </div>                                               
                            </div> 
                        @endforeach
                    @endif 
                    <div class="col-md-12 pt-5">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-end">
                                <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@section('customejs')
<script>

    $(".js-range-slider").ionRangeSlider({
        skin: "round",
        min: 0,
        max: 50000,
        from: {{ $price_min }},
        to: {{ $price_max }},
        type: 'double',
        prefix: "Rs",
        grid: true,
        grid_num: 10,
        onFinish: function (data) {
            // Called then action is done and mouse is released
            apply_filter();
            console.log(data.to);
        },
    });

    let price_range = $(".js-range-slider").data("ionRangeSlider");
    console.log(price_range);
    $(".brand-label").change(function(){
        apply_filter();
    });

    $("#sort").change(function(){
        apply_filter();
    });

    function apply_filter(){
        var brands = [];
        $(".brand-label").each(function(){
            if($(this).is(":checked") == true){
                brands.push($(this).val());
            }
        });
        
        url =  "{{  url()->current() }}";
        url += "?brand="+brands.toString();
        url += "&price_min="+price_range.result.from+"&price_max="+price_range.result.to
        
        // sorting 
        url += "&sort="+$("#sort").val();
        window.location.href = url 
        //console.log(brands);
    }
</script>
@endsection