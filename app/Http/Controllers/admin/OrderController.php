<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    //
    public function index(Request $request){

        $orders = Order::select('orders.*', 'users.name as user_name', 'users.email as user_email', 'users.id as user_id');
        $orders = $orders->leftJoin('users', 'users.id', 'orders.user_id'); 
        if($request->get('keyword') != ''){
            $orders = $orders->where('users.name', 'like', '%'.$request->keyword.'%');
            $orders = $orders->orWhere('users.email', 'like', '%'.$request->keyword.'%');
            $orders = $orders->orWhere('orders.id', 'like', '%'.$request->keyword.'%');
        }

        $orders = $orders->orderBy('orders.created_at', 'desc')->paginate(5);
        $data['orders'] = $orders;
        return view('admin.order.list', $data);
    }

    public function detail(Request $request, $id){
        $data['order'] = Order::select('orders.*', 'c.name as country_name')
                ->where('orders.id', $id)
                ->leftJoin('countries as c', 'c.id', 'orders.country_id')
                ->with('order_items')
                ->first();
        if($data['order'] == null){
        
        }
       

        return view('admin.order.detail', $data);
    }
}
