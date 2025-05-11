<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function signup(Request $request)
    {
        $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|unique:users,email|email',
            'password' => 'required|string|min:8'
        ]);
        $user = new User();
        $user->first_name = $request->first_name;
        $user->middle_name = $request->middle_name;
        $user->last_name = $request->last_name;
        $user->address = $request->address;
        $user->email = $request->email;
        $user->role = 'client';
        $user->password = bcrypt($request->password);
        $user->save();
        return response()->json($user);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        try {
            if (!Auth::attempt($request->only('email', 'password'))) {
                return response()->json([
                    'message' => 'Invalid Credentials'
                ], 404);
            } else {
                $user = Auth::user();
                $token = $user->createToken('token for' . $user->id)->plainTextToken;
                return response()->json('login succesful')->cookie('usr_tkn', $token, 24 * 6 * 7, null, null, true, true);
            }
        } catch (\Throwable $th) {
            Auth::logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();
        }
    }

    public function updateAdminAccount (Request $request){
        $user = new User();
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
        
    }
    public function user()
    {
        return Auth::user();
    }

    public function changePassword (Request $request) {
            $request->validate([
                'current_password' => 'required',
                'password' => 'required|confirmed|min:8|string',
                'password_confirmation' => 'required|string',
            ]);
        $auth = Auth::user();
	// The passwords matches
        if (!Hash::check($request->current_password, $auth->password)) 
        {
            return response()->json([
                'messages' => 'current password is not matched'
            ], 400);
        }

// Current password and new password same
        if (strcmp($request->get('current_password'), $request->password) == 0) 
        {
            return response()->json([
                "error" => "New Password cannot be same as your current password."
            ],400);
        }

        $user =  User::find($auth->id);
        $user->password =  bcrypt($request->password);
        $user->save();
        Auth::login($user); 
        return response()->json([
            'message' => 'password change successfuly'
        ],200);
    }
    

    
    public function logout (Request $request) {
        Cookie::queue(Cookie::forget('usr_tkn'));
        Cookie::queue(Cookie::forget('username'));
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
    }

}
