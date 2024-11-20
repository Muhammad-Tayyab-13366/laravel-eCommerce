<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Email</title>
</head>
<body>
    
    <h1>Thanks for your order</h1>
    <h2>Your order id is #{{ $mailData['order']->id }}</h2>

    <h2>Products</h2>
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
            @foreach( $mailData['order']->order_items as $order_item)
                <tr>
                    <td>{{ $order_item->name }}</td>
                    <td>Rs. {{ number_format($order_item->price) }}</td>                                        
                    <td>{{ $order_item->qty }}</td>
                    <td>{{ number_format($order_item->total) }}</td>
                </tr>
            @endforeach
            
            
            <tr>
                <th colspan="3" class="text-right">Subtotal:</th>
                <td>Rs. {{ number_format($mailData['order']->subtotal) }}</td>
            </tr>
            
            <tr>
                <th colspan="3" class="text-right">Shipping:</th>
                <td>Rs. 0</td>
            </tr>
            <tr>
                <th colspan="3" class="text-right">Grand Total:</th>
                <td>Rs. {{ number_format($mailData['order']->grand_total) }}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>