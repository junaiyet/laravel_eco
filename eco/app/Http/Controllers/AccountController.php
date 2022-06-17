<?php

namespace App\Http\Controllers;


use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use PDF;
class AccountController extends Controller
{
    //

   function account(){

   $order_infos =  Order::where('customer_id', Auth::guard('customerlogin')->id())->get();
    return view('account',[
        'order_infos'=>$order_infos,
    ]);
   }

   function invoice_download( $order_id ){
    $data = [
        'order_id'=> $order_id,
    ];
    $pdf = PDF::loadView('invoice.download', $data);

    // return $pdf->download('eco_invoice.pdf');
    return $pdf->stream('eco_invoice.pdf');
   }


}