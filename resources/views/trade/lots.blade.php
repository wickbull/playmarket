@extends('layouts.app')

@section('content')

    <main>
        <div class="c-my-sales">
            <div class="container">
							<div class="c-my-sales__ttl">
									<h3 class="h3">Мои продажи</h3>
							</div>
								<div class="c-my-sales__actions">
								<div class="c-my-sales__filter">
                    <form class="js-form_check">
                        <div class="row">
                            <div class="col-lg-18 col-xs-24">
                                <div class="row">
                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">Номер</div>
                                            <div class="input-wrap">
                                                <input id="lot-number" type="number" name="my_sales_number" value=""
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">Покупатель</div>
                                            <div class="input-wrap">
                                                <input id="buyer_name" type="text" name="my_sales_buyer" value=""
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">Игра</div>
                                            <div class="select-wrap">
                                                <select id="game" title="Выбрать" name="my_sales_game"
                                                        class="selectpicker">
                                                    <option value="">Выбрать</option>
                                                    @foreach($games as $game)
                                                        <option value="{{$game['game']['id']}}">{{$game['game']['name']}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">Статус</div>
                                            <div class="select-wrap">
                                                <select id="active" title="Выбрать" name="my_sales_status"
                                                        class="selectpicker">
                                                    <option value="">Выбрать</option>
                                                    <option value="0">Закрыт</option>
                                                    <option value="1">Открытый</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                        <button type="button"
                                                class="c-my-sales__filter-submit btn btn_blue btn_block btn_upper text-center"
                                                id="sales-btn">
                                            Показать
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="c-my-sales__body">
                    <table class="c-my-sales__table">
                        <thead>
                        <tr>
                            <th class="col-md-1">Лот</th>
                            <th class="text-center col-md-4">Описание</th>
                            <th class="text-center col-md-2">Сервер</th>
                            <th class="text-center col-md-2">Статус</th>
                            <th class="text-center col-md-2">Сумма</th>
                        </tr>
                        </thead>
                        <tbody id="lots-block">
                        @each('trade.parts.lots-list', $my_lots, 'sale')
                        </tbody>
                    </table>
                </div>
								</div>
               
            </div>
        </div>
    </main>

@endsection

@section('scripts')
@endsection