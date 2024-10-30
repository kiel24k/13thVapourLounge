<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function productsTotal () {
        $product = DB::table('products')
        ->count();
        return response()->json($product);
    }

    public function userTotal () {
        $user = DB::table('users')
        ->count();
        return response()->json($user);
    }

    public function receiveOrdersTotal () {
        $order = DB::table('user_orders')
        ->where('status' , 'received')
        ->count();
        return response()->json($order);
    }
}
