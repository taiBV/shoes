<?php

namespace App\Http\Controllers;
use App\AccountComment;
use App\Product;
use Illuminate\Http\Request;
use Carbon\Carbon;
class CommentController extends Controller
{
    function getComment($product_id){
        $list_cmt=AccountComment::where('product_id',$product_id)->get();
        return response()->json([
            'list'=>$list_cmt
        ]);
    }
    function  postComment(Request $request)
    {
        $time=Carbon::now('Asia/Ho_Chi_Minh');
       $cmt=new AccountComment;
       $cmt->product_id=$request->product_id;
       $cmt->name=$request->name;
       $cmt->email=$request->email;
       $cmt->body=$request->body;
       $cmt->created_at=$time;
       $cmt->save();
       return response()->json([
           'comment'=>$cmt
       ]);

    }
}
