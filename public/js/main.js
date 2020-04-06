(function ($) {
    "use strict";

    /*----------------------------
     jQuery MeanMenu
    ------------------------------ */
    $('.mobile-menu nav').meanmenu({
        meanScreenWidth: "991",
        meanMenuContainer: ".mobile-menu"
    });

    /*----------------------------
     wow js
    ------------------------------ */
    new WOW().init();

    /*----------------------------
     product-slider
    ------------------------------ */
    $(".product-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: false,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     feature-product-slider
    ------------------------------ */
    $(".feature-product-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     new-product-slider
    ------------------------------ */
    $(".new-product-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     testimonial-slider
    ------------------------------ */
    $(".testimonial-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: true,
        navigation: false,
        items: 1,
        itemsDesktop: [1199, 1],
        itemsDesktopSmall: [980, 1],
        itemsTablet: [768, 1],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     sell-slider
    ------------------------------ */
    $(".sell-area .sell-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: false,
        items: 5,
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [1100, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     features-home2-slider
    ------------------------------ */
    $(".features-home2-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [980, 2],
        itemsTablet: [768, 1],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     sell-off-slider
    ------------------------------ */
    $(".sell-off-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: false,
        items: 4,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     product-page-slider
    ------------------------------ */
    $(".product-page-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 3,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 2],
    });

    /*----------------------------
    upsell-slider
    ------------------------------ */
    $(".upsell-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     related-slider
    ------------------------------ */
    $(".related-slider").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 4,
        itemsDesktop: [1199, 3],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
    });

    /*----------------------------
     price-slider active
    ------------------------------ */
    $("#slider-range").slider({
        range: true,
        min: 100,
        max: 750,
        values: [100, 700],
        slide: function (event, ui) {
            $("#amount").val("" + ui.values[0] + " -- " + ui.values[1]);
        }
    });
    $("#amount").val("" + $("#slider-range").slider("values", 0) +
        " -- " + $("#slider-range").slider("values", 1));

    /*----------------------------
     elevateZoom active
    ------------------------------ */
    $(".optima_zoom").elevateZoom({
        gallery: 'optima_gallery',
        cursor: 'pointer',
        galleryActiveClass: "active",
        imageCrossfade: true,
        loadingIcon: ""
    });

    $(".optima_zoom").bind("click", function (e) {
        var ez = $('.optima_zoom').data('elevateZoom');
        ez.closeAll(); //NEW: This function force hides the lens, tint and window
        $.fancybox(ez.getGalleryList());
        return false;
    });

    /*----------------------------
     cart-plus-minus-button active
    ------------------------------ */
    $(".cart-plus-minus").append('<div class="dec qtybutton"><</div><div class="inc qtybutton">></div>');
    $(".qtybutton").on("click", function () {
        var $button = $(this);
        var oldValue = $button.parent().find("input").val();
        if ($button.text() == ">") {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find("input").val(newVal);
    });

    /*--------------------------
     scrollUp
    ---------------------------- */
    //Check to see if the window is top if not then display button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('#scrollUp').fadeIn();
        } else {
            $('#scrollUp').fadeOut();
        }
    });

    //Click event to scroll to top
    $('#scrollUp').click(function () {
        $('html, body').animate({scrollTop: 0}, 800);
        return false;
    });

    /*--------------------------
     tooltip
    ---------------------------- */
    $('[data-toggle="tooltip"]').tooltip();
    // ==================== AJAX PRodutc-type ====================
    var getPrice = function formatPrice(price) {
        var formatter = new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: 'USD',
        });
        return formatter.format(price);
    };

    function cutNameType(name) {
        var name_type = '';
        switch (name) {
            case 'Giày Nike':
                name_type = 'Nike';
                break;
            case 'Paul Smith':
                name_type = 'Smith';
                break;
            case 'Giày Puma':
                name_type = 'Puma';
                break;
            case 'Giày Vans':
                name_type = 'Vans';
                break;
            default:
                name_type = name
        }
        return name_type;
    }

    $("#all-type").click(function (event) {
        event.preventDefault();
        $(".list-by-type").empty();

        $.ajax({
            type: 'GET',
            url: 'all-type',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                var html = '';
                var listProduct = data.productsBySprort;
                listProduct.forEach(element => {
                    html += ` <div class="col-md-4">
                                        <div class="single-product">
                                            <div class="level-pro-new">
                                                <span>sport</span>
                                            </div>
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="img/${element.product_image}" alt="" class="primary-img">
                                                </a>
                                            </div>
                                            <div class="product-name">
                                                <a href="/san-pham/${element.id}">${element.name}</a>
                                            </div>
                                            <div class="price-rating">
                                                <span>${getPrice(element.price)} </span>
                                            </div>
                                            <div class="actions">
                                                  <a href="/san-pham/${element.id}">
                                                       <button type="button" class="cart-btn" title="Add to cart">add to cart</button>
                                                   </a>
                                                <ul class="add-to-link">
                                                    <li><a class="modal-view" data-target="#productModal" data-toggle="modal" href="#"> <i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                           </div>`
                });
                $(".all-product").append(`<div class="col-md-9">`+html+`</div>`);
            },
            error: function (e) {
                console.log('error', e)
            },
        });
    });
    $(".product-type").click(function (event) {
        event.preventDefault();
        $(".all-product").empty();
        $(this).removeClass("active");
        $(this).addClass("active");
        $(".list-by-type").empty();
        var data = {
            id: $(this).attr("data-id")
        };
        $.ajax({
            type: 'GET',
            url: `/type/${data.id}`,
            data: data,
            dataType: 'json',
            success: data => {
                var html = '';
                var listProduct = data.products;
                var type_name = data.type_name;
                listProduct.forEach(element => {
                    html += `<div class="col-md-4">
                                    <div class="single-product">
                                        <div class="level-pro-new">
                                            <span>${cutNameType(type_name)}</span>
                                        </div>
                                        <div class="product-img">
                                            <a href="/san-pham/${element.id}"">
                                                <img src="img/${element.product_image}" alt="" class="primary-img">
                                            </a>
                                        </div>
                                        <div class="product-name">
                                            <a href="/san-pham/${element.id}" title="Fusce aliquam">${element.name}</a>
                                        </div>
                                        <div class="price-rating">
                                            <span>${getPrice(element.price)}</span>
                                        </div>
                                        <div class="actions">
                                          <a href="/san-pham/${element.id}">
                                           <button type="submit" class="cart-btn" title="Add to cart">add to cart</button>
                                           </a>
                                            <ul class="add-to-link">
                                                <li><a class="modal-view" data-target="#productModal" data-toggle="modal" href="#"> <i class="fa fa-search"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                               </div>`
                });
                if ($(this).hasClass("active")) {
                    $(".list-by-type").append(html);
                    $(this).removeClass("active");
                }
            },
            error: function (e) {
                console.log('error', e)
            },
        });
    });
    $(document).on("click","#btnUpdate",function () {
        $("input.qty").removeAttr('disabled');
    })
})(jQuery);
