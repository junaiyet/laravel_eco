<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Country;
use App\Models\City;
use App\Models\Order;
use App\Models\BillingDetails;
use App\Models\OrderProduct;
use App\Models\Inventory;
use App\Mail\InvoiceSend;
use Mail;
use Auth;
use Illuminate\Support\Facades\Auth as FacadesAuth;

class CheckoutController extends Controller
{
    //\


    function checkout(){
        $countries = Country::all();
        $carts = Cart::where('customer_id', Auth::guard('customerlogin')->id())->get();
        $cart_total = 0;
        foreach($carts as $cart ){
            $cart_total += $cart->rel_to_product->after_discount * $cart->quantity;
        }
        return view('frontend.checkout',[
            'sub_total'=> $cart_total,
            'countries'=> $countries,
        ]);
    }

    function getCity( Request $request){
        $str =  '<option value="" >Select City</option>';
        $cities =  City::where('country_id', $request->country_id )->get();
        foreach($cities as $city){
            $str.= '<option value="'.$city->id.'" >'.$city->name.'</option>';
        }
        echo $str;

    }

    function order_store(Request $request){


       if($request->payment_method == 1){
      $order_id =  Order::insertGetId([
                'customer_id'=>Auth::guard('customerlogin')->id(),
                'sub_total'=>$request->sub_total ,
                'discount'=>$request->discount ,
                'charge'=>$request->charge ,
                'total'=>$request->total ,
                'created_at'=> now(),

               ]);
               BillingDetails::insert([
                'order_id'=>$order_id,
                'customer_id'=>Auth::guard('customerlogin')->id(),
                'name'=>$request->name,
                'email'=>$request->email,
                'phone'=>$request->phone,
                'company'=>$request->company,
                'country_id'=>$request->country_id,
                'city_id'=>$request->city_id,
                'address'=>$request->address,
                'notes'=>$request->notes,
                'created_at'=> now(),

               ]);

               $carts = Cart::where('customer_id', Auth::guard('customerlogin')->id())->get();
               foreach($carts as $cart){

                OrderProduct::insert([
                    'customer_id'=>Auth::guard('customerlogin')->id(),
                    'order_id'=>$order_id,
                    'product_id'=>$cart->product_id,
                    'color_id'=>$cart->color_id,
                    'size_id'=>$cart->size_id,
                    'price'=>$cart->rel_to_product->after_discount,
                    'quantity'=>$cart->quantity,
                    'created_at'=> now(),
                ]);
                // Inventory::where('product_id',$cart->product_id)->where('color_id',$cart->color_id)->where('size_id', $cart->size_id)->decrement('quantity',$cart->quantity);

               }

                       Mail::to($request->email)->send(new InvoiceSend($order_id));
                // return view('invoice.invoice');


            //    Cart::where('customer_id',Auth::guard('customerlogin')->id())->delete();
                return redirect()->route('order.success')->with('success', $request->name);
       }else if($request->payment_method == 2){
       echo "ssl";
       }else{
        echo "stripe";
       }

    }
    function order_success(){
        return view('order_success');
    }

}