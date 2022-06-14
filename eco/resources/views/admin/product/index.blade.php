@extends('layouts.dashboard')

@section('content')
<div class="container-fluid">
   <div class="card">
       <div class="card-header">
           <h2>Add Product</h2>
        </div>
       <div class="card-body">
           <form action="{{ route('product.store') }}" method="POST" enctype="multipart/form-data">
               @csrf
               <div class="row">
                   <div class="col-md-6">
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
                   </div>
                    <div class="col-md-6">
                       <div class="mt-5">
                          <input type="text" placeholder="Product Name" name="product_name" class="form-control">
                       </div>
                   </div>
                     <div class="col-md-6">
                       <div class="mt-5">
                          <input type="number" placeholder="Product Price" name="product_price" class="form-control">
                       </div>
                   </div>

                    <div class="col-md-6">
                       <div class="mt-5">
                          <input type="number" placeholder="Discount %" name="discount" class="form-control">
                       </div>
                   </div>
                    <div class="col-md-6">
                       <div class="mt-5">
                          <input type="text" placeholder="Short Description" name="short_description" class="form-control">
                       </div>
                   </div>
                      <div class="col-md-12">
                       <div class="mt-5">
                           <textarea id="summernote" placeholder="Long Description" name="long_description" class="form-control"></textarea>

                       </div>
                   </div>
                         <div class="col-md-6">
                       <div class="mt-5">
                           <label for="" class="label-form">Product Preview</label>
                          <input type="file" placeholder="Preview Image" name="preview_image" class="form-control">
                       </div>
                   </div>

                   <div class="col-md-6">
                       <div class="mt-5">
                           <label for="" class="label-form">Product Thumbnails</label>
                          <input type="file" multiple placeholder="Product Thumbnails" name="thumbnails[]" class="form-control">
                       </div>
                   </div>
                   <div class="col-md-12">
                       <div class="mt-5">
                                     <button class="btn btn-primary" type="submit">Add Product</button>
                       </div>
                   </div>
               </div>

           </form>
       </div>
   </div>


</div>

@endsection


@section('footer_script')

<script>
    $('#category_id').change(function(){
        var category_id = $(this).val()

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $.ajax({
            type:'POST',
               url:'/getsubcategory',
               data:{'category_id':category_id},
               success:function(data) {
                  $('#subcategory_id').html(data);
               }
        });

    })
</script>

<script>
$(document).ready(function() {
  $('#summernote').summernote();
});

</script>

@endsection
