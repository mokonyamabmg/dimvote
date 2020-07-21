<?php

namespace App\Http\Controllers;

use App\User;
use JWTAuth;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;

class UserController extends Controller
{


    public function signUp(Request $request)
    {

        $this->validate($request, [
            'wallet_address' => 'required|unique:users',
            'email' => 'required|unique:users',
            'password' => 'required'
        ]);

        $user = new User();

        $user->wallet_address = $request->wallet_address;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);

        $user->save();

        return response()->json([
            'message' => 'Poll Created Successfuly',
        ], 200);
    }

    public function signin(Request $request)
    {
        $this->validate($request, [
            'wallet_address' => 'required',
            'password' => 'required'
        ]);


        $user = User::where('wallet_address', $request->wallet_address)->first();

        // grab credentials from the request
        $credentials = $request->only('wallet_address', 'password');

        try
        {
            // attempt to verify the credentials and create a token for the user
            if(!$token = JWTAuth::attempt($credentials))
            {
                return response()->json([
                    'error' => 'Invalid Credentials'
                ],401);
            }
        }catch(JWTException $e)
        {
            response()->json([
                'error' => 'Could Not Create Token'
            ], 500);
        }

        return response()->json([
            'token' => $token,
            'userId' => $user->id
        ], 200);
    }
}
