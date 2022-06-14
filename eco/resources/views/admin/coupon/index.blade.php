@extends('layouts.dashboard')



@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Coupon List</div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Name</th>
                                <th>Type</th>
                                <th>Amount</th>
                                <th>Validdity</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($coupons as $kay=>$coupon)

                            <tr>
                                <td>{{$kay++}}</td>
                                <td>{{ $coupon->coupon_name}}</td>
                                <td>{{ $coupon->type}}</td>
                                <td>{{ $coupon->amount}}</td>
                                <td>{{ $coupon->validity}}</td>
                                <td><a href="" class="btn btn-{{ $coupon->status == 0? 'secondary':'success'}}">{{ $coupon->status == 0? 'Deactive':'Active'}}</a></td>
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
                    <h3>Add Coupon</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('coupon.store') }}" method="POST">
                        @csrf
                        <div class="mt-3">
                            <label  class="form-label">Coupon Name</label>
                            <input type="text" class="form-control"  name="coupon_name">
                        </div>
                        <div class="mt-3">
                            <label  class="form-label">Coupon Type</label>
                            <select name="type" class="form-control">
                                <option value="1">Percentage</option>
                                <option value="2">Fixed Amount</option>
                            </select>
                        </div>
                        <div class="mt-3">
                            <label  class="form-label">Discount Amount</label>
                            <input type="text" class="form-control"  name="amount">
                        </div>
                        <div class="mt-3">
                            <label  class="form-label">Validitty</label>
                            <input type="date" class="form-control"  name="validity">
                        </div>
                          <div class="mt-3">
                            <label  class="form-label">Maximum</label>
                            <input type="text" class="form-control"  name="max">
                        </div>
                           <div class="mt-3">
                            <label  class="form-label">Minimum</label>
                            <input type="text" class="form-control"  name="min">
                        </div>


                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary">Add Coupon</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
