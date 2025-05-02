<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;

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
    public function user()
    {
        return Auth::user();
    }
    public function logout (Request $request) {
        Cookie::queue(Cookie::forget('usr_tkn'));
        Cookie::queue(Cookie::forget('username'));
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
    }

}
