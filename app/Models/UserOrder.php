<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserOrder extends Model
{
    use HasFactory;
    protected $table = 'user_orders';
    protected $fillable = [
     'user_ID',
     'order_total',
     
    ];

    public function userInfo () {
        return $this->hasMany(User::class, 'id');
    }
}
