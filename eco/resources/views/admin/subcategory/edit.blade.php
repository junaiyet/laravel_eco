@extends('layouts.dashboard')


@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Update Subcategory</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('subcategory.update') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="mt-4">
                            <label for="" class="">Sub Category N
                                <input type="hidden" class="form-control" name="subcategory_id" value="{{$subcatagory_info->id}}">

                            <input type="text" class="form-control" name="subcategory_name" value="{{$subcatagory_info->subcategory_name}}">
                            @error('subcategory_name')
                                <strong class="text-danger">{{ $message }}</strong>
                            @enderror
                        </div>
                        <div class="mt-4">
                            <img id="pic"  width="100" src="{{asset('uploads/subcategory/')}}/{{$subcatagory_info->subcategory_image}}" alt="">
                            <input type="file"  oninput="pic.src=window.URL.createObjectURL(this.files[0])" class="form-control" name="subcategory_image" value="">

                        </div>
                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary" >Update Category</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
