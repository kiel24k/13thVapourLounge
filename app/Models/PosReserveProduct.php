<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PosReserveProduct extends Model
{
    use HasFactory;
    protected $table = 'pos_reserve_products';
    protected $fillable =   [
        'name',
        'note',
        'product',
        'overall_quantity',
        'overall_total'
    ];
}
