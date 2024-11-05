<?php

namespace App\Http\Controllers;

use App\Models\Address_Book;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\User;
use App\Models\UserOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ClientController extends Controller
{
    public function clientAuth()
    {
        return response()->json(Auth::user());
    }
    public function newArrivalList()
    {
        $product = Product::where('label_category', 'new-arrival')->paginate(12);
        return response()->json($product);
    }
    public function bestSeller()
    {
        $product = Product::where('label_category', 'best-seller')->paginate(5);
        return response()->json($product);
    }
    public function allProduct()
    {
        return response()->json(Product::latest());
    }
    public function categoryList()
    {
        return response()->json(ProductCategory::select('product_type')->distinct()->get());
    }
    public function checkProduct(Request $request)
    {
        return response()->json(Product::where('id', $request->id)->get());
    }
    public function itemOnCategory(Request $request)
    {
        $product = ProductCategory::where('product_type', $request->product_type)->get();
        return response()->json($product);
    }
    public function productsOverview(Request $request)
    {
        $product = Product::where('product_name', $request->product_name)->get();
        return response()->json($product);
    }
   

    public function editProfile(Request $request)
    {
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
        ]);

        $auth = Auth::user()->id;
        $user = User::find($auth);
        $user->first_name = $request->first_name;
        $user->last_Name = $request->last_name;
        $user->mobile_no = $request->mobile_no;
        $user->gender = $request->gender;
        $user->update();
        return response()->json($user);
    }

    public function addNewAddress(Request $request)
    {

        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'mobile_no' => 'required|numeric',
            'floor_unit_no' => 'required',
            'province' => 'required',
            'municipality' => 'required',
            'baranggay' => 'required'
        ]);
        $address = new Address_Book();
        $address->user_id = Auth::user()->id;
        $address->first_name = $request->first_name;
        $address->last_name = $request->last_name;
        $address->mobile_no = $request->mobile_no;
        $address->floor_unit_no = $request->floor_unit_no;
        $address->province = $request->province;
        $address->municipality = $request->municipality;
        $address->baranggay = $request->baranggay;
        $address->save();
        return response()->json(['success' => 'success'], 200);
    }
     public function ClientOrder(Request $request)
    {

        // 'user_id',
        // 'first_name',
        // 'last_name',
        // 'mobile_no',
        // 'floor_unit_no',
        // 'island',
        // 'regions',
        // 'province',
        // 'municipality',
        // 'barangay',
        // 'order_image',
        // 'order_label',
        // 'order_price',
        // 'order_total',
        // 'order_quantity',
        // 'status'
        for ($i = 0; $i < count($request->order); $i++) {
            $request->validate([
                'first_name' => 'required',
                'last_name' => 'required',
                'mobile_no' => 'required',
                'floor_unit_no' => 'required',
                'island' => 'required',
                'regions' => 'required',
                'province' => 'required',
                'municipality' => 'required',
                'barangay' => 'required',
                
             
            ]);

            $order = new UserOrder();
            $order->user_id = Auth::user()->id;
            $order->first_name = $request->first_name;
            $order->last_name = $request->last_name;
            $order->mobile_no = $request->mobile_no;
            $order->floor_unit_no = $request->floor_unit_no;
            $order->island = $request->island;
            $order->regions = $request->regions;
            $order->province = $request->province;
            $order->municipality = $request->municipality;
            $order->barangay = $request->barangay;
            $order->order_image = $request->order[$i]['image'];
            $order->order_label = $request->order[$i]['product_label'];
            $order->order_price =  $request->order[$i]['price'];
            $order->order_quantity =  $request->order[$i]['quantity'];
            $order->order_total = $request->order[$i]['price'] * $request->order[$i]['quantity'];
            $order->save();
        }
        $order->save();
        return response()->json($order);
        

        
    }

    public function addressList()
    {
        $addressList = DB::table('address__books')
            ->select('user_id', 'first_name', 'last_name', 'mobile_no', 'floor_unit_no', 'province', 'municipality', 'baranggay')
            ->paginate(10);
        return response()->json($addressList);
    }

    public function allOrder(Request $request)
    {
        $user = DB::table('user_orders')
            ->select('order_image', 'order_label', 'order_price', 'order_total', 'order_quantity', 'status')
            ->where('user_id', Auth::user()->id)
            ->orderBy('created_at', 'desc')
            ->get();
        return response()->json($user);
    }
    public function pendingOrder()
    {
        $order = DB::table('user_orders')
            ->select('*')
            ->where('status', 'pending')
            ->where('user_id', Auth::user()->id)
            ->orderBy('created_at', 'desc')
            ->get();
        return response()->json($order);
    }
    public function orderToReceived()
    {
        $order = DB::table('user_orders')
            ->select('*')
            ->where('status', 'out-of-delivery')
            ->where('user_id', Auth::user()->id)
            ->orderBy('created_at', 'desc')
            ->get();
        return response()->json($order);
    }
    public function orderReceived()
    {
        $order = DB::table('user_orders')
            ->select('*')
            ->where('status', 'received')
            ->where('user_id', Auth::user()->id)
            ->orderBy('created_at', 'desc')
            ->get();
        return response()->json($order);
    }
    public function orderCompleted()
    {
        $order = DB::table('user_orders')
            ->select('*')
            ->where('status', 'completed')
            ->where('user_id', Auth::user()->id)
            ->orderBy('created_at', 'desc')
            ->get();
        return response()->json($order);
    }

    public function markAsCompleted (Request $request){
        $order = DB::table('user_orders')
        ->where('id',$request->id )
        ->update(['status' => 'completed']);
        return response()->json($order);
    }
    public function cancelOrder (Request $request){
        $order = DB::table('user_orders')
        ->where('id', $request->id)
        ->delete();
        return response()->json($order);
    }
    
}
