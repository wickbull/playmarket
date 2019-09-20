<?php

namespace App\Http\Controllers\Page;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use TCG\Voyager\Models\Page;

class PageController extends Controller
{
    public function index($slug)
    {
        $page = Page::where('slug', $slug)->first();
        return view('pages.about', compact('page'));
    }
}
