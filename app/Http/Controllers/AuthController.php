<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function login(){
        return view('front.account.login');
    }

    public function processLogin(Request $request){
        $validator = Validator::make($request->all(),[
            'email' => 'required|email',
            'password' => 'required|min:5'
        ]);

        if($validator->passes()){

            if(Auth::attempt([
                'email' => $request->email,
                'password' => $request->password]
            ))
            {
                if(session()->has('url.intended')){
                    return redirect(session()->get('url.intended'));
                }
                return redirect()->route('account.profile');
                if(Auth::user()->role != 1){
                    //Auth::logout();
                   // redirect()->route('account.login')->with('error', 'You are not authorized user')
                }
            }else {
                session()->flash('error', 'Email or password is incorrect');
                return redirect()->route('account.login')->withInput($request->only('email'));
            }

        }else {
            return redirect()->route('account.login')->withErrors($validator)->withInput($request->only('email'));
           
        }

    }

    public function register(){
       
        return view('front.account.register');
    }

    public function processRegister(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => 'required|min:3',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:5|confirmed'
        ]);

        if($validator->passes()){

            $user = new User;
            $user->name = $request->name;
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->phone = $request->phone;
            $user->role = 1;
            $user->save();

            session()->flash('success' , 'You have been registerd successfully.');
            //return//  redirect()->route('account.login');
            return response()->json([
                'status' => true,
                'message' => 'User registered successfully'
            ]);
        }else{
            return response()->json([
                'status' => false,
                'errors' => $validator->errors()
            ]);
        }
    }

    public function profile(){
        return view('front.account.profile');
    }

    public function logout(){
        Auth::logout();
        return redirect()->route('account.login')->with('success', 'You successfullt logout!');
    }

    public function orders(){
        $user = Auth::user();
        $user_id = $user->id;
        $data['orders'] = Order::where('user_id', $user_id)->orderBy('created_at', 'DESC')->get();
        
        return view('front.account.orders', $data);
    }

    public function orderDetail($id){
        echo "<pre>"; print_r(session()->all());
        $user = Auth::user();
        $user_id = $user->id;
        $data['order'] = Order::where('user_id', $user_id)
                            ->where('id', $id)
                            ->with('order_items')
                            ->first();
        if($data['order'] == null){
          //  return response()
        }
        return view('front.account.orderDetail', $data);
    }
}
