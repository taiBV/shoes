<?php

namespace App;
use App\AccountComment;
use App\ProductImage;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';
    protected $fillable = [ 'product_type_id','product_image', 'sku','slug', 'name','price','price_sale','excerpt','description','body'];
    public function productimages()
    {
        return $this->hasMany('App\ProductImage');
    } 
  

}
