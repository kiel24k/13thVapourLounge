<?php

namespace App\Http\Controllers;

use App\Models\PosCustomer;
use App\Models\PosReserve;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PosController extends Controller
{
    public function addCustomer(Request $request)
    {
        $request->validate([
            'first_name' => 'required',
            'middle_name' => 'required',
            'last_name' => 'required',
            'mobile_no' => 'required|integer'
        ]);

        $customer = new PosCustomer();
        $customer->first_name = $request->first_name;
        $customer->middle_name = $request->middle_name;
        $customer->last_name = $request->last_name;
        $customer->mobile_no = $request->mobile_no;
        $customer->save();
        return response()->json($customer);
    }

    public function getCustomerList()
    {
        $customer = DB::table('pos_customers')
            ->select('id', 'first_name', 'middle_name', 'last_name')
            ->orderBy('id', 'DESC')
            ->get();
        return response()->json($customer);
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

    public function reserve (Request $request){
       foreach ($request->data as $data) {
        $reserve = new PosReserve();
        $reserve->product_id = $data['id'];
        $reserve->customer_id = $request->customer_id;
        $reserve->product_label = $data['product_label'];
        $reserve->quantity = $data['quantity'];
        $reserve->price = $data['product_price'];
        $reserve->total = $data['total'];
        $reserve->save();
       }

    }
}
