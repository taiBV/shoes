
@extends('layouts.main')
@section('content')
<link href="/css/product/detail.css" rel="stylesheet" type="text/css" media="all" />

<div class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-main">
            <ol class="breadcrumb">
                <li><a href="index.html">Home</a></li>
                <li class="active">Lorem Ipsum</li>
            </ol>
        </div>
    </div>
</div>
<!--end-breadcrumbs-->
<!--start-single-->
<div class="single contact">
    <div class="container">
        <div class="single-main">
            <div class="col-md-9 single-main-left">
            <div class="sngl-top">
                <div class="col-md-5 single-top-left">	
                    <div class="flexslider">
                        <ul class="slides">
                                @foreach ($image as $item)
                                @if (empty($image))
                                    <h1>Hình ảnh đang được cập nhật</h1>
                                @else
                                    <li data-thumb="{{ $item->images}}">
                                    <img src="/images/{{ $item->images}}" />
                                    </li>
                                @endif
                                    
                                @endforeach
                        </ul>
                    </div>
<!-- FlexSlider -->
<script defer src="/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="/css/flexslider.css" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
$('.flexslider').flexslider({
animation: "slide",
controlNav: "thumbnails"
});
});
</script>
            </div>	
            <div class="col-md-7 single-top-right" id="app">
                <div class="details-left-info simpleCart_shelfItem">
                    <h3 id="name">{{ $product->name }}</h3>
                <p class="availability">Hãng sản xuất: <span class="color">{{ $type->name }}</span></p>
                    <div class="price_single">
                        <span class="actual item_price">{{ number_format($product->price) }} đồng </span>
                        <input type="text" id="price" value="{{$product->price}}" style="display: none">
                    </div>
                    <h2 class="quick">Mô tả :</h2>
                <p class="quick_desc">{{ $product->description}}</p>
                    <ul class="size color" id="color">
                        <h3>Màu :</h3>
                        @foreach ($color as $item)
                        <li value="{{ $item->color}}"><a href="javascript:void(0)">{{ $item->color}}</a></li>
                        @endforeach
                        <div class="clear"> </div>
                    </ul>
                    <ul class="size size-css" id="size">
                        <h3>Size</h3>
                        @foreach ($size as $item)
                             <li value="{{ $item->size}}"><a href="javascript:void(0)">{{ $item->size}}</a></li>
                        @endforeach
                        
                    </ul>
                    <div class="quantity_box">
                        <ul class="product-qty">
                            <span>Số lượng :</span>
                            <span> <input style="font-size:large;width:100px" id="qty" min="1" max="100" type="number" name="qty" value="1" id="qty"></span>
                          
                        </ul>
                    </div>
                <div class="clearfix"> </div>
            <div class="single-but item_add">
                <button type="button" id="cartadd" class="btn btn-danger item_add add"
                      data-id="{{ $product->id }}">Thêm vào giỏ
               </button>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>  
        <div class="title-sh">
        <span>Hãng {{ $type->name }}</span>
                </div>
                <div class="latest products">
                    <div  class="product-one">
                        @foreach ($other as $item)
                            <div style="margin-top:30px" class="col-md-4 product-left single-left"> 
                                <div class="p-one simpleCart_shelfItem">
                                    <a href="/san-pham/{{ $item->id}}">
                                        <img src="/images/shoes-1.png" alt="" />
                                        <div class="mask mask1">
                                            <span>Chi tiết</span>
                                        </div>
                                    </a>
                                <h4>{{ $item->name }}</h4>
                                    <p><a class="item_add" href="/san-pham/{{ $item->id}}"><i></i> <span class=" item_price">{{ number_format($item->price) }}</span></a></p>
                                    
                                </div>
                            </div>
                        @endforeach
                     </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            @include('layouts.product.sidebar')
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
@endsection

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script>
   
    $(document).ready(function () {
        //
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        // active background
        $("ul.color li").click(function(){
            $("ul.color li").removeClass("active");
            $(this).addClass("active");
        });
        $("ul.size-css li").click(function(){
            $("ul.size-css li").removeClass("active");
            $(this).addClass("active");
        });
        // Select valude ul li
        var sizeSelected=null;
        var colorSelected=null;
        $("#size li").click(function ()
         {       
             sizeSelected= $(this).val();
        });
        $("#color li").click(function ()
         {       
            colorSelected= $(this).text();
        });
        // handle Ajax
        $('#cartadd').on('click', function () {
            var product_id = $(this).data('id');
            var qty = $('#qty').val();
            var price = $("#price").val();
            var name = $("#name").text();
            if(sizeSelected==null || colorSelected==null){
                Swal.fire('Chọn màu sắc hoặc size')
            }
            else
            {
                var size=sizeSelected;
                var color=colorSelected;
                $.ajax({
                type: "POST",
                url: "/addcart",
                data: {id: product_id, qty: qty, price: price, name: name,size:size,color:color},
                
                success: function (data) {
                    $("#cart-total").load(location.href + " #cart-total"); 
                        const Toast = Swal.mixin({
                            toast: true,
                            position: 'center',
                            showConfirmButton: false,
                            timer: 1500
                        });
                        Toast.fire({
                            type: 'success',
                            title: 'Sản phẩm đã được thêm vào giỏ hàng'
                        })
                    },
                    
                error: function (data) {
                    console.log('Error:', data);
                }
            });
            }
             
         
           
        })
    });
</script>