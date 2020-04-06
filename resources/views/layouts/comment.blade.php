<meta name="csrf-token" content="{{ csrf_token() }}">
<div class="container bootstrap snippets" style="margin-top: 50px">
    <div class="col-md-12  col-sm-12">
        <div class="comment-wrapper">
            <div class="panel panel-info">
                <div class="panel-heading" style="font-size: 20px">
                    Bình luận , nhận xét
                </div>
                <div class="panel-body">
                    <hr>
                    <ul class="media-list list-cmt">
                       
                    </ul>
                    <button type="button" class="btn btn-info" id="addCmt" style="margin-bottom: 20px">Nhận xét</button>
                    <div class="box-cmt">
                        <form id="form-cmt">
                            @csrf
                            <div style="display: flex;margin-bottom: 20px">
                                <div style="width: 50%;padding-right: 25px">
                                    <input id="name_cmt" name="name_cmt" style="height: 50px" type="text" class="form-control" placeholder="Họ tên">
                                </div>
                                <div style="width: 50%;padding-left: 25px">
                                    <input id="email_cmt" name="email_cmt" style="height: 50px" type="text" class="form-control" placeholder="Địa chỉ email">
                           </div>
                            </div>
                            <textarea id="body_cmt" name="body_cmt" class="form-control" placeholder="Nội dung ..." rows="3"></textarea>
                        </form>
                        <br>
                        <button data-id="{{ $product->id }}" type="button" class="btn btn-info pull-right" id="postCmt">Đăng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
