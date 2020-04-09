$(document).ready(function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    
   // active background
    $("ul.color li").click(function(){
        $("ul.color li").removeClass("current");
        $(this).addClass("current");
    });
    $("ul.size li").click(function(){
        $("ul.size li").removeClass("current");
        $(this).addClass("current");
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
        var image = $("#img").val();
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
                data: {"_token": $('#token').val(),id: product_id, qty: qty, price: price, name: name,size:size,color:color,image:image},

                success: function (data) {

                    console.log(data);
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
    });

    // update cart
    $(document).on("change",".qty",function () {
        let qty = $(this).val();
        let id = $(this).data('id');
        $.ajax({
            type: "POST",
            url: "/updatecart",
            data: {id: id, qty: qty, "_token": $('#token').val()},
            success: function (data) {
                $(".ckeckout").load(location.href + " .ckeckout");
                $("#cart-total").load(location.href + " #cart-total");
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
    });
    // delete item cart
    $(document).on("click",".delete-item",function () {
        let id = $(this).data('id');
        $.ajax({
            type: "POST",
            url: "/deletecart",
            data: {id: id, "_token": $('#token').val()},
            success: function (data) {
                console.log(data);
                $(".ckeckout").load(location.href + " .ckeckout");
                $("#myModal").load(location.href + " #myModal");
                $("#cart-total").load(location.href + " #cart-total");
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
    });
    //destroy cart
    $(document).on("click","#deleteall",function () {
        $.ajax({
            type: "POST",
            url: "/destroycart",
            data: { "_token": $('#token').val()},
            success: function (data) {
                $(".ckeckout").load(location.href + " .ckeckout");
                $("#myModal").load(location.href + " #myModal");
                $("#cart-total").load(location.href + " #cart-total");
                // setTimeout(function() { $("#notifi").hide(); }, 100000);
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
    });
    // add code sale

    $(".btnReceive").click(function () {

         var code=$("#code-sale").val();
        $.ajax({
            type: "POST",
            url: "/addCode",
            data: {code:code, "_token": $('#token').val()},
            success: function (data) {
                var msg=data.msg_code;
                console.log(data.total);
                if(msg){
                    $("#msg-code").html(msg);
                }
                else {
                    var success=`<div style="margin-top: 25px" class="alert alert-success" role="alert">
                                 Mã giảm giá được áp dụng !
                                </div>`;
                    $("#msg-code").append(success);
                    setTimeout(function () {
                        $("#msg-code").hide("slow");
                    },4000);

                }
                // $(".ckeckout").load(location.href + " .ckeckout");
                // $("#cart-total").load(location.href + " #cart-total");
            },
            error: function (data) {
                console.log('Error:', data);
            }
        });
    });

    // validtae
    $(".confirm").click(function(e){
        e.preventDefault();
       var ipName=$("#name").val();
       var ipEmail=$("#email").val();
       var ipAddress=$("#address").val();
       var ipPhone=$("#phone").val();
      if(ipName !='' || ipPhone !='' || ipEmail !='' ||  ipAddress !=''){
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if(ipEmail.match(mailformat)){
               $("#formBill").submit();
        }
      }
      else
      {
       Swal.fire('Thông tin không hợp lệ !')
      }
     
    });
});
