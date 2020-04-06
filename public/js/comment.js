
$(document).ready(function () {
     $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

     //  ================= ================= COMMENT ==============================================


    $(".box-cmt").hide();
    $(document).on('click','#addCmt',function () {
        $(".box-cmt").toggle("slow");
    });

    $( window ).load(function() {
        var product_id=$("#postCmt").data('id');
        var html_cmt=''
        $.ajax({
            method: "get",
            url: `/list-comment/${product_id}`,
            dataType: "json",
            data:{product_id},
            success:function (data) {
               const list=data.list;
               
                 Array.prototype.forEach.call(list, item => {
                    html_cmt=`<li class="media">
                                    <a href="javascript:void(0)" class="pull-left">
                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="" class="img-circle">
                                    </a>
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small class="text-muted">${formartTime(item.created_at)}</small>
                                        </span>
                                        <strong class="text-success">@${item.name}</strong>
                                        <p>${item.body}</p>
                                        </div>
                             </li>`;
                      $(".list-cmt").append(html_cmt);
                  });
            },
            error:function () {

            }
        });
     });
    $("#postCmt").click(function () {
        var html_cmt='';
        var name=$("#name_cmt").val();
        var email=$("#email_cmt").val();
        var body=$("#body_cmt").val();
        var product_id=$("#postCmt").data('id');
        $.ajax({
            method: "post",
            url: "/comment",
            dataType: "json",
            data:{name,email,body,product_id},
            success:function (data) {
                const cmt=data.comment;
                html_cmt=`<li class="media">
                                    <a href="javascript:void(0)" class="pull-left">
                                        <img src="/img/about/u-cmt.jpg" alt="" class="img-circle">
                                    </a>
                                    <div class="media-body">
                                        <span class="text-muted pull-right">
                                            <small class="text-muted">${formartTime(cmt.created_at)}</small>
                                        </span>
                                        <strong class="text-success">@${cmt.name}</strong>
                                        <p>${cmt.body}</p>
                                        </div>
                            </li>`;
                     $(".panel-body").css('opacity',0.4);
                    setTimeout(function(){
                        $(".list-cmt").append(html_cmt);
                        $(".panel-body").css('opacity',1);
                        $('#form-cmt')[0].reset();
                    },1000);
                        
            },
            error:function (error) {
                console.log('Error',error);
            }
        });
    });
    function formartTime(time){
       moment.locale('vi');
         return moment(time).fromNow();
    }
      //  ================= ================= END  COMMENT ==============================================
});
