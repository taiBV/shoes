<header>
    <div class="top-link">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-md-offset-3 col-sm-9 hidden-xs">
                    <div class="site-option">
                        <ul>
                            <li class="currency"><a href="javascript:void(0)">VND <i class="fa fa-angle-down"></i> </a>
                               
                            </li>
                            <li class="language"><a href="javascript:void(0)">Hà Nội<i class="fa fa-angle-down"></i> </a>
                                
                            </li>
                        </ul>
                    </div>
                    <div class="call-support">
                        <p>Tư vấn miễn phí: <span> 032 691 3212</span></p>
                    </div>
                </div>
                <div class="col-md-2 col-sm-3">
                    <div class="dashboard">
                        <div class="account-menu">
                            <ul>
                                <li>
                                    <a href="#" class="icon-db">
                                        <i class="fa fa-bars"></i>
                                    </a>
                                    <ul class="list-menu">
                                        <li><a href="my-account.html">my account</a></li>
                                        <li><a href="wishlist.html">my wishlist</a></li>
                                        <li><a href="cart.html">my cart</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="blog.html">Blog</a></li>
                                        <li><a href="#">Log in</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div id="cart-total" class="cart-menu">
                                <ul>
                                    <li>
                                        @if(Cart::getTotalQuantity()>0)
                                        <a href="#" class="icon-db"> <img src="/img/icon-cart.png" alt="">
                                            <span>{{ Cart::getTotalQuantity() }}</span>
                                        </a>
                                        <div class="cart-info">
                                            <ul class="list-menu">
                                                @foreach( Cart::getContent() as $item)
                                                    <li class="list-item">
                                                        <div class="cart-img">
                                                            <img style="width:60px;max-width:60px" src="/img/{{ $item ->attributes->img }}" alt="">
                                                        </div>
                                                        <div class="cart-details">
                                                            <a href="/san-pham/{{$item->id}}">{{ $item->name  }}</a>
                                                            <p>{{ $item->quantity  }} x {{ number_format($item->price) }}
                                                                đ</p>
                                                        </div>
                                                    </li>
                                                @endforeach
                                            </ul>
                                            <h3>Tổng : <span> {{ number_format(Cart::getSubTotal()) }}</span></h3>
                                            <a href="/gio-hang" class="checkout">Giỏ hàng</a>
                                        </div>
                                            @else
                                            <a href="#" class="icon-db"> <img src="/img/icon-cart.png" alt="">
                                            </a>
                                            <div class="cart-info">
                                                <p style="color:#fff;text-align: center;font-size: 17px">Giỏ hàng rỗng</p>
                                            </div>
                                        @endif
                                    </li>
                                </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mainmenu-area product-items">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="logo">
                        <a href="/">
                            <img src="/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="mainmenu">
                        <nav>
                            <ul>
                                <li><a href="/">Trang chủ</a>
                                </li>
                                <li class="mega-women"><a href="/products">Sản phẩm</a>
                                    <div class="mega-menu women">
                                        <div class="part-1">
                                            @foreach($category as $item)
                                                <span>
                                                        <a href="#">{{ $item->name }}</a>
                                                        @foreach($item->producttypes as $item)
                                                        <a href="/hang-san-xuat/{{$item->id}}">{{ $item->name }}</a>
                                                    @endforeach
                                                    </span>
                                            @endforeach
                                        </div>
                                        <div class="part-2">
                                            <a href="#">
                                                <img src="/img/banner/menu-banner.png" alt="">
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li><a href="#">Giới thiệu</a></li>
                                <li><a href="#">Tin tức</a>
                                </li>
                                <li><a href="#">Chính sách mua hàng</a></li>
                                <li><a href="#">Liên hệ</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="mobile-menu">
                        <nav>
                            <ul>
                                <li><a href="index.html">Home</a>
                                    <ul>
                                        <li><a href="index.html">Home 1</a></li>
                                        <li><a href="index-2.html">Home 2</a></li>
                                    </ul>
                                </li>
                                <li><a href="shop.html">Women</a>
                                    <ul>
                                        <li><a href="#">Dresses</a>
                                            <ul>
                                                <li><a href="#">Coctail</a></li>
                                                <li><a href="#">day</a></li>
                                                <li><a href="#">evening</a></li>
                                                <li><a href="#">sports</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">shoes</a>
                                            <ul>
                                                <li><a href="#">Sports</a></li>
                                                <li><a href="#">run</a></li>
                                                <li><a href="#">sandals</a></li>
                                                <li><a href="#">boots</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">handbags</a>
                                            <ul>
                                                <li><a href="#">Blazers</a></li>
                                                <li><a href="#">table</a></li>
                                                <li><a href="#">coats</a></li>
                                                <li><a href="#">kids</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">clothing</a>
                                            <ul>
                                                <li><a href="#">T-shirts</a></li>
                                                <li><a href="#">coats</a></li>
                                                <li><a href="#">Jackets</a></li>
                                                <li><a href="#">jeans</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="shop.html">Men</a>
                                    <ul>
                                        <li><a href="#">Bags</a>
                                            <ul>
                                                <li><a href="#">Bootees bag</a></li>
                                                <li><a href="#">Blazers</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">clothing</a>
                                            <ul>
                                                <li><a href="#">coats</a></li>
                                                <li><a href="#">T-shirts</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Lingerie</a>
                                            <ul>
                                                <li><a href="#">Bands</a></li>
                                                <li><a href="#">Furniture</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="shop.html">Foorwear</a>
                                    <ul>
                                        <li><a href="#">footwear men</a>
                                            <ul>
                                                <li><a href="#">gifts</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">footwear women</a>
                                            <ul>
                                                <li><a href="#">boots</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="shop.html">Jewellery</a>
                                    <ul>
                                        <li><a href="#">Rings</a></li>
                                    </ul>
                                </li>
                                <li><a href="shop.html">Accessories</a></li>
                                <li><a href="#">Pages</a>
                                    <ul>
                                        <li><a href="about-us.html">About us</a></li>
                                        <li><a href="blog.html">Blog</a></li>
                                        <li><a href="blog-details.html">Blog Details</a></li>
                                        <li><a href="cart.html">Cart</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="contact.html">Contact</a></li>
                                        <li><a href="my-account.html">My account</a></li>
                                        <li><a href="shop.html">Shop</a></li>
                                        <li><a href="shop-list.html">Shop list</a></li>
                                        <li><a href="single-product.html">Single Shop</a></li>
                                        <li><a href="wishlist.html">Wishlist</a></li>
                                        <li><a href="login.html">login page</a></li>
                                        <li><a href="register.html">register page</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<style>
    li.list-item {
        display: flex;
    }

    li.list-item .cart-details a {
        text-align: left;
        margin-bottom: 10px;
    }

    .dashboard ul li {
        margin-bottom: 0;
        line-height: 20px;
    }

    .dashboard ul li a.icon-db {
        margin-top: 20px;
    }

    .dashboard .cart-info {
        margin-top: 15px;
    }

    .dashboard ul.list-menu {
        margin-top: 20px;
    }

    .cart-img {
        width: 60px;
        height: 60px;
    }

    .cart-img img {
        width: 100%;
    }
</style>
