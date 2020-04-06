<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    protected $table = 'bills';
    /**
     * @var int
     */
    private $status;

}
