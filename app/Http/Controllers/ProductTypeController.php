<?php

namespace App\Http\Controllers;
use App\Product;
use App\ProductCategory;
use App\ProductType;
use App\ProductImage;
use App\ProductColor;
use App\ProductSize;
use Illuminate\Http\Request;

class ProductTypeController extends Controller
{
    public function getProductByAjax($id)
    {
        $type=ProductType::findOrFail($id);
        $name=$type->name;
        $products=Product::where('product_type_id',$id)->get();
        return response()->json([
            'products' => $products,
            'type_name'=>  $name
        ]);
    }

    public function getAllbyAjax()
    {
        $type=ProductType::where('product_category_id',1)->get();
        // product byt cate sport
        $productsBySprort=Product::whereIn("product_type_id",$type->pluck('id'))->get();
        return response()->json([
            'productsBySprort'=>$productsBySprort
        ]);
    }

    public function detail($id){
        $type=ProductType::findOrFail($id);
        $name=$type->name;
         $products=Product::where('product_type_id',$id)->paginate(9);
        return view('layouts.product.list-type',
        ['products'=>$products,'name'=>$name]);
   }
}
