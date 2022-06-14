<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\Subcategory;
use App\Models\Thumbnails;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Image;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    //

    function add_product()
    {
        $categories = Category::all();
        $subcategories = Subcategory::all();
        $products = Product::all();
        return view('admin.product.index', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'products' => $products,

        ]);
    }
    function getsubcategory(Request $request)
    {


        $subcategories = Subcategory::where('category_id', $request->category_id)->get();

        $str = '<option value="">-- Select SubCategory --</option>';

        foreach ($subcategories as $subcategory) {
            $str .= '<option value="' . $subcategory->id . '">' . $subcategory->subcategory_name . '</option>';
        }
        echo $str;
    }

    function store(Request $request)
    {
        $after_discount = round($request->product_price - ($request->product_price * $request->discount / 100));

        $request->validate([
            'product_name' => 'required',
            'product_price' => 'required',
            'preview_image' => 'mimes:jpg,bmp,png',
        ]);
        if ($request->preview_image) {
            $preview_image = $request->preview_image;
            $extension = $preview_image->getClientOriginalExtension();
            $file_name = Str::lower(Str::replace(' ', '-', $request->product_name)) . '-' . $request->category_id . '-' . $request->subcategory_id . '.' . $extension;

            Image::make($preview_image)->resize(680, 680)->save(public_path('uploads/product/' . $file_name));
        } else {
            $file_name = 'default.png';
        }
        $product_id = Product::insertGetId([
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'product_name' => $request->product_name,
            'product_price' => $request->product_price,
            'discount' => $request->discount,
            'after_discount' => $after_discount,
            'preview_image' => $file_name,
            'short_description' => $request->short_description,
            'long_description' => $request->long_description,
            'sku' => substr($request->product_name, 0, 4) . '-' . Str::random(5) . rand(0, 1000),
            'slug' => str_replace(' ', '-', Str::lower($request->product_name)) . '-' . rand(0, 100000),
            'created_at' => now(),
        ]);

        $sl = 1;
        $thumbnails_image = $request->thumbnails;
        foreach ($thumbnails_image as $thumbnails) {
            $extension = $thumbnails->getClientOriginalExtension();
            $thumbnails_name = $product_id . '-' . $sl . '.' . $extension;
            Image::make($thumbnails)->resize(680, 680)->save(public_path('uploads/product/thumbnails/' . $thumbnails_name));
            $sl++;
            Thumbnails::insert([
                'product_id' => $product_id,
                'thumbnails' => $thumbnails_name,
                'created_at' => Carbon::now(),
            ]);
        }
        return back()->with('success', 'Category Added Successfully!');
    }


    function view()
    {
        $categories = Category::all();
        $subcategories = Subcategory::all();
        $products = Product::all();
        return view('admin.product.view', [
            'categories' => $categories,
            'subcategories' => $subcategories,
            'products' => $products,
        ]);
    }

    function edit($product_id)
    {
        $product_info = Product::find($product_id);
        return view('admin.product.edit', [
            'product_info' => $product_info,
        ]);
    }

    function update(Request $request)
    {

        if ($request->preview_image == '') {
            $discount = $request->discount ? $request->discount : 0;
            if ($discount == 0) {
                $after_discount = '';
            } else {
                $after_discount = round($request->product_price - ($request->product_price * $discount / 100));
            };

            Product::find($request->product_id)->update([
                'product_name' => $request->product_name,
                'product_price' => $request->product_price,
                'discount' => $request->discount,
                'after_discount' => $after_discount,
                'short_description' => $request->short_description,
                'long_description' => $request->long_description,
                'update_at' => Carbon::now(),
            ]);
        } else {
            $image = Product::find($request->product_id);

            if ($image->preview_image == 'default.png') {
                $preview_image = $request->preview_image;
                $extension = $preview_image->getClientOriginalExtension();
                $file_name = Str::lower(Str::replace(' ', '-', $image->product_name)) . '-' . $image->category_id . '-' . $image->subcategory_id . '.' . $extension;
                Image::make($preview_image)->resize(680, 680)->save(public_path('uploads/product/' . $file_name));
                Product::find($request->product_id)->update([
                    'preview_image' => $file_name,
                ]);
            } else {

                $delte_form = public_path('uploads/product/' . $image->preview_image);
                unlink($delte_form);
                $preview_image = $request->preview_image;
                $extension = $preview_image->getClientOriginalExtension();
                $file_name = Str::lower(Str::replace(' ', '-', $image->product_name)) . '-' . $image->category_id . '-' . $image->subcategory_id . '.' . $extension;
                Image::make($preview_image)->resize(680, 680)->save(public_path('uploads/product/' . $file_name));

                Product::find($request->product_id)->update([
                    'preview_image' => $file_name,
                ]);

                //  return redirect('/product/view')->with('success', 'SubCategory Updated Successfully!');


            }
        }
    }
    function delete($product_id)
    {

        Product::find($product_id)->delete();
        return back();
    }
}