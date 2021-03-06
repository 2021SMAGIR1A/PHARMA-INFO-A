<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;

class UserController extends Controller
{
    //
    function checkuser(Request $request){
        $request->validate([
            'name' => 'required',
            'password' => 'required|min:8|max:30'
        ],
        [
            'name.required'=>"Le nom d'utilidateur est un champ requis",
            'password.min' => "Le mot de passe doit avoir au moins 8 caractères",
            'password.required'=>"Le mot de passe est un champ requis"
        ]);

        $creds = $request->only('name','password');
        if (Auth::guard('web')->attempt($creds)) {
            return redirect()->route('dashboard.index');
        }
        else{
            return redirect()->route('login');
        }
    }
}
