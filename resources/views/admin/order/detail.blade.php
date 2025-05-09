@extends('admin.layouts.app')
@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">					
    <div class="container-fluid my-2">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Order: #{{ $order->id }}</h1>
            </div>
            <div class="col-sm-6 text-right">
                <a href="{{ route('admin-order.list') }}" class="btn btn-primary">Back</a>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</section>
<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="container-fluid">
        @include('admin.message')
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header pt-3">
                        <div class="row invoice-info">
                            <div class="col-sm-4 invoice-col">
                            <h1 class="h5 mb-3">Shipping Address</h1>
                            <address>
                                <strong>{{ $order->first_name.' '.$order->last_name }}</strong><br>
                                {{ $order->address }}<br>
                                {{ $order->city }}, {{ $order->zip }}, {{ $order->country_name }}<br>
                                Email: {{ $order->email }}<br>
                                Phone: {{ $order->phone }}<br>
                            </address>
                            </div>
                            <div class="col-sm-4 invoice-col">
                                <b>Invoice #007612</b><br>
                                <br>
                                <b>Order ID:</b> {{ $order->id }}<br>
                                <b>Total:</b> Rs. {{ number_format($order->grand_total) }}<br>
                                <b>Status:</b> 
                                @if($order->status == 'Pending')
                                    <span class="badge bg-danger">{{ $order->status }}</span>
                                @elseif ($order->status == 'Shipped')
                                    <span class="badge bg-info">{{ $order->status }}</span>
                                @else 
                                    <span class="badge bg-success">{{ $order->status }}</span>
                                @endif 
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="card-body table-responsive p-3">								
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th width="100">Price</th>
                                    <th width="100">Qty</th>                                        
                                    <th width="100">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($order->order_items as $order_item)
                                    <tr>
                                        <td>{{ $order_item->name }}</td>
                                        <td>Rs. {{ number_format($order_item->price) }}</td>                                        
                                        <td>{{ $order_item->qty }}</td>
                                        <td>{{ number_format($order_item->total) }}</td>
                                    </tr>
                                @endforeach
                                
                                
                                <tr>
                                    <th colspan="3" class="text-right">Subtotal:</th>
                                    <td>Rs. {{ number_format($order->subtotal) }}</td>
                                </tr>
                                
                                <tr>
                                    <th colspan="3" class="text-right">Shipping:</th>
                                    <td>Rs. 0</td>
                                </tr>
                                <tr>
                                    <th colspan="3" class="text-right">Grand Total:</th>
                                    <td>Rs. {{ number_format($order->grand_total) }}</td>
                                </tr>
                            </tbody>
                        </table>								
                    </div>                            
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h2 class="h4 mb-3">Order Status</h2>
                        <div class="mb-3">
                            <select name="status" id="status" class="form-control">
                                <option value="Pending" @if($order->status == 'Pending') selected @endif >Pending</option>
                                <option value="Shipped" @if($order->status == 'Shipped') selected @endif>Shipped</option>
                                <option value="Delivered" @if($order->status == 'Delivered') selected @endif>Delivered</option>
                                <option value="Cancelled" @if($order->status == 'Cancelled') selected @endif>Cancelled</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary" id="btn_update_status">Update</button>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <h2 class="h4 mb-3">Send Inovice Email</h2>
                        <div class="mb-3">
                            <select name="sel_invoice_user" id="sel_invoice_user" class="form-control">
                                <option value="customer">Customer</option>                                                
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary" id="btn_send_invoice">Send</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.card -->
</section>
<!-- /.content -->
@endsection

@section('customejs')
<script>
    $("#btn_update_status").on('click', function(){
        status = $("#status").val();
            $.ajax({
                url : ' {{ route("admin-order.changeStatus") }}',
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                type: 'post',
                data: { "id" : "{{ $orderId }}", "status" : status },
                dataType: 'json',
                success: function(response){
                    window.location.href = "{{ route('admin-order.detail',  $orderId) }}";
                    
                },
                error: function(jqXHR, exception){

                }
            });
        });

    $("#btn_send_invoice").on('click', function(){
        invoice_user = $("#sel_invoice_user").val();
        $.ajax({
            url : ' {{ route("admin-order.sendEmail") }}',
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            type: 'post',
            data: { "id" : "{{ $orderId }}", "invoice_user" : invoice_user },
            dataType: 'json',
            success: function(response){
        
            },
            error: function(jqXHR, exception){

            }
        });
    });
</script>

@endsection