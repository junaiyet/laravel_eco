@extends('frontend.master')




@section('content')
<div class="breadcrumb_section">
    <div class="container">
        <ul class="breadcrumb_nav ul_li">
            <li><a href="index.html">Home</a></li>
            <li>Order Confirmed</li>
        </ul>
    </div>
</div>




<div class="container">
    <div class="row">
        <div class="col-md-6 mx-auto my-5 text-center">
                  <div class="card">
                    <div class="card-header bg-success">
                        <h3 class="text-white">Order Confirm Message</h3>
                    </div>
                    <div class="card-body">
                        <h5 class="text-info">Thank you Sir/Mam, {{ session('success')}} for purchasig our product</p>
                    </div>
                  </div>
        </div>
    </div>
</div>

@endsection
