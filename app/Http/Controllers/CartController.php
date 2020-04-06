<?php

namespace App\Http\Controllers;
use Cart;
use Illuminate\Http\Request;
use Validator;
use App\SaleCode;
class CartController extends Controller
{
    public function getAddCart(Request $request)
    {
        $id = $request->id;
        $qty = $request->qty;
        $price = $request->price;
        $name = $request->name;
        $size=$request->size;
        $color=$request->color;
        $image=$request->image;
        Cart::add(array(
            array(
                'id' =>     $id,
                'name' =>   $name,
                'price' => $price ,
                'quantity' =>   $qty,
                'attributes' => array(
                    'size'=>$size,
                    'color'=>$color,
                    'img'=>$image,
                    'sale'=>''
                )
            )
          ));
        return response()->json([
            'carts' =>  Cart::getContent()
        ]);
    }
    public function updateCart(Request $request)
    {
        $id = $request->id;
        $qty = $request->qty;
        Cart::update($id, array(
            'quantity' => array(
                'relative' => false,
                'value' => $qty
            ),
        ));

        return response()->json([
            'products' =>  Cart::getContent()
        ]);
    }

    public function deletecart(Request $request)
    {
        Cart::remove($request->id);
        return response()->json([
            'products' =>  Cart::getContent()
        ]);
    }

    public function destroyCart()
    {
        Cart::clear();
    }
    public function getAddCode(Request $request){

        $code=SaleCode::where('code',$request->code)->first();
        $total= Cart::getSubTotal();
        $msg_code='';
        if(isset($code)){
           $total =  Cart::getSubTotal() - Cart::getSubTotal()*$code->value*0.01;
        }
        else{
            $msg_code='Mã giảm giá không đúng , vui lòng kiểm tra lại';
        }

//        dd(Cart::getSubTotal());
        // đến đây giá trị vẫn k đổi
        return response()->json(['total'=>$total,'msg_code'=>$msg_code]);
    }
}
