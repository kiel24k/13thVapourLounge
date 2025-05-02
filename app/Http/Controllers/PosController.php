<?php

namespace App\Http\Controllers;

use App\Models\PosCustomer;
use App\Models\PosReserve;
use App\Models\PosReserveProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PosController extends Controller
{
    public function addCustomer(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:pos_customers,name',
        ]);

        $customer = new PosCustomer();
        $customer->name = $request->name;
        $customer->note = $request->note;
        $customer->save();
        return response()->json($customer);
    }

    public function getCustomerList()
    {
        $customer = DB::table('pos_customers')
            ->select('id', 'name')
            ->orderBy('id', 'DESC')
            ->get();
        return response()->json($customer);
    }

    public function deleteCustomer(Request $request)
    {
        $data = PosCustomer::find($request->id)->delete();
        return response()->json($data);
    }

    public function posCategory()
    {
        $product = DB::table('products')
            ->select('product_name')
            ->orderBy('product_name', 'ASC')
            ->distinct()
            ->get();
        return response()->json($product);
    }

    public function getItems(Request $request)
    {
        if (empty($request->product_name) && empty($request->search)) {
            $product = DB::table('products')
                ->select('*')
                ->orderBy('id', 'DESC')
                ->get();
            return response()->json($product);
        } else if (isset($request->product_name) && empty($request->search)) {
            $product = DB::table('products')
                ->select('*')
                ->where('product_name', $request->product_name)
                ->get();
            return response()->json($product);
        } else if ((empty($request->product_name) && isset($request->search))) {
            $product = DB::table('products')
                ->select('*')
                ->where(function ($query) use ($request) {
                    $query->where('product_label', 'LIKE', '%' . $request->search . '%')
                        ->where('product_label', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('product_price', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('label_category', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('quantity', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('description', 'LIKE', '%' . $request->search . '%');
                })
                ->get();
            return response()->json($product);
        } else if (isset($request->product_name) || isset($request->search)) {
            $product = DB::table('products')
                ->select("*")
                ->where('product_name', $request->product_name)
                ->where(function ($query) use ($request) {
                    $query->orWhere('product_name', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('product_label', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('product_price', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('label_category', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('quantity', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('description', 'LIKE', '%' . $request->search . '%');
                })
                ->get();

            return response()->json($product);
        }
        // $product = DB::table('products')
        //     ->select('*')
        //     ->where('product_name', $request->product_name)
        //     ->orderBy('id', 'DESC')
        //     ->get();
        // return response()->json($product);
    }



    public function postReserveProduct(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:pos_reserve_products,name',
        ]);
       
        $reserve_product = new PosReserveProduct();
        $reserve_product->name = $request->name;
        $reserve_product->note = $request->note;
        $reserve_product->product = json_encode($request->product);
        $reserve_product->overall_quantity = $request->overall_quantity;
        $reserve_product->overall_total = $request->overall_total;
        $reserve_product->save();
        return response()->json($reserve_product);
    }


    public function getReserveList(Request $request)
    {
        if (empty($request->search)) {
            $data = DB::table('pos_reserve_products')
                ->select('*')
                ->get();
            return response()->json($data);
        } else if (isset($request->search)) {
            $data = PosReserveProduct::where('name', 'LIKE', '%' . $request->search . '%')
                ->orWhere('note', 'LIKE', '%' . $request->search . '%')
                ->orderBy('id', 'DESC')
                ->get();
            return response()->json($data);
        }
    }

    public function deleteReserveList(Request $request)
    {
        $data = PosReserveProduct::find($request->id)->delete();
        return response()->json($data);
    }
}
