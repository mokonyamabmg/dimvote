<?php

namespace App\Http\Controllers;

use App\Option;
use Illuminate\Http\Request;

class OptionController extends Controller
{
    
    public function getOptions($id)
    {
        $options = Option::where('poll_id', $id)->get();

        return response()->json($options, 200);
    }
}
