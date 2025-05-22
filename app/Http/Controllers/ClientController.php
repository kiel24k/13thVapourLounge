<?php

namespace App\Http\Controllers;

use App\Models\Address_Book;
use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\User;
use App\Models\UserOrder;
use Carbon\Carbon;
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
        return response()->json(ProductCategory::select('category')->distinct()->get());
    }
    public function checkProduct(Request $request)
    {
        return response()->json(Product::where('id', $request->id)->get());
    }
    public function itemOnCategory(Request $request)
    {
        $product = ProductCategory::where('category', $request->category)->get();
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
            'mobile_no' => 'required|numeric',
            'floor_unit_no' => 'required',
            'island' => 'required',
            'regions' => 'required',
            'province' => 'required',
            'municipality' => 'required',
            'barangay' => 'required',
        ]);
        $address = new Address_Book();
        $address->user_id = Auth::user()->id;
        $address->mobile_no = $request->mobile_no;
        $address->floor_unit_no = $request->floor_unit_no;
        $address->island = $request->island;
        $address->regions = $request->regions;
        $address->province = $request->province;
        $address->municipality = $request->municipality;
        $address->barangay = $request->barangay;
        $address->save();
        return response()->json(['success' => 'success'], 200);
    }
    public function ClientOrder(Request $request)
    {


        for ($i = 0; $i < count($request->order); $i++) {
            $request->validate([
                'order_first_name' => 'required',
                'order_last_name' => 'required',
                'order_mobile_no' => 'required',
                'floor_unit_no' => 'required',
                'island' => 'required',
                'regions' => 'required',
                'province' => 'required',
                'municipality' => 'required',
                'barangay' => 'required',
            ]);

            $order = new UserOrder();
            $order->user_id = Auth::user()->id;
            $order->order_first_name = $request->order_first_name;
            $order->order_last_name = $request->order_last_name;
            $order->order_mobile_no = $request->order_mobile_no;
            $order->floor_unit_no = $request->floor_unit_no;
            $order->island = $request->island;
            $order->regions = $request->regions;
            $order->province = $request->province;
            $order->municipality = $request->municipality;
            $order->barangay = $request->barangay;
            $order->order_id = $request->order[$i]['id'];
            $order->order_total = $request->order[$i]['price'] * $request->order[$i]['quantity'];
            $order->order_quantity = $request->order[$i]['quantity'];
            $order->status = 'pending';
            $order->date_order = Carbon::today()->format('Y-m-d-D');
            $order->save();
        }
        $order->save();

        return response()->json($order);
    }

    public function addressList()
    {
        $addressList = DB::table('address__books')
            ->select('mobile_no', 'floor_unit_no', 'island', 'regions', 'province', 'municipality', 'barangay')
            ->where('user_id', '=', Auth::user()->id)
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
            ->leftJoin('products', 'products.id', '=', 'user_orders.order_id')
            ->select('user_orders.*', 'products.*', 'user_orders.id as user_order_id')
            ->where('user_orders.status', 'pending')
            ->where('user_orders.user_id', Auth::user()->id)
            ->orderBy('user_orders.date_order', 'desc')
            ->get();
        return response()->json($order);
    }
    public function orderToReceived()
    {
        $order = DB::table('user_orders')
            ->leftJoin('products', 'products.id', '=', 'user_orders.order_id')
            ->where('user_orders.status', 'out-of-delivery')
            ->where('user_orders.user_id', Auth::user()->id)
            ->orderBy('user_orders.date_order', 'desc')
            ->get();
        return response()->json($order);
    }
    public function orderReceived()
    {
        $order = DB::table('user_orders')
            ->leftJoin('products', 'products.id', '=', 'user_orders.order_id')
            ->select("user_orders.*", "products.*", "user_orders.id as user_order_id")
            ->where('user_orders.status', 'received')
            ->where('user_orders.user_id', Auth::user()->id)
            ->orderBy('user_orders.date_order', 'desc')
            ->get();
        return response()->json($order);
    }
    public function orderCompleted()
    {
        $order = DB::table('user_orders')
            ->leftJoin('products', 'products.id', '=', 'user_orders.order_id')
            ->where('user_orders.status', 'completed')
            ->where('user_orders.user_id', Auth::user()->id)
            ->orderBy('user_orders.date_order', 'desc')
            ->get();
        return response()->json($order);
    }

    public function markAsCompleted(Request $request)
    {
        $order = DB::table('user_orders')
            ->where('id', $request->id)
            ->update(['status' => 'completed']);
        return response()->json($order);
    }
    public function cancelOrder(Request $request)
    {
        $order = DB::table('user_orders')
            ->where('id', $request->id)
            ->update(['status' => 'cancelled']);
        return response()->json($order);
    }
    public function cancelledOrder()
    {
        $order = DB::table('user_orders')
            ->leftJoin('products', 'products.id', '=', 'user_orders.order_id')
            ->where('user_orders.status', 'cancelled')
            ->where('user_orders.user_id', Auth::user()->id)
            ->orderBy('user_orders.date_order', 'desc')
            ->get();
        return response()->json($order);
    }
}
