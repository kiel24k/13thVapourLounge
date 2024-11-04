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
        'first_name',
        'last_name',
        'mobile_no',
        'floor_unit_no',
        'island',
        'regions',
        'province',
        'municipality',
        'barangay',
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
