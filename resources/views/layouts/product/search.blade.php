
@extends('layouts.main')
@section('content')
<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <li><a href="index.html">Home</a></li>
                <li class="active">New Products</li>
            </ol>
        </div>
    </div>
</div>
<!--end-breadcrumbs-->
<!--start-product--> 
<div class="product">
    <div class="container">
        <div class="product-main">
            <div class="title-sh" style="margin-bottom:30px">
          <span> Tìm thấy  {{ $count}} sản phẩm</span>
            </div>
            <div class="col-md-9 p-left">
            <div class="product-one">
                @foreach ($product as $item)
                    <div style="margin-top:30px" class="col-md-4 product-left single-left"> 
                        <div class="p-one simpleCart_shelfItem">
                            <a href="/san-pham/{{ $item->id}}">
                                <img src="/images/shoes-1.png" alt="" />
                                    <div class="mask mask1">
                                        <span>Chi tiết</span>
                                    </div>
                                </a>
                            <h4><a href="/san-pham/{{ $item->id}}">{{ $item->name}}</a></h4>
                            <p><a class="item_add" href="#"><i></i> <span class=" item_price">{{ number_format($item->price) }}</span>đ</a></p>
                        </div>
                    </div>
                @endforeach
             

            <div class="clearfix"> </div>
            <div style="text-align:center;margin-top:30px">
                <div> {{$product->links()}}</div>
             </div> 
        </div>
        </div>
        @include('layouts.product.sidebar')
    </div>
</div>
</div>
@endsection
