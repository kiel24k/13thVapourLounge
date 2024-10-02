<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\User;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function createCategory(Request $request)
    {
        $request->validate([
            'product_name' => 'required|unique:product_categories,product_name',
        ]);
        $category = new ProductCategory();
        $category->product_type = $request->product_type;
        $category->product_name = $request->product_name;
        $category->save();
        return response()->json($category);
    }

    public function categoryList()
    {
        $productType = ProductCategory::get();
        return response()->json($productType);
    }
    public function createProduct(Request $request)
    {
        $request->validate([
            'product_name' => 'required',
            'product_label' => 'required',
            'product_price' => 'required',
            'product_image' => 'mimes:png,jpg',
            'quantity' => 'required|integer',
            'description' => 'required'
        ]);
        $product = Product::create([
            'product_name' => $request->product_name,
            'product_label' => $request->product_label,
            'product_price' => $request->product_price,
            'quantity' => $request->product_price,
            'description' => $request->description,
            'label_category' => $request->label_category,
        ]);
        // $image = $request->file('image');
        // $fileName = $image->hashName();
        // $request->$image->move(public_path('image'), $fileName); // Move the image
        // $product->image = $fileName;
        $image = $request->file('image');
        $fileName = $image->hashName();
        $image->store('product_image', 'public');
        $product->image = $fileName;
        $product->save();
        return response()->json([
            $product
        ]);
    }
    public function productList(Request $request)
    {
        $sortOrder = $request->query('sortOrder', 'asc');
        $sortBy = $request->query('sortBy', 'product_name');
        $product = Product::orderBy($sortBy, $sortOrder)->paginate(3);
        return response()->json($product);
    }
    public function deleteProduct(Request $request)
    {
        $product = Product::find($request->id)->delete();
        return response()->json($product);
    }

    public function displayOnlyCategory()
    {
        $uniqueCategory = ProductCategory::select('product_name')
            ->distinct()
            ->get();
        return response()->json($uniqueCategory);
    }

    public function userList(Request $request)
    {
        $sortName = $request->query('sortByName', 'first_name');
        $sortOrder = $request->query('sortByOrder', 'asc');
        $user = User::orderBy($sortName, $sortOrder)->paginate(3);
        return response()->json($user);
    }
    public function deleteUser(Request $request)
    {
        $user = User::find($request->id)->delete();
        return response()->json($user);

    }
}
