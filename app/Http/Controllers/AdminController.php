<?php

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
class AdminController extends Controller
{
    function login(){
       return view('admin.login');
    }
    function postLogin(Request $req){
        $email=$req->email;
         $psw=$req->psw;
         $getU=User::where(['email'=>$email,'password'=>$psw])->first();
        if($getU==null){
           return redirect()->back();
        }
        else{
            return redirect('/adminapi');
        }
    }
}
