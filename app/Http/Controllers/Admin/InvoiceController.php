<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Invoice;
use App\Models\SiteWallet;
use App\User;
use Illuminate\Http\Request;
use YandexMoney\API;

class InvoiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Invoice $invoice)

    {
        $paginate = 30;
        $invoices = $invoice->getAllP($paginate);
        return view('vendor.voyager.invoice.index', compact('invoices'));
    }

    public function yandexOauth(Request $request, $id)
    {
        $key = SiteWallet::find($id);
        return redirect(API::buildObtainTokenUrl($key->api_key, route('yandex-oauth'), [$request->param]));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Invoice $invoice, $user_id)
    {
        $user = User::find($user_id);
        $paginate = 30;
        $invoices = $invoice->getAllUserPayment($user_id, $paginate);
        return view('vendor.voyager.invoice.user', compact('user', 'invoices'));

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
