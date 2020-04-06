<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SaleCode extends Model
{
    protected $table = 'sale_codes';
    protected $fillable = [ 'code', 'value','excerpt'];

}
