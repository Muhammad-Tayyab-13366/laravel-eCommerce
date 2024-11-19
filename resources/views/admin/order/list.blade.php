@extends('admin.layouts.app')
@section('content')
<!-- Content Header (Page header) -->
<section class="content-header">					
    <div class="container-fluid my-2">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Orders</h1>
            </div>
            <div class="col-sm-6 text-right">
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</section>
<!-- Main content -->
<section class="content">
    <!-- Default box -->
    <div class="container-fluid">
        <div class="card">
            <form action="" method="get">
                <div class="card-header">
                    <div class="card-title">
                        <button type="button" onclick="window.location.href ='{{ route("admin-order.list") }}' " class="btn btn-default btn-sm">Reset</button>
                    </div>
                    <div class="card-tools">
                        <div class="input-group input-group" style="width: 250px;">
                            
                            <input type="text" name="keyword" class="form-control float-right" value="{{ Request::get('keyword') }}" placeholder="Search">
        
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default">
                                <i class="fas fa-search"></i>
                                </button>
                            </div>
                            </div>
                    </div>
                </div>
            </form>
            <div class="card-body table-responsive p-0">								
                <table class="table table-hover text-nowrap">
                    <thead>
                        <tr>
                            <th>Orders #</th>											
                            <th>Customer</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Total</th>
                            <th>Date Purchased</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($orders as $order)
                        <tr> 
                            <td><a href="{{ route('admin-order.detail', $order->id) }}">{{ $order->id }}</a></td>
                            <td>{{ $order->user_name }}</td>
                            <td>{{ $order->user_email }}</td>
                            <td>{{ $order->phone }}</td>
                            <td>
                                @if($order->status == 'Pending')
                                    <span class="badge bg-danger">{{ $order->status }}</span>
                                @elseif ($order->status == 'Shipped')
                                    <span class="badge bg-info">{{ $order->status }}</span>
                                @else 
                                    <span class="badge bg-success">{{ $order->status }}</span>
                                @endif
                            </td>
                            <td>Rs. {{ number_format($order->grand_total) }}</td>
                            <td>{{ date('D d M, Y h:i A', strtotime($order->created_at)) }}</td>																				
                        </tr>
                    @endforeach
                        
                    </tbody>
                </table>										
            </div>
            <div class="card-footer clearfix">
                {{ $orders->links() }}
            </div>
        </div>
    </div>
    <!-- /.card -->
</section>
<!-- /.content -->
@endsection