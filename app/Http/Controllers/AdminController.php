<?php

namespace App\Http\Controllers;

use App\Models\ProductCategory;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function createCategory (Request $request) {
        $request->validate([
            'product_type' => 'required|unique:product_categories,product_type',
            'product_name' => 'required|unique:product_categories,product_name',
            'product_label' => 'required|unique:product_categories,product_label',
        ]);
        $category = new ProductCategory();
        $category->product_type = $request->product_type;
        $category->product_name = $request->product_name;
        $category->product_label = $request->product_label;
        $category->save();
        return response()->json($category);
    } 
}
