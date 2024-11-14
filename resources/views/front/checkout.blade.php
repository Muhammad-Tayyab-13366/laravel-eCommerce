@extends('front.layouts.app')

@section('content')
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="#">Home</a></li>
                <li class="breadcrumb-item"><a class="white-text" href="#">Shop</a></li>
                <li class="breadcrumb-item">Checkout</li>
            </ol>
        </div>
    </div>
</section>

<section class="section-9 pt-4">
    <form action="" method="post" id="form_checkout"  name="form_checkout">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="sub-title">
                        <h2>Shipping Address</h2>
                    </div>
                    <div class="card shadow-lg border-0">
                        <div class="card-body checkout-form">
                            <div class="row">
                                
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <input type="text" name="first_name" id="first_name" class="form-control" placeholder="First Name">
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <input type="text" name="last_name" id="last_name" class="form-control" placeholder="Last Name">
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <input type="text" name="email" id="email" class="form-control" placeholder="Email">
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <select name="country" id="country" class="form-control">
                                            <option value="">Select a Country</option>
                                            @foreach ($countries as $country)
                                                <option value="{{ $country->id }}">{{ $country->name }}</option>
                                            @endforeach
                                        </select>
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <textarea name="address" id="address" cols="30" rows="3" placeholder="Address" class="form-control"></textarea>
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <input type="text" name="appartment" id="appartment" class="form-control" placeholder="Apartment, suite, unit, etc. (optional)">
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>

                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <input type="text" name="city" id="city" class="form-control" placeholder="City">
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>

                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <input type="text" name="state" id="state" class="form-control" placeholder="State">
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="mb-3">
                                        <input type="text" name="zip" id="zip" class="form-control" placeholder="Zip">
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <input type="text" name="mobile" id="mobile" class="form-control" placeholder="Mobile No.">
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>
                                

                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <textarea name="order_notes" id="order_notes" cols="30" rows="2" placeholder="Order Notes (optional)" class="form-control"></textarea>
                                        <p class="c_error" ></p>
                                    </div>            
                                </div>

                            </div>
                        </div>
                    </div>    
                </div>
                <div class="col-md-4">
                    <div class="sub-title">
                        <h2>Order Summery</h3>
                    </div>                    
                    <div class="card cart-summery">
                        <div class="card-body">
                            @if (!empty($cartContent)) 
                                @foreach ($cartContent as $item)
                                    <div class="d-flex justify-content-between pb-2">
                                        <div class="h6">{{ $item->name }} X {{ $item->qty }}</div>
                                        <div class="h6">Rs. {{ number_format($item->qty *  $item->price) }}</div>
                                    </div>
                                @endforeach
                            @endif
                            <div class="d-flex justify-content-between summery-end">
                                <div class="h6"><strong>Subtotal</strong></div>
                                <div class="h6"><strong>{{ Cart::subtotal() }}</strong></div>
                            </div>
                            <div class="d-flex justify-content-between mt-2">
                                <div class="h6"><strong>Shipping</strong></div>
                                <div class="h6"><strong>Rs. 0</strong></div>
                            </div>
                            <div class="d-flex justify-content-between mt-2 summery-end">
                                <div class="h5"><strong>Total</strong></div>
                                <div class="h5"><strong>Rs. {{ Cart::subtotal() }}</strong></div>
                            </div>                            
                        </div>
                    </div>   
                    
                    <div class="card payment-form ">  
                        <h3>Payment Method</h3>  
                        <br>   
                        <div class="">
                            <input type="radio" name="payment_method" id="payment_1" value="cod" checked>
                            <label for="payment_1">Cash on Delivery</label>
                        </div>  
                        <div class="">
                            <input type="radio" name="payment_method" id="payment_2" value="stripe">
                            <label for="payment_2">Strip</label>
                        </div>                 
                    <br>
                        <div class="card-body p-0 d-none " id="card-payment-body">
                            <h3 class="card-title h5 mb-3">Payment Details</h3>
                            <div class="mb-3">
                                <label for="card_number" class="mb-2">Card Number</label>
                                <input type="text" name="card_number" id="card_number" placeholder="Valid Card Number" class="form-control">
                                <p class="c_error" ></p>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="expiry_date" class="mb-2">Expiry Date</label>
                                    <input type="text" name="expiry_date" id="expiry_date" placeholder="MM/YYYY" class="form-control">
                                    <p class="c_error" ></p>
                                </div>
                                <div class="col-md-6">
                                    <label for="expiry_date" class="mb-2">CVV Code</label>
                                    <input type="text" name="expiry_date" id="expiry_date" placeholder="123" class="form-control">
                                    <p class="c_error" ></p>
                                </div>
                            </div>
                            
                        </div> 
                        <div class="pt-4">
                            <!-- <a href="#" class="btn-dark btn btn-block w-100">Pay Now</a> -->
                            <button class="btn-dark btn btn-block w-100" type="submit">Pay Now</button>
                        </div>                       
                    </div>

                            
                    <!-- CREDIT CARD FORM ENDS HERE -->
                    
                </div>
            </div>
        </div>
    </form>
</section>
@endsection

@section('customejs')
    <script>
        $("#payment_1").click(function(){
                if($(this).is(':checked')){
                    $("#card-payment-body").addClass('d-none');
                }
        });

        $("#payment_2").click(function(){
                if($(this).is(':checked')){
                    $("#card-payment-body").removeClass('d-none');
                }
        });

        $("#form_checkout").submit(function(event){
            
            event.preventDefault();
            $("button[type='submit']").prop('disabled', true);
            $(".c_error").removeClass('invalid-feedback');
            $(".c_error").html('');
            $("input, select, textarea").removeClass("is-invalid");
            $.ajax({
                url: '{{ route("front.processCheckout") }}',
                type: 'post',
                data: $(this).serializeArray(),
                dataType: 'json',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                success: function(response){
                    $("button[type='submit']").prop('disabled', false);
                    if(response.status == false){
                        errors = response.errors;
                        $.each(errors, function(index, value) {
                            console.log('Index: ' + index + ', Value: ' + value);
                            $('#'+index).addClass('is-invalid').siblings('p').addClass('invalid-feedback').html(value);
                        });
                       
                    }else {
                        orderId = response.orderId;
                        window.location.href = "{{ url('thanks') }}/"+orderId;
                    }
                    
                },
                error: function(){

                }
            });

        });
    </script>
@endsection
