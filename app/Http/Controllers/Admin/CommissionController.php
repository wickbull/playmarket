<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PriceCommission;
use Illuminate\Http\Request;
use Session;
use Validator;

class CommissionController extends Controller
{
    /**
     * Index page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $commission = PriceCommission::paginate(50);
        return view('vendor.voyager.commission.index', compact('commission'));
    }

    /**
     * View for edit
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function storeView()
    {
        return view('vendor.voyager.commission.add');
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
            'name' => 'required|unique:currencies',
            'multiplier' => 'required|numeric',
            'site' => 'required|numeric|max:100',
            'payment' => 'required|numeric|max:100',
            'withdrawal' => 'required|numeric|max:100',
            'coefficient' => 'required|numeric|max:100000',
            'other' => 'required|numeric|max:100',
            'output_commission' => 'nullable|numeric|between:0,100',
            'can_withdrawal' => 'nullable|boolean'
        ]);


        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $commission = new PriceCommission();
            if ($commission->firstOrCreate($request->only('title', 'site', 'payment', 'withdrawal', 'other', 'coefficient', 'is_active', 'output_commission', 'can_withdrawal'))) {
                Session::flash('flash_message_success', 'commission saved');
            } else {
                Session::flash('flash_message_error', 'commission not saved');
            }
            return redirect('/admin/commission');
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
        $commission = PriceCommission::find($id);
        return view('vendor.voyager.commission.edit', compact('commission'));
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
            'title' => 'required|unique:currencies,name,' . $id . '',
            'is_active' => 'nullable|boolean',
            'coefficient' => 'required|numeric',
            'site' => 'required|numeric|max:100',
            'payment' => 'required|numeric|max:100',
            'withdrawal' => 'required|numeric|max:100',
            'other' => 'required|numeric|max:100',
            'output_commission' => 'required|numeric|between:0,100',
            'can_withdrawal' => 'nullable|boolean'
        ]);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $commission = PriceCommission::find($id);
            if ($commission->update($request->only('title', 'site', 'payment', 'withdrawal', 'coefficient', 'other', 'is_active', 'output_commission', 'can_withdrawal'))) {
                Session::flash('flash_message_success', 'commission update');
            } else {
                Session::flash('flash_message_error', 'commission not update');
            }
            return redirect('/admin/commission');
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

    }
}
