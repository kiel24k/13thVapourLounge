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
     'first_name',
     'last_name',
     'order_data'
    ];

    public function userInfo () {
        return $this->hasMany(User::class, 'id');
    }
}