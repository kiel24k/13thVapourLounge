<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function productsTotal()
    {
        $product = DB::table('products')
            ->count();
        return response()->json($product);
    }

    public function userTotal()
    {
        $user = DB::table('users')
            ->count();
        return response()->json($user);
    }

    public function receiveOrdersTotal()
    {
        $order = DB::table('user_orders')
            ->distinct()
            ->count();
        return response()->json($order);
    }

    public function pieChart()
    {
        $products = DB::table('user_orders')
            ->select('order_label')
            ->selectRaw('COUNT(*) as item_count')
            ->groupBy('order_label')
            ->get();
        return $products;      
    }

    public function monthlySales()
    {
        $data = DB::table('user_orders')
           ->selectRaw('EXTRACT(MONTH from date_order) as month')
           ->selectRaw('SUM(order_total) as total')
           ->groupBy('month')
           ->get();
        return $data;
    }
}
