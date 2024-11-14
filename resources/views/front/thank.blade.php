@extends('front.layouts.app')

@section('content')
<section class="container">
    <div class="col-md-12 text-center py-5">
        <h1>Thank You!</h1>
        <h5>Your order ID is {{$id}} <a href="{{ route('account.orderDetail', $id)}}">View Detail</a></h5>
    </div>

</section>
@endsection