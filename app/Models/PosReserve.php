<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PosReserve extends Model
{
    use HasFactory;
    protected $table = 'pos_reserves';
    protected $fillable = [
        'product_id',
        'customer_id',
        'product_label',
        'quantity',
        'price',
        'total'
    ];
}
