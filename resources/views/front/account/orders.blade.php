@extends('front.layouts.app')
@section('content')
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="#">My Account</a></li>
                <li class="breadcrumb-item">Settings</li>
            </ol>
        </div>
    </div>
</section>

<section class=" section-11 ">
    <div class="container  mt-5">
        <div class="row">
            <div class="col-md-3">
                @include('front.account.common.sidebar')
            </div>
            <div class="col-md-9">
            <div class="card">
                <div class="card-header">
                    <h2 class="h5 mb-0 pt-2 pb-2">My Orders</h2>
                </div>
                    <div class="card-body p-4">
                        <div class="table-responsive">
                            <table class="table">
                                <thead> 
                                    <tr>
                                        <th>Orders #</th>
                                        <th>Date Purchased</th>
                                        <th>Status</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if ($orders->isNotEmpty())
                                        @foreach ($orders as $order)
                                            <tr>
                                                <td>
                                                    <a href="{{ route('account.orderDetail', $order->id) }}">{{ $order->id }}</a>
                                                </td>
                                                <td>{{ date("D M, Y h:i A", strtotime($order->created_at)) }}</td>
                                                <td>
                                                    @php
                                                        $dg_status = 'bg-success';
                                                        if($order->status == 'Pending')
                                                            $dg_status = 'bg-danger';
                                                        else if($order->status == 'Shipped')
                                                            $dg_status = 'bg-info';
                                                    @endphp
                                                    <span class="badge {{ $dg_status }}">{{ $order->status }}</span>
                                                    
                                                </td>
                                                <td>Rs. {{ number_format($order->grand_total) }}</td>
                                            </tr>
                                        @endforeach
                                    @else
                                        <tr>
                                            <td colspan="5">Record not found</td>
                                        </tr>
                                    @endif
                                                                           
                                </tbody>
                            </table>
                        </div>                            
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection