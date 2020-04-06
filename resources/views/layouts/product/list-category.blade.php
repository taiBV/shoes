
@extends('layouts.main')
@section('content')
    <div class="product-banner">
        <img src="/img/product/banner.jpg" alt="">
    </div>
    <!-- product items banner end -->
    <!-- product main items area start -->
    <div class="product-main-items">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="location">
                        <ul>
                        <ul>
                        <li><a href="/" title="go to homepage">Về trang chủ<span>/</span></a></li>
                            <li><strong>{{$name}}</strong></li>
                        </ul>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                @include('layouts.product.sidebar')
                <div class="col-sm-9">
                    <div class="product-bar">
                        <ul class="product-navigation" role="tablist">
                            <li role="presentation" class="active gird">

                                <a href="#gird" aria-controls="gird" role="tab" data-toggle="tab">
                                        <span>
                                            <img class="primary" src="/img/product/grid-primary.png" alt="">
                                        </span>
                                    Lưới
                                </a>
                            </li>
                            <li role="presentation" class="list">
                                <a href="#list" aria-controls="list" role="tab" data-toggle="tab">
                                        <span>
                                            <img class="primary" src="/img/product/list-primary.png" alt="">
                                        </span>
                                    Danh sách
                                </a>
                            </li>
                        </ul>
                      
                    </div>
                    <div class="row">
                        <div class="product-content">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active fade in home2" id="gird">
                                    @foreach($products as $item)
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="single-product">
                                                <div class="product-img" style="width: 260px;height: 260px;object-fit: cover">
                                                    <a href="/san-pham/{{$item->id}}">
                                                        <img style="width: 100%" src="/img/{{$item->product_image}}" alt="" class="primary-img">
                                                    </a>
                                                </div>
                                                <div class="actions">
                                                    <a href="/san-pham/{{$item->id}}">
                                                        <button type="button" class="cart-btn" title="Add to cart">Thêm vào giỏ</button>
                                                    </a>
                                                    <ul class="add-to-link">
                                                    <li><a class="modal-view" data-target="#productModal" data-toggle="modal" href="/san-pham/{{$item->id}}"> <i class="fa fa-search"></i></a></li>
                                                        <li><a href="/san-pham/{{$item->id}}"> <i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="/san-pham/{{$item->id}}"> <i class="fa fa-refresh"></i></a></li>
                                                    </ul>

                                                </div>
                                                <div class="product-price">
                                                    <div class="product-name">
                                                        <a href="/san-pham/{{$item->id}}" title="Fusce aliquam">{{$item->name}}</a>
                                                    </div>
                                                    <div class="price-rating">
                                                        @if(isset($item->price_sale))
                                                            <span class="old-price">{{ number_format($item->price) }} đ</span>
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
                                <div role="tabpanel" class="tab-pane fade home2" id="list">
                                    <div class="product-catagory">
                                        @foreach($products as $item)
                                            <div class="single-list-product">
                                                <div class="col-sm-4">
                                                    <div style="width: 260px;height: 260px;object-fit: cover" class="list-product-img">
                                                        <a href="/san-pham/{{$item->id}}">
                                                            <img width="100%" src="/img/{{$item->product_image}}" alt="">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-sm-8">
                                                    <div class="list-product-info">
                                                        <a href="/san-pham/{{$item->id}}" class="list-product-name"> {{$item->name}}</a>
                                                        <div class="price-rating">
                                                        @if(isset($item->price_sale))
                                                        <span class="old-price">{{ number_format($item->price) }} đ</span>
                                                        <span>{{ number_format($item->price_sale) }} đ</span>
                                                        @else
                                                            <span>{{ number_format($item->price) }} đ</span>
                                                        @endif
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
                                                        <div class="list-product-details">
                                                            <p>{{$item->excerpt}}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 text-center">
                            {{ $products->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
