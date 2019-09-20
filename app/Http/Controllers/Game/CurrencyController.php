<?php

namespace App\Http\Controllers\Game;

use App\Models\Currency;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class CurrencyController extends Controller
{
    /**
     * Index page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $currency = Currency::paginate(50);
        return view('vendor.voyager.currency.index', compact('currency'));
    }

    /**
     * View for edit
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function storeView()
    {
        return view('vendor.voyager.currency.add');
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
            'name' => 'required',
            'multiplier' => 'required|numeric',
        ]);


        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $currency = new Currency();
            $currency->name = $data['name'];
            $currency->unity = $data['unity'];
            $currency->multiplier = $data['multiplier'];
            if ($currency->save()) {
                Session::flash('flash_message_success', 'Currency saved');
            } else {
                Session::flash('flash_message_error', 'Currency not saved');
            }
            return redirect('/admin/currency');
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
        $currency = Currency::find($id);
        return view('vendor.voyager.currency.edit', compact('currency'));
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
            'name' => 'required',
            'multiplier' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            Session::flash('flash_message_error', 'Validation');
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        if (!$request->ajax()) {
            $currency = Currency::find($id);
            $currency->name = $data['name'];
            $currency->unity = $data['unity'];
            $currency->multiplier = $data['multiplier'];

            if ($currency->save()) {
                Session::flash('flash_message_success', 'Currency update');
            } else {
                Session::flash('flash_message_error', 'Currency not update');
            }
            return redirect('/admin/currency');
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
        $currency = Currency::find($id);

        if ($currency) {
            $currency->delete();
            Session::flash('flash_message_success', 'Currency deleted');
            return redirect('/admin/currency');
        }
        Session::flash('flash_message_error', 'Currency not deleted');
        return redirect('/admin/currency');
    }
}
