<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SiteWallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Session;
use Validator;

class SiteWalletController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $wallets = SiteWallet::orderBy('keyword', 'DESC')->paginate(50);
        return view('vendor.voyager.site_wallet.index', compact('wallets'));
    }

    /**
     * View for edit
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function storeView()
    {
        return view('vendor.voyager.site_wallet.add');
    }

    /**
     * Create action
     *
     * @param Request $request
     * @return $this
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data, [
            'title' => 'required|string|max:254',
            'keyword' => 'required|string|max:20',
            'api_key' => 'required|string|max:254',
            'secret_key' => 'nullable|string|max:254',
            'additional_field' => 'nullable|string|max:254',
            'wallet_key' => 'nullable|string|max:254',
            'is_active' => 'nullable|boolean',
        ]);


        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            if ($request->has('is_active') && $request->is_active == '1') {
                $wallets = SiteWallet::where('keyword', $request->keyword)
                    ->get();
                foreach ($wallets as $item) $item->update(['is_active' => '0']);
            }

            $wallet = new SiteWallet();
            if (!$request->has('is_active'))
                $request->merge(['is_active' => '0']);
            if ($request->has('secret_key')) $request->merge(['secret_key' => Crypt::encrypt($request->secret_key)]);
            if ($request->has('additional_field')) $request->merge(['additional_field' =>  Crypt::encrypt($request->additional_field)]);
            if ($wallet->firstOrCreate($request->only('title', 'additional_field', 'keyword', 'api_key', 'secret_key', 'wallet_key', 'is_active'))) Session::flash('flash_message_success', 'Ключ успешно додано');
            else Session::flash('flash_message_error', 'Ключ не додано');
            return redirect('/admin/site/wallet');
        }
    }

    /**
     * View for update
     *
     * @param $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function updateView($id)
    {
        $data = SiteWallet::find($id);
        return view('vendor.voyager.site_wallet.edit', compact('data'));
    }

    /**
     * Update action
     *
     * @param $id
     * @param Request $request
     * @return $this
     */
    public function update($id, Request $request)
    {
        $data = $request->all();
        $validator = Validator::make($data, [
            'title' => 'required|string|max:254',
            'keyword' => 'required|string|max:20',
            'api_key' => 'required|string|max:254',
            'secret_key' => 'nullable|string|max:254',
            'additional_field' => 'nullable|string|max:254',
            'wallet_key' => 'nullable|string|max:254',
            'is_active' => 'nullable|boolean',
        ]);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            if ($request->has('is_active') && $request->is_active == '1') {
                $wallets = SiteWallet::where('keyword', $request->keyword)
                    ->get();
                foreach ($wallets as $item) $item->update(['is_active' => '0']);
            }
            $wallet = SiteWallet::find($id);
            if (!$request->has('is_active')) $request->merge(['is_active' => '0']);
            if ($request->has('secret_key')) $wallet->update(['secret_key' => Crypt::encrypt($request->secret_key)]);
            if ($request->has('additional_field')) $wallet->update(['additional_field' => Crypt::encrypt($request->additional_field)]);

            if ($wallet->update($request->only('title', 'keyword', 'api_key', 'wallet_key', 'is_active'))) Session::flash('flash_message_success', 'Ключ обновленно');
             else Session::flash('flash_message_error', 'Ключ не обновленно');
            return redirect('/admin/site/wallet');
        }
    }

    /**
     * Delete action
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function destroy($id)
    {
        $site_wallet = SiteWallet::destroy($id);
        return back();
    }
}