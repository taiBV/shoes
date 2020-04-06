<?php

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    function login(){
       return redirect('/dang-nhap');
    }
    function getLogin(Request $req){
        $data=[
            'email'=>$req->email,
            'password'=>$req->psw
        ];
        if(Auth::attempt($data)){
            return  redirect()->back();
        }
        else
        {
            return redirect('/');
           
        }
    }
}
