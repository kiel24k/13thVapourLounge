<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserOrder extends Model
{
    use HasFactory;
    protected $table = 'user_orders';
    protected $fillable = [
        'user_id',
        'order_image',
        'order_label',
        'order_price',
        'order_total',
        'order_quantity',
        'status'
    ];

    public function userInfo()
    {
        return $this->hasMany(User::class, 'id');
    }

  

   
}
