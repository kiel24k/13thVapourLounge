<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\UserOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ClientController extends Controller
{
    public function clientAuth () {
        return response()->json(Auth::user());
    }
    public function newArrivalList()
    {
        $product = Product::where('label_category', 'new-arrival')->paginate(12);
        return response()->json($product);
    }
    public function bestSeller() {
        $product = Product::where('label_category', 'best-seller')->paginate(5);
        return response()->json($product);
    }
    public function allProduct () {
        return response()->json(Product::latest());
    }
    public function categoryList () {
      return response()->json(ProductCategory::select('product_type')->distinct()->get());
    }
    public function checkProduct(Request $request){
        return response()->json(Product::where('id', $request->id)->get());
    }
    public function itemOnCategory (Request $request) {
        $product = ProductCategory::where('product_type', $request->product_type)->get();
        return response()->json($product);
    }
    public function productsOverview (Request $request) {
        $product = Product::where('product_name', $request->product_name)->get();
        return response()->json($product);
    }
    public function ClientOrder (Request $request){
        $user = new UserOrder();
        $user->user_ID = $request->user_id;
        $user->order_data = $request->order_data;
        $user->save();
        return response()->json($user);
    } 
}
