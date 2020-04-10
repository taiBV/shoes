<?php

namespace App\Http\Controllers;
use App\ProductCategory;
use App\ProductType;
use App\Product;
use App\ProductImage;
use DB;
use Illuminate\Http\Request;
use  Illuminate\Support\Collection;
use Cart;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // {
    //     $this->middleware('auth');
    // }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
      
        $category=ProductCategory::all();
        $type=ProductType::where('product_category_id',1)->get();
        // product byt cate sport
        $productsBySprort=Product::whereIn("product_type_id",$type->pluck('id'))->take(6)->get();
        $products=DB::table('products')->orderBy('created_at','DESC')->take(8)->get();
        $productBanner=DB::table('products')->orderBy('created_at','ASC')->take(2)->get();

        return view('home.index',
            [
                'category'=>$category,
                'products'=>$products,
                'type'=>$type,
                'productsBySprort'=>$productsBySprort,
                'productBanner'=>$productBanner
             ]);
    }
}
