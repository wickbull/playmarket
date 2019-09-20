<?php

namespace App\Http\Controllers\Admin;

// use App\Models\Lang;
use App\Models\Lang\Lang;
use App\Models\Lang\LangIndexName;



use App\Models\LangGlobalStructure;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LanguageController extends Controller
{
  public function lang() {
    $lang = Lang::paginate(50);
    return view('vendor.voyager.lang.lang', compact('lang'));
  }

  public function langAdd() {
    return view('vendor.voyager.lang.add-lang');
  }

  public function langStore(Request $request) {
    $lang = Lang::firstOrNew(array('name' => $request->name, 'code' => $request->code));
    $lang->save();
    return redirect('/admin/lang');
  }

  public function langEdit($id) {
    $lang = Lang::find($id);
    return view('vendor.voyager.lang.edit-lang', compact('lang'));
  }

  public function langSubmitEdit(Request $request, $lang) {
    if($request->default  == 'on'){ 
      Lang::where('default', 1)->update(['default' => 0]);
      $default = 1;
    } else {
      $default = 0;
    }
    $lang = Lang::find($lang)->update(['name'=>$request->name, 'code'=>$request->code, 'default'=>$default]);
    return redirect('/admin/lang');
  }

  public function langDelete($id) {
    $lang = Lang::find($id);
    if(!empty($lang->translate)) $lang->translate()->delete();
    $lang->delete();
    return redirect('/admin/lang');
  }



  public function index($id) {
    $lang = LangIndexName::get();
    $language = Lang::find($id);
    return view('vendor.voyager.lang.index.index', compact('lang','language'));
  }

  public function indexAdd(Request $request, $id) {
    $lang = LangIndexName::firstOrNew(['name' => $request->index]);
    $lang->save();
    return redirect()->back();
  }

  public function indexEdit(Request $request, $id, $index) {
    $lang = LangIndexName::find($index);
    return view('vendor.voyager.lang.index.edit-index', compact('lang'));
  }

  public function indexSubmitEdit(Request $request, $id, $index) {
    LangIndexName::find($index)->update(['name'=>$request->name]);
    return redirect("/admin/lang/$id/index");
  }

  public function indexDelete(Request $request, $id, $index) {
    $lang = LangIndexName::find($index);
    if(!empty($lang->structure())) $lang->structure()->delete();
    $lang->delete();
    return redirect()->back();
  }



  public function structure($id, $index) {
    $lang = LangIndexName::find($index);
    return view('vendor.voyager.lang.index.structure.structure', compact('lang', 'id'));
  }

  public function structureAdd(Request $request, $id, $index) {
    $lang = LangIndexName::find($index)->structure()->firstOrNew(['name' => $request->index]);
    $lang->save();
    return redirect()->back();
  }

  public function structureEdit(Request $request, $id, $index, $structure) {
    $lang = LangIndexName::find($index)->structure()->find($structure);
    return view('vendor.voyager.lang.index.structure.edit-structure', compact('lang'));
  }

  public function structureSubmitEdit(Request $request, $id, $index, $structure) {
    LangIndexName::find($index)->structure()->find($structure)->update(['name'=>$request->name]);
    return redirect("/admin/lang/$id/index/$index/structure");
  }

  public function structureDelete(Request $request, $id, $index, $structure) {
    LangIndexName::find($index)->structure()->find($structure)->delete();
    return redirect()->back();
  } 



  public function translate($id, $index, $structure) {
    $lang = LangIndexName::find($index)->structure()->find($structure);
    return view('vendor.voyager.lang.index.structure.translate.translate', compact('lang'));
  }

  public function translateAdd(Request $request, $id, $index, $structure) {
    $lang = LangIndexName::find($index)->structure()->find($structure)->langTranslate()->updateOrCreate(['lang_id' => $id],['name' => $request->index]);
    $lang->save();
    return redirect("/admin/lang/$id/index/$index/structure");
  }



  // public function editTranslation($id, $index, $structure) {
  //     $lang = LangIndexName::find($index)->structure()->find($structure);
  //     return view('vendor.voyager.lang.index.structure.translate.edit', compact('lang'));
  // }

}
