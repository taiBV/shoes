
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> The James Shop </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/dist/fontawesome-free-5.12.0-web//css/all.css" rel="stylesheet"> <!--load all styles -->
    <!-- Google Fonts
        ============================================ -->
    <link href='https://fonts.googleapis.com/css?family=Norican' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- All css -->

    <!-- Bootstrap CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Bootstrap CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/font-awesome.min.css">
    <!-- owl.carousel CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/css/owl.theme.css">
    <link rel="stylesheet" href="/css/owl.transitions.css">
    <!-- jquery-ui CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <!-- meanmenu CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/meanmenu.min.css">
    <!-- nivoslider CSS
        ============================================ -->
    <link rel="stylesheet" href="/lib//css/nivo-slider.css">
    <link rel="stylesheet" href="/lib//css/preview.css">
    <!-- animate CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- magic CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/magic.css">
    <!-- normalize CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/normalize.css">
    <!-- main CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/main.css">
    <!-- style CSS
        ============================================ -->
    <link rel="stylesheet" href="/style.css">
    <!-- responsive CSS
        ============================================ -->
    <link rel="stylesheet" href="/css/responsive.css">
    @yield('css')
    <!-- modernizr JS
        ============================================ -->
    <script src="/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	@include('layouts.core.header')
	@yield('content')
	@include('layouts.core.footer')
    <script src="/js/vendor/jquery-1.12.1.min.js"></script>
    <!-- bootstrap JS
            ============================================ -->
    <script src="/js/bootstrap.min.js"></script>
    <!-- wow JS
            ============================================ -->
    <script src="/js/wow.min.js"></script>
    <!-- price-slider JS
            ============================================ -->
    <script src="/js/jquery-price-slider.js"></script>
    <!-- nivoslider JS
            ============================================ -->
    <script src="/lib//js/jquery.nivo.slider.js"></script>
    <script src="/lib/home.js"></script>
    <!-- meanmenu JS
            ============================================ -->
    <script src="/js/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
            ============================================ -->
    <script src="/js/owl.carousel.min.js"></script>
    <!-- elevatezoom JS
            ============================================ -->
    <script src="/js/jquery.elevatezoom.js"></script>
    <!-- scrollUp JS
            ============================================ -->
    <script src="/js/jquery.scrollUp.min.js"></script>
    <!-- plugins JS
            ============================================ -->
    <script src="/js/plugins.js"></script>
    <!-- main JS
            ============================================ -->
    <script src="/js/main.js"></script>
    @yield('js')
</body>
</html>
