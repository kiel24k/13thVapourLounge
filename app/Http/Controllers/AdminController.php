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
            'description' => 'required'
        ]);
        $category = new ProductCategory();
        $category->product_type = $request->product_type;
        $category->product_name = $request->product_name;
        $category->description = $request->description;
        $category->save();
        return response()->json($category);
    }
    public function deleteProductCategory(Request $request)
    {
        $category = ProductCategory::find($request->id)->delete();
        return response()->json($category);
    }

    public function getCategory(Request $request)
    {
        $category = ProductCategory::find($request->id);
        return response()->json($category);
    }

    public function updateCategory(Request $request)
    {
        $request->validate([
            'product_type' => 'required',
            'product_name' => 'required',
            'description' => 'required'
        ]);
        $category = ProductCategory::find($request->id);
        $category->product_type = $request->product_type;
        $category->product_name = $request->product_name;
        $category->description = $request->description;
        $category->update();
        return response()->json($category);
    }

    public function categoryList()
    {
        $productType = ProductCategory::get();
        return response()->json($productType);
    }

    public function categoryTable(Request $request)
    {
        $sortOrder = $request->query('sortOrder', 'DESC');
        $sortBy = $request->query('sortBy', 'product_name');
        if (empty($request->search)) {
            $data = ProductCategory::orderBy($sortBy,  $sortOrder)->get();
            return response()->json($data);
        } else if (isset($request->search)) {
            $data = ProductCategory::where('product_type', 'LIKE', '%' . $request->search . '%')
                ->orWhere('product_name', 'LIKE', '%' . $request->search . '%')
                ->orWhere('description', 'LIKE', '%' . $request->search . '%')
                ->orderBy($sortBy,  $sortOrder)
                ->paginate(5);
            return response()->json($data);
        }
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

    public function productListCategory()
    {
        $data = Product::select('date_released')->orderBy('id', 'DESC')->get();
        return response()->json($data);
    }
    public function productList(Request $request)
    {
        $sortOrder = $request->query('sortOrder', 'asc');
        $sortBy = $request->query('sortBy', 'product_name');
        if (empty($request->search) && empty($request->category)) {
            $data = Product::orderBy($sortBy, $sortOrder)->paginate(6);
            return response()->json($data);
        } else if (isset($request->category) && empty($request->search)) {
            $data = Product::where('date_released', $request->category)
                ->orderBy($sortBy, $sortOrder)
                ->paginate(6);
            return response()->json($data);
        } else if (empty($request->category) && isset($request->search)) {
            $data = Product::where('product_name', 'LIKE', '%' . $request->search . '%')
                ->orWhere('product_label', 'LIKE', '%' . $request->search . '%')
                ->orWhere('label_category', 'LIKE', '%' . $request->search . '%')
                ->orWhere('quantity', 'LIKE', '%' . $request->search . '%')
                ->orWhere('description', 'LIKE', '%' . $request->search . '%')
                ->orderBy($sortBy, $sortOrder)
                ->paginate(6);
            return response()->json($data);
        } else if (isset($request->category) && isset($request->search)) {
            $data = Product::where('date_released', $request->category)
                ->where(function ($query) use ($request) {
                    $query->where('product_name', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('product_label', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('label_category', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('quantity', 'LIKE', '%' . $request->search . '%')
                        ->orWhere('description', 'LIKE', '%' . $request->search . '%');
                })
                ->orderBy($sortBy, $sortOrder)
                ->paginate(6);
            return response()->json($data);
        }
    }

    public function getUpdateProduct(Request $request)
    {
        $product = Product::find($request->id);
        return response()->json($product);
    }

    public function updateProduct(Request $request)
    {
        $product = Product::find($request->productId);
        $product->product_name = $request->product_name;
        $product->product_label = $request->product_label;
        $product->product_price = $request->product_price;
        $product->label_category = $request->label_category;
        $product->quantity = $request->quantity;
        $product->description = $request->description;

        if ($request->hasFile('image')) {
            $filePath = '/public/storage/product_image/' . $product->image;
            if (File::exists($filePath)) {
                file::delete($filePath);
            }
            $image = $request->file('image');
            $fileName = $image->hashName();
            $image->storeAs('/product_image', $fileName, 'public');
            $product->image = $fileName;
            $product->update();
        }
        $product->update();
        return response()->json($request->hasFile('image'));
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
        $user = User::where('role', 'client')->orderBy($sortName, $sortOrder)->paginate(3);
        return response()->json($user);
    }
    public function deleteUser(Request $request)
    {
        $user = User::find($request->id)->delete();
        return response()->json($user);
    }
    public function getUserStaff()
    {
        $data = User::where('role', 'staff')->paginate(9);
        return response()->json($data);
    }

    public function orderCategory()
    {
        $data = UserOrder::select('date_order')->orderBy('id', 'DESC')->distinct()->get();
        return response()->json($data);
    }



    public function getUserOrder(Request $request)
    {
        $sort = $request->query('sort', 'DESC');
        $order = $request->query('order', 'id');
        $data = DB::table('user_orders')
            ->leftJoin('users', 'users.id', '=', 'user_orders.user_id')
            ->leftJoin('products', 'products.id', '=', 'user_orders.order_id')
            ->select('users.*', 'user_orders.id as user_order_id', 'user_orders.*', 'products.*')
            ->orderBy("user_orders.$order", $sort)
            ->paginate(10);
        return response()->json($data);
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

    public function deleteOrder(Request $request)
    {
        $order = UserOrder::find($request->id)->delete();
        return response()->json($order);
    }
    public function updateAdminProfile(Request $request)
    {
        $user = User::find(Auth::user()->id);
        $user->first_name = $request->first_name;
        $user->middle_name = $request->middle_name;
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

    public function lowStockProduct()
    {
        $data = Product::where('quantity', '<=', 50)
            ->get();
        return response()->json($data);
    }
}
