@extends('front.layouts.app')

@section('content')
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="{{ route('front.home') }}">Home</a></li>
                <li class="breadcrumb-item"><a class="white-text" href="{{ route('front.shop') }}">Shop</a></li>
                <li class="breadcrumb-item">Cart</li>
            </ol>
        </div>
    </div>
</section>

<section class=" section-9 pt-4">
    <div class="container">
        <div class="row">
            
           
            <div class="col-md-8">
                @if(session('success'))
                    <div class="alert alert-success" role="alert">{{ session('success') }}</div>
                @endif
                
                
                @if(session('error'))
                    <div class="alert alert-danger" role="alert"> {{ session('error') }} </div>
                @endif
                <div class="table-responsive">
                    <table class="table" id="cart">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>

                            @if (!empty($cartContent)) 
                                @foreach ($cartContent as $item)
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-start ">
                                                @if($item->options->productImage->image) 
                                                    <img src="{{ asset('storage/images/products/small/'.$item->options->productImage->image) }} " width="" height="">
                                                @endif
                                                <h2>{{ $item->name }}</h2>
                                            </div>
                                        </td>
                                        <td>Rs. {{ number_format($item->price) }}</td>
                                        <td>
                                            <div class="input-group quantity mx-auto" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-dark btn-minus p-2 pt-1 pb-1 sub" data-id="{{ $item->rowId }}" >
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" class="form-control form-control-sm  border-0 text-center" value="{{ $item->qty }}">
                                                <div class="input-group-btn">
                                                    <button class="btn btn-sm btn-dark btn-plus p-2 pt-1 pb-1 add"  data-id="{{ $item->rowId }}" >
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                           Rs. {{ number_format($item->price * $item->qty) }}
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-danger" onclick="deleteCartItem('{{ $item->rowId }}')"><i class="fa fa-times"></i></button>
                                        </td>
                                    </tr>
                                @endforeach
                            @endif 
                            @if(Cart::count() == 0)
                                <tr>
                                    <td class="text-start " colspan="5">Cart is empty</td>
                                </tr>
                            @endif                          
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-4">            
                <div class="card cart-summery">
                    <div class="sub-title">
                        <h2 class="bg-white">Cart Summery</h3>
                    </div> 
                    <div class="card-body">
                        <div class="d-flex justify-content-between pb-2">
                            <div>Subtotal</div>
                            <div>Rs. {{ Cart::subtotal() }}</div>
                        </div>
                        <div class="d-flex justify-content-between pb-2">
                            <div>Shipping</div>
                            <div>Rs 0</div>
                        </div>
                        <div class="d-flex justify-content-between summery-end">
                            <div>Total</div>
                            <div>Rs. {{ Cart::subtotal() }}</div>
                        </div>
                        <div class="pt-5">
                            <a href="{{ route('front.checkout') }}" class="btn-dark btn btn-block w-100">Proceed to Checkout</a>
                        </div>
                    </div>
                </div>     
                <!-- <div class="input-group apply-coupan mt-4">
                    <input type="text" placeholder="Coupon Code" class="form-control">
                    <button class="btn btn-dark" type="button" id="button-addon2">Apply Coupon</button>
                </div>  -->
            </div>
        </div>
    </div>
</section>
@endsection

@section('customejs')

    <script>
        $('.add').click(function(){
            qty = 0;
            var qtyElement = $(this).parent().prev(); // Qty Input
            var qtyValue = parseInt(qtyElement.val());
            if (qtyValue < 10) {
                qty = qtyValue+1;
                qtyElement.val(qty);
            }  
            var rowId = $(this).data('id');
            if(qty != 0){
                updateCart(rowId, qty);
            }
        });

        $('.sub').click(function(){
            qty = 0;
            var qtyElement = $(this).parent().next(); 
            var qtyValue = parseInt(qtyElement.val());
            if (qtyValue > 1) {
                qty = qtyValue-1;
                qtyElement.val(qty);
            }  
            var rowId = $(this).data('id');
            if(qty != 0){
                updateCart(rowId, qty);
            }
        });

        function updateCart(rowId, qty){
            $.ajax({
                url: '{{ route("front.updateCart") }}',
                type: 'post',
                data: {rowId:rowId, qty:qty},
                dataType: 'json',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                success: function(response){
                    
                    window.location.href = "{{ route('front.cart') }}";
                    
                },
                error: function(){

                }
            });
        }

        function deleteCartItem(rowId){
            $.ajax({
                url: '{{ route("front.deleteCartItem") }}',
                type: 'post',
                data: {rowId:rowId},
                dataType: 'json',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                success: function(response){
                    
                    window.location.href = "{{ route('front.cart') }}";
                    
                },
                error: function(){

                }
            });
        }
    </script>
@endsection