<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Http\Request;

class ClientController extends Controller
{
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
}
