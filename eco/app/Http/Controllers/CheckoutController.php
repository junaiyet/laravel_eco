<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Country;
use App\Models\City;
use Auth;
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


        print_r($request->all());

    }

}
