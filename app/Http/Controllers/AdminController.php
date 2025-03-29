<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductCategory;
use App\Models\User;
use App\Models\UserOrder;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class AdminController extends Controller
{
    public function createCategory(Request $request)
    {
        $request->validate([
            'product_type' => 'required|unique:product_categories,product_name',
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
            'description' => 'required| string'
        ]);
        $product = Product::create([
            'product_name' => $request->product_name,
            'product_label' => $request->product_label,
            'product_price' => $request->product_price,
            'quantity' => $request->product_price,
            'description' => $request->description,
            'label_category' => $request->label_category,
            'date_released' => Carbon::now()->format('Y-m-d')
        ]);
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
        $product = Product::orderBy($sortBy, $sortOrder)->paginate(10);
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

    public function orderCategory()
    {
        $data = UserOrder::select('date_order')->orderBy('id', 'DESC')->get();
        return response()->json($data);
    }

    public function orderList(Request $request)
    {
        $sort = $request->query('sort', 'ASC');
        $order = $request->query('order', 'first_name');
        if (empty($request->category) && empty($request->search)) {
            $data = UserOrder::OrderBy($order , $sort)->paginate(5);
            return response()->json($data);
        } else if (isset($request->category) && empty($request->search)) {
            $data = UserOrder::where('date_order', $request->category)
            ->OrderBy($order , $sort)
            ->paginate(5);
            return response()->json($data);
        } else if (empty($request->category) && isset($request->search)) {
            $data = UserOrder::where('first_name', 'LIKE', '%' . $request->search . '%')
                ->orWhere('last_name', 'LIKE', '%' . $request->search . '%')
                ->orWhere('mobile_no', 'LIKE', '%' . $request->search . '%')
                ->orWhere('floor_unit_no', 'LIKE', '%' . $request->search . '%')
                ->orWhere('island', 'LIKE', '%' . $request->search . '%')
                ->orWhere('regions', 'LIKE', '%' . $request->search . '%')
                ->orWhere('province', 'LIKE', '%' . $request->search . '%')
                ->orWhere('municipality', 'LIKE', '%' . $request->search . '%')
                ->orWhere('barangay', 'LIKE', '%' . $request->search . '%')
                ->orWhere('order_label', 'LIKE', '%' . $request->search . '%')
                ->orWhere('order_price', 'LIKE', '%' . $request->search . '%')
                ->orWhere('order_total', 'LIKE', '%' . $request->search . '%')
                ->orWhere('order_quantity', 'LIKE', '%' . $request->search . '%')
                ->orWhere('status', 'LIKE', '%' . $request->search . '%')
                ->OrderBy($order , $sort)
                ->paginate(5);
            return response()->json($data);
        } else if (isset($request->category) && isset($request->search)) {
            $data = UserOrder::where('date_order', $request->category)
                ->where(function ($query) use ($request) {
                    $query->where('first_name', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('last_name', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('mobile_no', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('floor_unit_no', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('island', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('regions', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('province', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('municipality', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('barangay', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('order_label', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('order_price', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('order_total', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('order_quantity', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('status', 'LIKE', '%' . $request->search . '%');
                })
                ->OrderBy($order , $sort)
                ->paginate(5);
            return response()->json($data);
        }
    }
    public function orderUpdateStatus(Request $request)
    {
        $userId = UserOrder::find($request->id);
        $userId->status = $request->status;
        $userId->update();
        return response()->json([
            "status" => 200
        ]);
    }
    public function updateAdminProfile(Request $request)
    {
        $user = User::find(Auth::user()->id);
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->email = $request->email;
        if ($request->hasFile('image')) {
            $filePath = 'admin_profile/' . $user->image;
            if (File::exists($filePath)) {
                file::delete($filePath);
            }
            $image = $request->file('image');
            $fileName = $image->hashName();
            $image->storeAs('admin_profile', $fileName, 'public');
            $user->image = $fileName;
            $user->update();
        }
        $user->update();
        return response()->json($user);
    }
}
