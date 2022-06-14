<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Image;

class SubCategoryController extends Controller {
    //
    function index() {
        $categories = Category::all();
        $subcategories = Subcategory::all();
        return view('admin.subcategory.index', [
            'categories' => $categories,
            'subcategories' => $subcategories,
        ]);
    }
    function store(Request $request) {

        if ($request->subcategory_image) {

            $request->validate([
                'category_id' => 'required',
                'subcategory_name' => 'required',
                'subcategory_image' => 'mimes:jpg,bmp,png',
                'subcategory_image' => 'file|max:100000',

            ]);
            // img /insert
            if (Subcategory::where('category_id', $request->category_id)->where('subcategory_name', $request->subcategory_name)->exists()) {
                 return back()->with('exist', 'subcategory name already exist in this category');


            } else {
                $subcatagory_id =  Subcategory::insertGetId([
                    'category_id' => $request->category_id,
                    'subcategory_name' => $request->subcategory_name,
                    'created_at' => Carbon::now(),

                ]);
                $subcategory_image = $request->subcategory_image;
                $extention = $subcategory_image->getClientOriginalExtension();
                $file_name = $subcatagory_id . '.' . $extention;
                Image::make($subcategory_image)->save(public_path('uploads/subcategory/' . $file_name));
                Subcategory::find($subcatagory_id)->update([
                    'subcategory_image' => $file_name,
                ]);
            }
        } else {

            $request->validate([
                'category_id' => 'required',
                'subcategory_name' => 'required',
                'subcategory_image' => 'mimes:jpg,bmp,png',
                'subcategory_image' => 'file|max:2024',

            ]);
            // img /insert
            if (Subcategory::where('category_id', $request->category_id)->where('subcategory_name', $request->subcategory_name)->exists()) {
                return back()->with('exist', 'subcategory name already exist in this category');


           }else{
      $subcatagory_id =     Subcategory::insert([
                'category_id' => $request->category_id,
                'subcategory_name' => $request->subcategory_name,
                'created_at' => Carbon::now(),

            ]);
           }

        }
        return back()->with('success', 'Category Added Successfully!');
    }
      function edit($subcategory_id){
              $subcatagory_info   = Subcategory::find($subcategory_id);
                return view('admin.subcategory.edit',[
                      'subcatagory_info'=>$subcatagory_info,
                ]);
      }

      function update(Request $request) {

        if($request->subcategory_image == ''){

            Subcategory::find($request->subcategory_id)->update([
                        'subcategory_name'=>$request->subcategory_name,
                        'added_by'=>Auth::id(),
                        'updated_at'=> Carbon::now(),
            ]);
            return redirect('/subcategory')->with('success', 'SubCategory Updated Successfully!');

        }else{
            $image = Subcategory::find($request->subcategory_id);
            if($image->subcategory_image == 'default.png'){

                $subcategory_img = $request->subcategory_image;
                $extension = $subcategory_img->getClientOriginalExtension();
                $file_name = $request->subcategory_id.'.'.$extension;
                Image::make($subcategory_img)->save(public_path('uploads/subcategory/'.$file_name));
                Subcategory::find($request->subcategory_id)->update([
                    'subcategory_image'=> $file_name,
                ]);
                return redirect('/subcategory')->with('success', 'SubCategory Updated Successfully!');

            }else{
                  $delet_from = public_path('uploads/subcategory/'.$image->subcategory_image);
                  unlink($delet_from);
                  $subcategory_img = $request->subcategory_image;
                  $extension = $subcategory_img->getClientOriginalExtension();
                  $file_name = $request->subcategory_id.'.'.$extension;
                  Image::make($subcategory_img)->save(public_path('uploads/subcategory/'.$file_name));
                  Subcategory::find($request->subcategory_id)->update([
                      'subcategory_image'=> $file_name,
                  ]);
                  return redirect('/subcategory')->with('success', 'SubCategory Updated Successfully!');

            }

        }
    }
    function delete($subcatagory_id) {
        Subcategory::find($subcatagory_id)->delete();
        return back();
    }
}
