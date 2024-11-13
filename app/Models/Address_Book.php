<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address_Book extends Model
{
    use HasFactory;
    protected $table = 'address__books';
    protected $fillable = [
        'user_id',
        'mobile_no',
        'floor_unit_no',
        'island',
        'regions',
        'province',
        'municipality',
        'barangay',
    ];
}
