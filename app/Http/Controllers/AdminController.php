<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductCategory;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function createCategory (Request $request) {
        $request->validate([
            'product_name' => 'required|unique:product_categories,product_name',
        ]);
        $category = new ProductCategory();
        $category->product_type = $request->product_type;
        $category->product_name = $request->product_name;
        $category->save();
        return response()->json($category);
    } 

    public function categoryList(){
        $productType = ProductCategory::get();
        return response()->json($productType);
    }
    public function createProduct (Request $request){
        $request->validate([
            'product_name' => 'required',
            'product_label' => 'required',
            'product_price' => 'required',
            'product_image' => 'mimes,png,jpg',
            'quantity' => 'required|integer',
            'description' => 'required'
        ]);
        $product = new Product();
        $product->product_name = $request->product_name;
        $product->product_label = $request->product_label;
        $product->product_price = $request->product_price;
        $product->product_image = "Rhonalyn";
        $product->quantity = $request->quantity;
        $product->description = $request->description;
        $product->save();
        return response()->json($product);
    }
    public function productList () {
        $product = Product::orderBy('id', 'asc')->paginate();
        return response()->json($product);
    }
    public function deleteProduct (Request $request){
        $product = Product::find($request->id)->delete();
        return response()->json($product);
    }
}
