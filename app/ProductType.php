<?php

namespace App;
use App\ProductCategory;
use Illuminate\Database\Eloquent\Model;

class ProductType extends Model
{
    protected $table = 'product_types';
    protected $fillable = [ 'name', 'product_category_id'];
    public $timestamps = true;
    public function productcategories()
    {
        return $this->belongsTo('App\ProductCategory','product_category_id');
    }

}
