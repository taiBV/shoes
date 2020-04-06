<div class="header-bottom">
    <div class="container">
        <div class="top-nav">
            <ul class="memenu skyblue">
                <li class="grid"><a href="/">Trang Chủ</a></li>
                @foreach ($category as $item)
                     <li class="grid"><a href="#">{{ $item->name}}</a>
                        <div class="mepanel">
                            @foreach ($item->producttypes as $item2)
                                <div class="row">
                                    <div class="col1 me-one">
                                    <a href="/hang-san-xuat/{{ $item2->id}}"><h4>{{ $item2->name}}</h4></a>
                                    </div>
                                </div>
                            @endforeach
                         
                        </div>
                    </li>
                @endforeach
                <li class="grid"><a href="/contact">Liên hệ</a></li>
            </ul>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>