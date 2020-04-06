<div class="col-sm-3">
    <div class="product-sidebar">
        <div class="sidebar-title">
            <h2>Hình thức lựa chọn</h2>
        </div>
        <div class="single-sidebar">
            <div class="single-sidebar-title">
                <h3>Thể loại</h3>
            </div>
            <div class="single-sidebar-content">
                <ul>
                    <li><a href="/products">Tất cả sản phẩm({{$count_pr}}) </a></li>
                   @foreach($category as $item)
                    <li><a href="/the-loai/{{$item->id}}">{{$item->name }}</a></li>
                       @endforeach
                </ul>
            </div>
        </div>
        <div class="single-sidebar price">
            <div class="single-sidebar-title">
                <h3>Lọc theo giá</h3>
            </div>
            <div class="">
                <div class="toolbar-bottom">
                    <ul class="text-left">
                        <?php $medium="medium" ;$low="low";$high="high" ?>
                        <li style="margin-bottom: 5px" class=" text-center"><a style="width: 150px;background: lightslategray;color: #fff" href="/loc-gia/{{ $low  }}">Dưới 500 nghìn</a></li>
                        <li  style="margin-bottom: 5px"><a  class="current text-center" href="/loc-gia/{{ $medium  }}" style="width: 150px;background: lightslategray;color: #fff ">Từ 500 đến 1 triệu</a></li>
                        <li  style="margin-bottom: 5px"><a  class="current text-center" href="/loc-gia/{{ $high  }}" style="width: 150px;background: lightslategray;color: #fff">Trên 1 triệu</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="banner-left">
            <a href="#">
                <img src="/img/product/banner_left.jpg" alt="">
            </a>
        </div>
    </div>
</div>
