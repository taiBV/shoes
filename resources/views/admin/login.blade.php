<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng nhập </title>
    <link rel="stylesheet" href="/js/admin/plugins/bootstrap/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<style>
    .img-logo{
      
    }
    .login{
        padding-top: 80px;
        background-color: lightblue;
        padding-bottom: 80px;
        border-radius: 45px;
    }
    .img-logo{
        margin-top: 3px;
    margin-left: 22px;
    width: 30%;
    }
    img{
        width: 100%;
    }
    .divider{
        width: 3px;
        margin-top: 30px;
        height: 176px;
        background-color: green;
        margin-left: 37px;
    }
    .form-login{
        margin-top: 70px
    }
</style>
<body>
    <div class="form-login ">
        <div class="w-50 m-auto login ">
            <div class="d-flex">

                <div class="img-logo">
                    <img src="/img/vue.png" alt="">
                </div>
                <div class="divider"></div>
                <div class="w-50 m-auto">
                    <form method="post" action="/postLogin">
                    @csrf
                        <div class="form-group">
                          <label class="font-weight-bold">Email</label>
                          <input id="email" name="email"  class="form-control" placeholder="Enter email">
                          <input type="hidden" name="_token" id="token" value="{{ csrf_token() }}">
                        </div>
                        <div class="form-group">
                          <label  class="font-weight-bold" for="exampleInputPassword1">Password</label>
                          <input id="psw" name="psw" type="password" class="form-control">
                        </div>
                        <button id="login" type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="/js/admin/plugins/popper.js/dist/umd/popper.min.js"></script>
    <script src="/js/admin/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>