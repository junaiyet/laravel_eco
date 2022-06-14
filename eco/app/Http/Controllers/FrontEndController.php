<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Inventory;
use Illuminate\Http\Request;
use App\Models\Product;
class FrontEndController extends Controller
{
    //
    function welcome(){

        $all_product = Product::simplePaginate(6);
        $new_arrivals = Product::latest()->take(4)->get();
        $top_category = Category::take(4)->get();
        return view('frontend.index',[
            'all_product'=>$all_product,
            'new_arrivals'=>$new_arrivals,
            'top_category'=>$top_category,
        ]);
    }

    function product_details($slug){
        $product_details = Product::where('slug',$slug)->get();
        $product_id = $product_details->first()->id;
        $category_id = $product_details->first()->category_id;
        $related_product = Product::where('category_id', $category_id)->where('id','!=', $product_id)->get();

        $availavle_colors = Inventory::where('product_id', $product_id)->SelectRaw('color_id, count(*) as total ')->groupBy('color_id')->get();
        return view ('frontend.product_details',[
            'product_details' => $product_details,
            'availavle_colors' => $availavle_colors,
            'related_product' => $related_product,
        ]);
    }
    function getsize(Request $request){

        $sizes = Inventory::where('product_id', $request->product_id)->where('color_id', $request->color_id)->get();
        $str = '<option>Choose A Option</option>';
        foreach($sizes as $size){
            $str .= '<option value=" '.$size->size_id.' ">'.$size->rel_to_size->size_name.'</option>';
        }
         echo $str;

    }

}