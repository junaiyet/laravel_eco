@extends('layouts.dashboard')


@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8">
                  <div class="card">
                      <div class="card-header">
                          <h2>Color List</h2>
                      </div>
                      <div class="card-body">
                          <table class="table table-bordered">
                              <thead>
                                <tr>
                                    <th>Sl</th>
                                    <th>Color Name</th>
                                    <th>Color</th>
                                    <th>Created At</th>
                                    <th>Action</th>
                                </tr>
                              </thead>
                              <tbody>
                                  @foreach ($color_info as $key => $color)

                                  <tr>
                                      <td>{{ ++$key }}</td>
                                      <td>{{ $color->color_name }}</td>
                                      <td><span class="badge " style="background-color:{{ $color->color_code }} ;color:transparent"> Lorem</span> </td>
                                      <td>{{ $color->created_at->diffForHumans() }}</td>
                                      <td>
                                          <a href="" class="btn btn-danger">Delete</a>
                                      </td>
                                    </tr>
                                    @endforeach

                              </tbody>

                          </table>
                      </div>
                  </div>
                    <div class="card mt-5">
                      <div class="card-header">
                          <h2>Size List</h2>
                      </div>
                      <div class="card-body">
                          <table class="table table-bordered">
                              <thead>
                                <tr>
                                    <th>Sl</th>
                                    <th>Size Name</th>
                                    {{-- <th>Size</th> --}}
                                    <th>Action</th>
                                </tr>
                              </thead>
                              <tbody>
                                  @foreach ($size_info as $key => $size)

                                  <tr>
                                      <td>{{ ++$key }}</td>
                                      <td>{{ $size->size_name }}</td>
                                      {{-- <td>{{ $size->size }}</td> --}}

                                      <td>
                                          <a href="" class="btn btn-danger">Delete</a>
                                      </td>
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
                    <h3>Add Color</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('add.color') }}" method="POST">
                        @csrf
                        <div class="mt-3">
                            <label for ="" class="form-label">Color Name</label>
                            <input type="text" class="form-control" name="color_name">
                        </div>
                        <div class="mt-3">
                            <label for ="" class="form-label">Color Code</label>
                            <input type="text" class="form-control" name="color_code">
                        </div>
                           <div class="mt-3">
                            <button type="submit" class="btn btn-primary"> Add Color</button>

                        </div>
                    </form>
                </div>
            </div>
             <div class="card mt-5">
                <div class="card-header">
                    <h3>Add Size</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('add.size') }}" method="POST">
                        @csrf
                        <div class="mt-3">
                            <label for ="" class="form-label">Size Name</label>
                            <input type="text" class="form-control" name="size_name">
                        </div>

                           <div class="mt-3">
                            <button type="submit" class="btn btn-primary"> Add Size</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
