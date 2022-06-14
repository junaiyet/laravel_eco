@extends('layouts.dashboard')


@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Sl</th>
                        <th>Product Image</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Diccount</th>
                        <th>Diccount Price</th>
                        <th style="width: 200px">Short Discription</th>
                        {{-- <th style="width: 200px">Long Discription</th> --}}
                        <th>Category</th>
                        <th>SubCategory</th>
                        <th>Action</th>
                    </tr>

                </thead>
                <tbody>
                    @foreach ($products as $kay => $product )
                             <tr>
                                 <td>{{ $kay+1 }}</td>
                                 <td>
                                     <img width="50" src="{{asset('/uploads/product/')}}/{{$product->preview_image}}" >
                                    </td>


                                 <td>{{ $product->product_name }}</td>
                                 <td>{{ $product->product_price }} </td>
                                 <td>({{ $product->discount }}%)</td>
                                 <td>{{ $product->after_discount }} </td>
                                 <td>{{ $product->short_description }} </td>
                                 {{-- <td>{{ $product->long_description }} </td> --}}
                                 <td>{{ $product->rel_to_category->category_name }}</td>
                                 <td>{{ $product->rel_to_subcategory->subcategory_name }}</td>



                                 <td>

                                    <a href="{{ route('inventory',$product->id) }}" class="btn btn-success"><i class="fa fa-archive"></i></a>
                                    <a href="{{ route('product.edit',$product->id) }}" class="btn btn-info"><i class="fa fa-info-circle"></i></a>
                                    <a href="{{ route('product.delete',$product->id) }}" class="btn btn-danger"><i class="fa fa-trash-o" ></i>
                                    </a>

                                </td>
                             </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
