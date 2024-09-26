<?php

namespace App\Http\Controllers;

use App\Models\ProductCategory;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function createCategory (Request $request) {
        $request->validate([
            'category_type' => 'required|unique:product_categories,category_type',
            'category_name' => 'required|unique:product_categories,category_name'
        ]);
        $category = new ProductCategory();
        $category->category_type = $request->category_type;
        $category->category_name = $request->category_name;
        $category->save();
        return response()->json($category);
    } 
}
