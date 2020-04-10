<div class="products-area">
    <div class="container">
        <div class="products">
            <div class="row">
                <div class="col-md-3">
                    <div class="product-menu">
                        <div class="menu-title">
                            <h2>Giày <strong>Thể thao</strong></h2>
                        </div>
                        <div class="side-menu">
                            <!-- Nav tabs -->
                            <ul class="tab-navigation" role="tablist">
                                <li><a href="#" id="all-type">Tất cả</a></li>
                                @foreach($type as $item)
                                    <li data-id="{{ $item->id }}" class="product-type" role="presentation">
                                        <a href="javascrip:void()">{{ $item->name  }}</a>
                                    </li>
                                @endforeach
                                <li><img src="img/banner/banner-5.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                </div>
                @if(isset($productsBySprort))
                    <div class="all-product">
                        <div class="col-md-9">
                            <div class="row list-by-type">
                                @foreach($productsBySprort as $item)
                                    <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="level-pro-new">
                                                <span>Sport</span>
                                            </div>
                                            <div class="product-img">
                                                <a href="/san-pham/{{$item->id}}">
                                                    <img src="img/{{ $item->product_image }}" alt=""
                                                         class="primary-img">
                                                </a>
                                            </div>
                                            <div class="product-name">
                                                <a href="/san-pham/{{$item->id}}">{{ $item->name }}</a>
                                            </div>
                                            <div class="price-rating">
                                                @if(isset($item->price_sale))
                                                    <span class="old-price">{{ number_format($item->price) }} đ</span>
                                                    <span>{{ number_format($item->price_sale) }} đ</span>
                                                    @else
                                                    <span>{{ number_format($item->price) }} đ</span>
                                                    @endif
                                            </div>
                                            <div class="actions">
                                                <a href="/san-pham/{{$item->id}}">
                                                    <button type="submit" class="cart-btn" title="Add to cart">Thêm vào giỏ
                                                    </button>
                                                </a>
                                                <ul class="add-to-link">
                                                    <li><a class="modal-view" data-target="#productModal"
                                                           data-toggle="modal" href="#"> <i
                                                                class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    @else
                    <div class="col-md-9">
                        <div class="row all-type-null">

                        </div>
                    </div>
                @endif
                <div class="col-md-9 sub-list">
                    <div class="row list-by-type">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .single-product .product-img {
        width: 250px;
        min-height: 250px;
        object-fit: cover;
    }

    .single-product .product-img img {
        width: 100%;
    }
</style>
