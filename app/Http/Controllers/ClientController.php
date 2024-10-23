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
    public function ClientOrder(Request $request)
    {
        
        foreach ($request->order_data as $orderData) {
        $user = new UserOrder();
        $user->user_id = $request->user_id;
        $user->order_data = json_encode($orderData);
        $user->save();
        
        }
        $user->save();
        return response()->json($user);
        
    
       
       
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
        try {
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
        } catch (\Throwable $th) {
            return response()->json(['error' => 'Failed to submit'], 500);
        }
    }

    public function addressList () {
        $addressList = DB::table('address__books')
        ->select('user_id','first_name','last_name','mobile_no','floor_unit_no','province','municipality','baranggay')
        ->paginate(10);
        return response()->json($addressList);
    }

    public function allOrder(Request $request){
        $order = DB::table('user_orders')
        ->select('*')
        ->where('user_id',2 )
        ->get();
        return response()->json($order);
    }
}
