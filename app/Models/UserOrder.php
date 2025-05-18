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
        'order_first_name',
        'order_last_name',
        'order_mobile_no',
        'floor_unit_no',
        'island',
        'regions',
        'province',
        'municipality',
        'barangay',
        'order_id',
        'order_price',
        'order_total',
        'order_quantity',
        'status',
        'date_order'
    ];

    public function userInfo()
    {
        return $this->hasMany(User::class, 'id');
    }
}
