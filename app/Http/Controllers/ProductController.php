<?php

namespace App\Http\Controllers;
use App\Product;
use App\ProductCategory;
use App\ProductType;
use App\ProductImage;
use App\ProductColor;
use App\ProductSize;
use DB;

use Illuminate\Http\Request;

class ProductController extends Controller
{
    function getAll(){
        $products=DB::table('products')->Paginate(9);
        return view('layouts.product.list-all',['products'=>$products]);
    }
    public function detail($id){
        $product=Product::findOrFail($id);
        $image=ProductImage::where('product_id',$id)->get();
        $color=ProductColor::where('product_id',$id)->get();
        $size=ProductSize::where('product_id',$id)->get();
        $type=ProductType::where('id',$product->product_type_id)->first();
        $other=Product::where('product_type_id',$product->product_type_id)->Where('id','!=',$id)->get();
        $new_products=Product::where('id','!=',$id)->orderBy('created_at','DESC')->take(10)->get();
        return view('layouts.product.single-product',
            ['product'=>$product,'image'=>$image,'color'=>$color,'size'=>$size,'type'=>$type,'other'=>$other,'new_products'=>$new_products]);
    }
    function FilterProduct($key){
        $products=null;
        switch ($key) {
            case 'low':
             $products=Product::where('price','<=',500000)->paginate(9);
             break;
            case 'medium':
                $products=Product::where('price','>',500000)->where('price','<=',1000000)->paginate(9);
            break;
            case 'high':
                $products=Product::where('price','>',1000000)->paginate(9);
                break;
            default:
        }
        return view('layouts.product.filter-product',
            ['products'=>$products]);
    }
}
