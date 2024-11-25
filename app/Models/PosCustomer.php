<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PosCustomer extends Model
{
    use HasFactory;

    protected $table = 'pos_customers';
    protected $fillable = [
        'first_name',
        'last_name',
        'middle_name',
        'mobile_no'
    ];
}
