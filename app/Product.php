<?php

namespace App;
use App\AccountComment;
use App\ProductImage;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';
    protected $fillable = [ 'product_type_id', 'sku', 'name','price','excerpt','description','body'];
    public function productimages()
    {
        return $this->hasMany('App\ProductImage');
    } 
  

}
