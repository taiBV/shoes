<div class="new-products-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Sản phẩm mới</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="new-product-slider">
                @foreach($products as $item)
                     <div class="col-md-12">
                    <div class="single-product">
                        <div class="level-pro-new">
                            <span>new</span>
                        </div>
                        <div class="product-img">
                            <a href="/san-pham/{{$item->id}}">
                                <img src="/img/{{$item->product_image}}" alt="" class="primary-img">
                            </a>
                        </div>
                        <div class="product-name">
                            <a href="/san-pham/{{$item->id}}">{{ $item->name  }}</a>
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
                                <button type="submit" class="cart-btn" title="Add to cart">add to cart</button>
                            </a>
                            <ul class="add-to-link">
                                <li><a class="modal-view" data-target="#productModal" data-toggle="modal" href="#"> <i class="fa fa-search"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>
