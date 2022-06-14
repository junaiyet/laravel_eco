
@extends('layouts.dashboard')


@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h3>Inventory List  <strong class="text-danger"> {{ $product_info->product_name }}</strong></h3>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Sl</th>
                                <th>Color Name</th>
                                <th>Size Name</th>
                                <th>Quantity</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        {{-- rel_to_color --}}
                        <tbody>
                            @foreach ($inventories as $kay=> $inventory)
                            <tr>
                            <td>{{ ++$kay }}</td>
                            <td>

                                @if($inventory->rel_to_color->color_name == 'NA')
                                NA
                                @else
                                <span class="badge " style="background-color:{{ $inventory->rel_to_color->color_code }} ;color:transparent"> Lorem</span>
                                @endif
                            </td>
                
                            <td>{{  $inventory->rel_to_size->size_name}}</td>
                            <td>{{  $inventory->quantity}}</td>
                            <td><a href="" class="btn btn-danger">Delete</a></td>

                            </tr>

                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h3>Add Inventory</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('add.inventory') }}" method="POST">
                        @csrf
                        <div class="mt-3">
                            <input type="hidden" class="form-control" readonly name="product_id" value="{{ $product_info->id }}">
                            <input type="text" class="form-control" readonly value="{{ $product_info->product_name }}">
                        </div>
                        <div class="mt-3">
                            <select name="color_id" class="form-control">
                                <option value="">-- Select Color</option>
                                    @foreach ($color_info as $color)
                                    <option value="{{ $color->id }}">{{  $color->color_name }}</option>
                                    @endforeach
                            </select>
                        </div>
                        <div class="mt-3">
                            <select name="size_id" class="form-control">
                                <option value="">-- Select Size</option>
                                @foreach ($size_info as $size)
                                <option value="{{ $size->id }}">{{  $size->size_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="mt-3">
                            <input type="text" class="form-control" name="quantity" placeholder="Quantity">
                        </div>
                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary">Add Inventory</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
