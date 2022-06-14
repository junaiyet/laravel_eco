<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Color;
use App\Models\Inventory;
use App\Models\Size;
use Carbon\Carbon;

class InventoryController extends Controller
{
    //
    function inventory($product_id){
        $product_info = Product::find($product_id);
        $color_info = Color::all();
        $size_info = Size::all();
        $inventories = Inventory::where('product_id',$product_id)->get();
        return view('admin.product.inventory',[
              'product_info'=> $product_info,
              'color_info'=> $color_info,
              'size_info'=> $size_info,
              'inventories'=> $inventories,
            ]
        );
    }
    function variation(){
        $products = Product::all();
        $color_info = Color::all();
        $size_info = Size::all();
        return view('admin.product.add_variation',[
            'color_info'=> $color_info,
            'size_info'=> $size_info,
        ]);
    }
     function addcolor(Request $request){
       Color::insert([
           'color_name'=>$request->color_name,
           'color_code'=>$request->color_code,
           'created_at'=>Carbon::now(),
       ]);

             return back();
    }
     function addsize(Request $request){
        Size::insert([
           'size_name'=>$request->size_name,
           'created_at'=>Carbon::now(),
       ]);

             return back();
    }

function addinventory(Request $request){
    // return $request->all();
    if(Inventory::where('product_id',$request->product_id)->where('color_id',$request->color_id)->where('size_id',$request->size_id)->exists()){
        Inventory::where('product_id',$request->product_id)->where('color_id',$request->color_id)->where('size_id',$request->size_id)->increment('quantity',$request->quantity);
        return back();
    }
    else{

        Inventory::insert([
                 'product_id'=> $request->product_id,
                 'color_id'=> $request->color_id,
                 'size_id'=> $request->size_id,
                 'quantity'=> $request->quantity,
                 'created_at'=> Carbon::now(),
        ]);
        return back();
    }
}


}
