<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function newArrivalList()
    {
        $product = Product::where('label_category', 'new-arrival')->paginate(5);
        return response()->json($product);
    }
    public function bestSeller() {
        $product = Product::where('label_category', 'best-seller')->paginate(5);
        return response()->json($product);
    }
}
