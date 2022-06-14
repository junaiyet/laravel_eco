<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Coupon;
use App\Models\Inventory;
use Carbon\Carbon;
use Illuminate\Http\Request;

use Auth;

class CartController extends Controller
{
    //

    function cart_store(Request $request){
        $request->validate([
            'color_id' => 'required',
            'size_id' => 'required',


        ]);
    $quantity  =  Inventory::where('product_id', $request->product_id)->where('color_id', $request->color_id)->where('size_id', $request->size_id)->first()->quantity;


        if(Auth::guard('customerlogin')->check()){
            if($quantity > $request->quantity ){

                if (Cart::where('customer_id', Auth::guard('customerlogin')->id())->where('product_id', $request->product_id)->where('color_id', $request->color_id)->where('size_id', $request->size_id)->exists()) {

                    Cart::where('customer_id', Auth::guard('customerlogin')->id())->where('product_id', $request->product_id)->where('color_id', $request->color_id)->where('size_id', $request->size_id)->increment('quantity', $request->quantity);

                    return back()->with('cart_added', 'Item has beed added');
                }else{
                    Cart::insert([
                        'customer_id'=>Auth::guard('customerlogin')->id(),
                        'product_id'=>$request->product_id,
                        'color_id'=>$request->color_id,
                        'size_id'=>$request->size_id,
                        'quantity'=>$request->quantity,
                        'created_at'=>Carbon::now(),


                   ]);
                   return back()->with('cart_added', 'Item has beed added');
                }
            }else{
                return back()->with('stock', 'Stock Out ');

            }
          }else{
            return redirect()->route('customer.register.login')->with('login', 'Please Login to add to cart ');

          }

    }


    function cart_remove($cart_id){
        Cart::find($cart_id)->delete();


        return back();

    }

    function cart(Request $request){

        $carts = Cart::where('customer_id', Auth::guard('customerlogin')->id())->get();
        $cart_total = 0;
        $coupon_code = $request->coupon;
        $message = null;
        $discount = null;
        $type = null;

         if ( $coupon_code == '') {
            $discount = 0;
         }else{
            foreach($carts as $cart ){
                $cart_total += $cart->rel_to_product->after_discount * $cart->quantity;
            }


            if (Coupon::where('coupon_name', $coupon_code)->where('status', 1)->exists()) {
                    if (Coupon::where('coupon_name', $coupon_code)->first()->validity > Carbon::today()) {

                        $min = Coupon::where('coupon_name', $coupon_code)->first()->min;
                        $max = Coupon::where('coupon_name'  , $coupon_code)->first()->max;

                        if ($cart_total > $min &&  $cart_total < $max) {
                            $discount = Coupon::where('coupon_name', $coupon_code)->first()->amount;
                            $type = Coupon::where('coupon_name', $coupon_code)->first()->type;

                        }else{
                            $discount = 0;
                            $message = ' Minimum  Amount '.$min;
                        }
                    }else{
                        $discount = 0;
                        $message = ' Coupon Code Has Been Expired';
                    }
            }else{
                $discount = 0;
                $message = 'Invalid  Coupon Code';

            }
         }



        return view('frontend.cart',[

            'carts'=>$carts,
            'message'=>$message,
            'discount'=>$discount,
            'type'=>$type,

        ]);
    }
   function cart_update(Request $request){

      foreach($request->quantity as $cart_id=>$quantity){
        Cart::find($cart_id)->update([
            'quantity'=> $quantity,
        ]);
      }
      return back();

   }



}
