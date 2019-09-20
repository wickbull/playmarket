<?php

namespace App\Http\Controllers\Voyager\Controllers;

use App\Models\BlockIp;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\VoyagerBreadController as BaseControllers;

class VoyagerBreadController extends BaseControllers
{
    function update(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        Voyager::canOrFail('edit_' . $dataType->name);

        //Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->editRows);

        if ($val->fails()) return response()->json(['errors' => $val->messages()]);

        if (!$request->ajax()) {
            $data = call_user_func([$dataType->model_name, 'findOrFail'], $id);
            if ($request->input('is_block') == '1') $this->blockIp($request, $id);
            else $this->unBlockIp($id);
            if ($request->input('blocks')) $this->blocksPermission($request->input('blocks'), $id);
            $user = User::where('id', $id)->first();
            if (!empty($user)) {
                if ($request->has('is_block_payment')) $user->is_block_payment = 1;
                else $user->is_block_payment = 0;
                $user->save();
            }


            $this->insertUpdateData($request, $slug, $dataType->editRows, $data);

            if (!empty($user)) $user->update(['ip' => $request->ip]);


            return redirect()
                ->route("voyager.{$dataType->slug}.edit", ['id' => $id])
                ->with([
                    'message' => "Successfully Updated {$dataType->display_name_singular}",
                    'alert-type' => 'success',
                ]);
        }
    }

    private function blockIp($data, $id)
    {
        if (!empty($data['start_time'])) $from = $data['start_time'];
        if (!empty($data['end_time'])) $to = $data['end_time'];

        $block_ip = BlockIp::updateOrCreate(
            [
                'user_id' => $id,
                'ip' => $data['ip']],
            [
                'from' => isset($from) ? $from : Carbon::now(),
                'to' => isset($to) ? $to : Carbon::now()->addYears('10')]
        );
        User::where('id', $id)->update(['is_block' => 1]);
        $block_ip->save();
    }

    private function unBlockIp($id)
    {
        $user = User::where('id', $id);
        if (!empty($user)) $user->update(['is_block' => 0]);
        $ip = BlockIp::where('user_id',$id)->first();
        if (!empty($ip)) $ip->delete();
    }

    public function edit(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $block_ip = BlockIp::where('user_id', $id)->get();


        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        Voyager::canOrFail('edit_' . $dataType->name);

        $relationships = $this->getRelationships($dataType);

        $dataTypeContent = (strlen($dataType->model_name) != 0)
            ? app($dataType->model_name)->with($relationships)->findOrFail($id)
            : DB::table($dataType->name)->where('id', $id)->first(); // If Model doest exist, get data from table name

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        return view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'block_ip'));
    }

    public function blocksPermission($blocks, $id)
    {
//        dd($blocks);
        $user = User::find($id);
        $user->create_lot = isset($blocks['create_lot']) ? $blocks['create_lot'] : 0;
        $user->buy_lot = isset($blocks['buy_lot']) ? $blocks['buy_lot'] : 0;
        $user->get_money = isset($blocks['get_money']) ? $blocks['get_money'] : 0;

        $user->save();
    }
}
