<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use Illuminate\Http\Request;
use Carbon\Carbon;

class CouponController extends Controller
{
    //



    function add_coupon(){
        $coupons = Coupon::all();
        return view('admin.coupon.index',[
            'coupons'=>$coupons,
        ]);
    }

    function coupon_store(Request $request){

        Coupon::insert([
            'coupon_name'=> $request->coupon_name,
            'type'=> $request->type,
            'amount'=> $request->amount,
            'validity'=> $request->validity,
            'max'=> $request->max,
            'min'=> $request->min,
            'created_at'=> Carbon::now(),
        ]);
        return back();
    }
}