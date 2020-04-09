@extends('layouts.main')
@section('content')
    <link rel="stylesheet" href="/css/modal.css">
    <div class="shopping-cart">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="location">
                        <ul>
                            <li><a href="/" title="go to homepage">Trang chủ<span>/</span></a></li>
                            <li><strong> Giỏ hàng</strong></li>
                        </ul>
                    </div>
                </div>
            </div>
            @if (Session::has('notifi'))
                <div class="alert alert-success">{{Session::get('notifi')}}</div>
                <div class="single-cart">
                    <button class="cart-btn">Về trang chủ</button>
                </div>
            @else

                @if(Cart::getTotalQuantity() > 0)
                    <div class="row ckeckout">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table-bordered table table-hover">
                                    <thead>
                                    <tr>
                                        <th class="cart-item-img"></th>
                                        <th class="cart-product-name">Tên sản phẩm</th>
                                        <th class="unit-price">Unit Price</th>
                                        <th class="quantity">Qty</th>
                                        <th class="quantity">Size</th>
                                        <th class="quantity">Màu</th>
                                        <th class="remove-icon"></th>
                                    </tr>
                                    </thead>
                                    <tbody class="text-center">
                                    <input type="hidden" name="_token" id="token" value="{{ csrf_token() }}">
                                    @foreach ( Cart::getContent() as $item)
                                        <tr>
                                            <td class="cart-item-img">
                                                <a href="single-product.html">
                                                    <img style="width: 60px;height: 60px;object-fit: cover"
                                                         src="img/{{ $item ->attributes->img }}" alt="">
                                                </a>
                                            </td>
                                            <td class="cart-product-name">
                                                <a href="/san-pham/{{$item->id}}">{{ $item ->name }}</a>
                                            </td>
                                            <td class="unit-price">
                                                <span>{{ number_format($item ->price) }} đ</span>
                                            </td>
                                            <td class="quantity">
                                            <span>
                                                <input disabled style="width:50px" data-id="{{ $item['id'] }}" class="qty"
                                                       type="number" min="1"
                                                       value="{{ $item->quantity }}">
                                               <i class="fas fa-pen-alt" style="padding-left: 15px;cursor: pointer" id="btnUpdate"></i>
                                            </span>
                                            </td>
                                            <td class="quantity">
                                                <span>{{ $item ->attributes->size }}</span>
                                            </td>
                                            <td class="quantity">
                                                <span>{{ $item ->attributes->color }}</span>
                                            </td>
                                            <td style="padding-top: 40px" data-id="{{ $item['id'] }}"
                                                class="remove-icon delete-item">
                                                <a href="#">
                                                    <img src="img/cart/btn_remove.png" alt="">
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>

                                </table>
                                <div class="shopping-button">
                                    <div class="continue-shopping">
                                        <button type="submit" data-toggle="modal" data-target="#myModal">Tiến hành đặt
                                            hàng
                                        </button>
                                    </div>
                                    <div class="shopping-cart-left">
                                       <a href="/products"> <button type="button">Tiếp tục mua hàng</button></a>
                                        <button id="deleteall" type="button">Xóa tất cả</button>
                                    </div>
                                </div>
                                <div class="shopping-button">
                                    <div class="shopping-cart-left">
                                        <div class="shopping-cart-left">

                                            <h3>Tổng : <span>

                                                    {{ number_format(Cart::getSubTotal() )}}

                                                    đ</span></h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="myModal" role="dialog">
                            <div style="width:fit-content;background-color: #f2f2f2;" class="row-modal">
                                <div class="col-75">
                                    <div class="container">
                                        <form method="POST" id="formBill" action="{{ route('confirm')}}">
                                            {{csrf_field()}}
                                            <div class="row-modal">
                                                <div class="col-50">
                                                    <h3>Thông tin khách hàng</h3>
                                                    <label for="fname"><i class="fa fa-user"></i> Họ Tên  <span style="color:red">*</span> </label>
                                                    <input type="text" id="name" name="name" placeholder="John M. Doe">
                                                <!-- @error('name')
                                                    <p style="color:red">{{ $message }}</p>
														@enderror -->
                                                    <label for="email"><i class="fa fa-envelope"></i> Email  <span style="color:red">*</span> </label>
                                                    <input type="text" id="email" name="email"
                                                           placeholder="john@example.com">
                                                <!-- @error('email')
                                                    <p style="color:red">{{ $message }}</p>
														@enderror -->
                                                    <label for="adr"><i class="fa fa-address-card-o"></i> Địa
                                                        chỉ  <span style="color:red">*</span> </label>
                                                    <input type="text" id="address" name="address"
                                                           placeholder="542 W. 15th Street">

                                                    <label for="phone"><i class="fa fa-phone" aria-hidden="true"></i>
                                                        Điện thoại  <span style="color:red">*</span> </label>
                                                    <input type="text" id="phone" name="phone" placeholder="New York">

                                                    <label for="note"><i class="fa fa-sticky-note-o"
                                                                         aria-hidden="true"></i> Ghi chú</label>
                                                    <input type="text" id="note" name="note"
                                                           placeholder="Để lại lời nhắn">
                                                </div>

                                                <div class="col-25">
                                                    <h4>Đơn hàng <span class="price" style="color:black"><i
                                                                class="fa fa-shopping-cart"></i> <b>{{ Cart::getTotalQuantity() }}</b></span>
                                                    </h4>
                                                    @foreach ( Cart::getContent() as $item)
                                                        <p><a href="#">{{ $item->name }}</a> <span
                                                                class="price">{{ $item ->quantity }}</span></p>
                                                    @endforeach
                                                    <p style="font-weight:bold">Tổng <span class="price"
                                                                                           style="color:black"><b>{{ number_format(Cart::getSubTotal() )}} đ</b></span>
                                                    </p>
                                                </div>

                                            </div>
                                            <label style="color:red;margin-top:10px">
                                                * Lưu ý : Trường có dấu * là bắt buộc
                                            </label>
                                            <br>
                                            <div class="row" style="display: flex">
                                                <button type="submit" class="btn btn-success confirm">Xác nhận đặt
                                                    hàng
                                                </button>
                                                <button style="height:40px;width: 70px;margin-right: 20px" type="button"
                                                        class="btn btn-default" data-dismiss="modal">X
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                        @else
                            <div class="alert alert-info">
                                Bạn chưa có sản phẩm nào trong giỏ.
                            </div>
                            <div style="text-align:center;padding-top:30px">
                                <a href="http://">
                                    <div class="single-cart">
                                        <button class="cart-btn">Mua hàng</button>
                                    </div>
                                </a>
                            </div>
                        @endif
                    </div>
                @endif
        </div>
    </div>

@endsection
<style>
    table th {
        text-align: center
    }
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
    .code-sale {
        width: 20%;
    }
    /*.btn-getCode{*/
    /*    display: none;*/
    /*}*/
</style>
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="/js/jquery.min.js"></script>
<script src="/js/sweetalert2@8.js"></script>
<script src="/js/cart.js"></script>

