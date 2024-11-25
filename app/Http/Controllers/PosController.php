<?php

namespace App\Http\Controllers;

use App\Models\PosCustomer;
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

    public function getCustomerList () {
        $customer = DB::table('pos_customers')
        ->select('id','first_name', 'middle_name', 'last_name')
        ->orderBy('id', 'DESC')
        ->get();
        return response()->json($customer);
    }
}
