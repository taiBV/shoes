<?php


namespace App\Http\Controllers;

use App\Product;
use App\ProductCategory;
use App\ProductType;
use App\ProductImage;
use App\ProductColor;
use App\ProductSize;
use Illuminate\Http\Request;
use DB;
class ProductCategoryController extends Controller
{
   public function getProductByCate($id){
       $cate=ProductCategory::findOrFail($id);
       $typeByCate=ProductType::where('product_category_id',$cate->id)->get();
       $products=Product::whereIn("product_type_id",$typeByCate->pluck('id'))->paginate(9);
       return view('layouts.product.list-category',
           ['products'=>$products,'name'=>$cate->name]);
   }
}
