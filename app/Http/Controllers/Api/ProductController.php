<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Product;
use App\ProductColor;
use App\ProductSize;
use App\ProductImage;
use Carbon\Carbon;
use DB;
class ProductController extends Controller
{
    //  ================================function  getSKU===========================
    public function getSKU(){
        $dt=Carbon::now('Asia/Ho_Chi_Minh');
        $char_rep=[":"," ","-"];
        $process_sku=str_replace($char_rep,"",$dt);
        $sku='TJ'.$process_sku;
        return $sku;
    }
    // ===================================
    public function index()
    {
        $list = DB::table('products')->orderBy('created_at','DESC')->get();
        return $list;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // formart sku
        $dt=Carbon::now('Asia/Ho_Chi_Minh');
        $char_rep=[":"," ","-"];
        $process_sku=str_replace($char_rep,"",$dt);
        $sku='TJ'.$process_sku;
        // end format sku 

        // get vlaue img
        if($request->get('image'))
        {
            $image = $request->get('image');
            $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
            \Image::make($request->get('image'))->save(public_path('img/').$name);
        }
        if(isset($name))
        {
            // insert product
            $product = new Product;
            $product->product_type_id=json_decode($request->product["type"], true);
            $product->product_image= $name;
            if(empty($request->product["sku"])){
                //  set sku = $sku formart
                $product->sku=$sku;
            }
            else{
                $product->sku=json_decode(json_encode($request->product["sku"]), true);
            }
            $product->name=json_decode(json_encode($request->product["name"]), true);
            $product->slug=json_decode(json_encode($request->product["slug"]), true);
            $product->price=json_decode(json_encode($request->product["price"]), true);
            $product->price_sale=json_decode(json_encode($request->product["sale"]), true);
            $product->excerpt=json_decode(json_encode($request->product["excerpt"]), true);
            $product->description=json_decode(json_encode($request->product["description"]), true);
            $product->body=json_decode(json_encode($request->product["body"]), true);
            $product->save();
        }

       //save Color
        $request_color=json_decode(json_encode($request->color, true));
        foreach($request_color as $value)
            {
                    $color= new ProductColor;
                    $data=array('product_id'=>$product->id,'color'=>$value);
                    $color->insert($data);
            }

      // save size
      $request_size=json_decode(json_encode($request->size, true));
      foreach($request_size as $value)
          {
                  $color= new ProductSize;
                  $data=array('product_id'=>$product->id,'size'=>$value);
                  $color->insert($data);
          }
    // save images
    if($request->get('image'))
    {
       $image = $request->get('image');
       $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
       \Image::make($request->get('image'))->save(public_path('img/').$name);
     }
     if(isset($name))
     {
        $image= new ProductImage();
        $image->product_id=$product->id;
        $image->images = $name;
        $image->save();
     }
        return $product;
    }
    public function show($id)
    {
        return Product::findOrFail($id);
    }

    public function edit($id)
    {
        //
    }
    public function update(Request $request, $id)
    {
        $sku='';
        $name='';
        if(empty($request->product["sku"])){
            $sku=$this->getSKU();
        }
        else{
            $sku=$request->product['sku'];
        }

        // get img 
        if($request->get('image'))
        {
            $image = $request->get('image');
            $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
            \Image::make($request->get('image'))->save(public_path('img/').$name);
        }
        
        if(isset($name)){
            $product = Product::findOrFail($id);
            $product->update([
                        'product_image'=>$name,
                        'product_type_id'=>$request->selectedType,
                        'sku'=>$sku,
                        'name'=>$request->product['name'],
                        'price'=>$request->product['price'],
                        'price_sale'=>$request->product['price_sale'],
                        'excerpt'=>$request->product['excerpt'],
                        'description'=>$request->product['description'],
                        'body'=>$request->product['body'],
                        'status'=>$request->product['status'],
                        ]);    
        }
 
       
        $pr_color = DB::table('products_colors')
                    ->where('product_id', $id);
        $pr_color->delete();

         $request_color=json_decode(json_encode($request->color, true));
         foreach($request_color as $value)
             {
                     $color= new ProductColor;
                     $data=array('product_id'=>$id,'color'=>$value);
                     $color->insert($data);
            }
     
       $request_size=json_decode(json_encode($request->size, true));
       $pr_size= DB::table('products_sizes')
                     ->where('product_id', $id);
        $pr_size->delete();
        foreach($request_size as $value)
        {
                $color= new ProductSize;
                $data=array('product_id'=>$id,'size'=>$value);
                $color->insert($data);
        }
        // end 
        return $product;
    }
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
        return '';
    }
}
