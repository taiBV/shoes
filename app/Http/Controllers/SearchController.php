<?php

namespace App\Http\Controllers;
use App\Product;
use App\ProductCategory;
use App\ProductType;
use App\ProductImage;
use App\ProductColor;
use App\ProductSize;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

class SearchController extends Controller
{
    function search(Request $request){
        $key = $request->key;
         $product = Product::where('name','like','%'.$key.'%')->orWhere('sku','like','%'.$key.'%')->paginate(12);
           
          $count = $product->total(); 
          return view('layouts.product.search',  ['product'=>$product,'count'=>$count]);
        }
  
}
