@extends('layouts.main')
@section('css')
    <link rel="stylesheet" href="/css/comment.css">
    <style>
        div.select-size{
            padding-left: 50px !important;
        }
        .select-opt{
            padding-left: 20px !important;
            padding-top: 0 !important;;
            margin-top: 0 !important;;
            text-align: left !important;
            border: unset !important;
        }
        .select-opt ul li a{
            width: 60px !important;
            text-align: center !important;
        }
    </style>
@endsection

@section('content')
    <div class="Single-product-location home2">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="location">
                        <ul>
                            <li><a href="/" title="go to homepage">Về trang chủ<span>/</span></a></li>
                            <li><strong> {{$product->name}}</strong></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- single product area end -->
    <!-- single product details start -->
    <div class="single-product-details">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="single-product-img tab-content">
                        <div style="" class="single-pro-main-image tab-pane active">
                            <a href="#"><img style="width: 100%" class="" src="/img/{{$product->product_image}}"
                                            alt="optima"/></a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="single-product-details">
                        <a href="#" class="product-name" id="name"> {{$product->name }}</a>
                        @if(isset($product->price_sale))
                            <input type="text" id="price" value="{{$product->price_sale}}" style="display: none">
                          @else
                            <input type="text" id="price" value="{{$product->price}}" style="display: none">
                        @endif
                        <input type="text" id="img" value="{{$product->product_image}}" style="display: none">
                        <div class="list-product-info">
                            <div class="price-rating">
                                <div class="ratings">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half-o"></i>
                                    <a href="#" class="review">1 Review(s)</a>
                                </div>
                            </div>
                        </div>
                        <div class="avalable">
                            <h5>Mã sản phẩm : {{$product->sku}} </h5>
                        </div>
                        <div class="avalable">
                            <p>Hãng sản xuất:<span> {{ $type->name }}</span></p>
                        </div>
                        
                        <div class="item-price" style="display: flex">
                            @if(isset($product->price_sale))
                                <span class="old-price" style="padding-right: 20px"><strike>{{ number_format($product->price) }}</strike>  đ</span>
                                <span>{{ number_format($product->price_sale) }} đ</span>
                            @else
                                <span>{{ number_format($product->price) }} đ</span>
                            @endif
                        </div>

                        <div class="single-product-info">
                            <p>
                                {{ $product->exceprt }}
                            </p>
                            <div class="share">
                                <img src="/img/product/share.png" alt="">
                            </div>
                        </div>
                        <input type="hidden" name="_token" id="token" value="{{ csrf_token() }}">
                        <div class="select-catagory">
                            <div class="color-select">

                                <div class="input-box" style="display: flex">
                                    <h5 style="margin-top: 8px"><span style="color: red;padding-right: 10px">*</span>Màu sắc</h5>
                                    <div class="toolbar-bottom text-left select-opt pt-0 mt-0">
                                        <ul class="color" id="color">
                                            @foreach ($color as $item)
                                                <li value="{{ $item->color}}"><a
                                                        href="javascript:void(0)">{{ $item->color}}</a></li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="size-select">
                                <div class="input-box" style="display: flex">
                                    <h5 style="margin-top: 8px"><span style="color: red;padding-right: 10px">*</span>Size</h5>
                                    <div class="toolbar-bottom text-left select-opt select-size">
                                        <ul class="size" id="size">
                                            @foreach ($size as $item)
                                                <li value="{{ $item->size}}"><a
                                                        href="javascript:void(0)">{{ $item->size}}</a></li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                        <div class="cart-item">
                            <div class="single-cart">
                                <div class="cart-plus-minus">
                                    <label>SL: </label>
                                    <input id="qty" class="cart-plus-minus-box" type="text" name="qtybutton" value="1" min="1" max="50">
                                </div>
                                <button data-id="{{ $product->id }}" id="cartadd" class="cart-btn">Thêm vào giỏ</button>
                            </div>
                        </div>
                        <p style="font-weight:600">
                            Tóm tắt : <span style="font-weight:300">{{ $product-> excerpt}}</span>
                            </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- single product details end -->
    <!-- single product tab start -->
    <div class="single-product-tab-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="single-product-tab">
                        <ul class="single-product-tab-navigation" role="tablist">
                            <li role="presentation" class="active"><a href="#tab1" aria-controls="tab1" role="tab"
                                                                      data-toggle="tab">Mô tả</a>
                            </li>
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content single-product-page">
                            <div role="tabpanel" class="tab-pane fade in active" id="tab1">
                                <div class="single-p-tab-content">
                                    <p>{{$product->description}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{{--    comment--}}

   @include('layouts.comment')
    <!-- single product tab end -->
    <!-- upsell product area start-->
    <div class="upsell-product home2">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-title">
                        <h2>{{ $type->name }}</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="upsell-slider">
                    @foreach($other as $item)
                       <div class="col-md-12">
                        <div class="single-product">
                            <div class="product-img" style="width: 260px;height: 260px;object-fit: cover">
                                <a href="/san-pham/{{$item->id}}">
                                    <img style="width: 100%" src="/img/{{$item->product_image}}" alt="" class="primary-img">
                                </a>
                            </div>
                            <div class="list-product-info">
                                <div class="price-rating">
                                    <div class="ratings">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                        <a href="javascript:void(0)" class="review">1 đánh giá</a>
                                        <a href="/san-pham/{{$item->id}}" class="add-review">Xem chi tiết</a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-price">
                                <div class="product-name">
                                    <a href="/san-pham/{{$item->id}}" title="Fusce aliquam">{{$item->name}}</a>
                                </div>
                                <div class="price-rating">
                                    @if(isset($item->price_sale))
                                        <span class="old-price" style="padding-right: 20px"><strike>{{ number_format($item->price) }}</strike>  đ</span>
                                        <span>{{ number_format($item->price_sale) }} đ</span>
                                    @else
                                        <span>{{ number_format($item->price) }} đ</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                        @endforeach
                </div>
            </div>
        </div>
    </div>
    <!-- upsell product area end-->
    <!-- related product area start-->
    <div class="related-product home2">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-title">
                        <h2>Sản phẩm mới</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="upsell-slider">
                    @foreach($new_products as $item)
                        <div class="col-md-12">
                            <div class="single-product">
                                <div class="product-img" style="width: 260px;height: 260px;object-fit: cover">
                                    <a href="/san-pham/{{$item->id}}">
                                        <img style="width: 100%" src="/img/{{$item->product_image}}" alt="" class="primary-img">
                                    </a>
                                </div>
                                <div class="list-product-info">
                                    <div class="price-rating">
                                        <div class="ratings">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <a href="javascript:void(0)" class="review">1 đánh giá</a>
                                            <a href="/san-pham/{{$item->id}}" class="add-review">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-price">
                                    <div class="product-name">
                                        <a href="/san-pham/{{$item->id}}" title="Fusce aliquam">{{$item->name}}</a>
                                    </div>
                                    <div class="price-rating">
                                        @if(isset($item->price_sale))
                                            <span class="old-price" style="padding-right: 20px"><strike>{{ number_format($item->price) }}</strike>  đ</span>
                                            <span>{{ number_format($item->price_sale) }} đ</span>
                                        @else
                                            <span>{{ number_format($item->price) }} đ</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script src="/js/cart.js"></script>
    <script src="/js/comment.js"></script>
    <script src="/js/moment.js"></script>
@endsection

