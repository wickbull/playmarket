<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lang\Lang;

class LangController extends Controller
{
   	public function index(Request $request) {
   		// dump($request->lang);
   		session(['langId' => $request->lang]);
   		// Lang::where('default', 1)->update(['default' => 0]);
   		// Lang::find($request->lang)->update(['default' => 1]);
   		return redirect()->back();
   	}
}
