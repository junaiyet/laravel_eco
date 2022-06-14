@extends('layouts.dashboard')


@section('content')


<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h2>Update Product</h2>
         </div>
        <div class="card-body">
            <form action="{{ route('product.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    {{-- <div class="col-md-6">
                        <div class="mt-5">
                            <select name="category_id" id="category_id" class="form-control">
                                <option value="">-- Select Category --</option>
                                @foreach ($categories as $category)

                                <option value="{{ $category->id }}">{{ $category->category_name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                      <div class="col-md-6">
                        <div class="mt-5">
                            <select name="subcategory_id" id="subcategory_id" class="form-control">
                                <option value="">-- Select SubCategory --</option>
                                @foreach ($subcategories as $subcategory)

                                <option value="{{ $subcategory->id }}">{{ $subcategory->subcategory_name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div> --}}
                     <div class="col-md-6">
                        <div class="mt-5">
                            <input type="hidden" class="form-control" name="product_id" value="{{$product_info->id}}">

                           <input type="text" placeholder="Product Name" name="product_name" class="form-control" value="{{ $product_info->product_name }}">
                        </div>
                    </div>
                      <div class="col-md-6">
                        <div class="mt-5">
                           <input type="number" placeholder="Product Price" name="product_price" class="form-control" value="{{ $product_info->product_price }}">
                        </div>
                    </div>

                     <div class="col-md-6">
                        <div class="mt-5">
                           <input type="number" placeholder="Discount %" name="discount" class="form-control" value="{{ $product_info->discount }}">
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="mt-5">
                           <input type="text" placeholder="Short Description" name="short_description" class="form-control" value="{{ $product_info->short_description }}">
                        </div>
                    </div>
                       <div class="col-md-12">
                        <div class="mt-5">
                            <textarea placeholder="Long Description" name="long_description" class="form-control"  >{{ $product_info->long_description }}</textarea>

                        </div>
                    </div>
                          <div class="col-md-6">
                        <div class="mt-5">
                            <img id="pic"  width="100" src="{{asset('uploads/product/')}}/{{$product_info->preview_image}}" >

                           <input type="file"  oninput="pic.src=window.URL.createObjectURL(this.files[0])" placeholder="Preview Image" name="preview_image" class="form-control">
                        </div>
                    </div>


                    <div class="col-md-12">
                        <div class="mt-5">
                                      <button class="btn btn-primary" type="submit">Update Product</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>

@endsection
