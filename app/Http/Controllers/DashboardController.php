<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\UserOrder;
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
            ->leftJoin('products', 'user_orderS.order_id', '=', 'products.id')
            ->select('products.product_label')
            ->selectRaw('COUNT(*) as item_count')
            ->groupBy('products.product_label')
            ->get();
        return response()->json($products);
    }

    public function salesDateCategory()
    {
        $salesYear = DB::table('user_orders')
            ->selectRaw('YEAR(date_order) as year')
            ->distinct()
            ->get();

        $salesMonth = DB::table('user_orders')
            ->selectRaw('MONTH(date_order) as month')
            ->distinct()
            ->get();


        return response()->json([
            'sales_year' => $salesYear,
            'sales_month' => $salesMonth
        ]);
    }

    public function weeklySales(Request $request)
    {
        $year = $request->query('year', 2025);
        $month = $request->query('month', 1);
        $data = DB::table('user_orders')
            ->selectRaw('CEIL(DAY(date_order) / 7) as week_group')
            ->selectRaw('SUM(order_total) as total')
            ->whereMonth('date_order', $month) // Optional: limit to May
            ->whereYear('date_order', $year)
            ->groupBy('week_group')
            ->orderBy('week_group')
            ->get();
        return $data;
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

    public function newProductAdded () {
        $data = Product::select('*')
        ->orderBy('id', 'DESC')
        ->limit(15)
        ->get();
        return response()->json($data);
    }
}
