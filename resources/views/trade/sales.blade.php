@extends('layouts.app')

@section('content')

    <main>
        <div class="c-my-sales">
            <div class="container">
                <div class="c-my-sales__ttl">
                    
                    <h3 class="h3">@lang(session("langId"), 'head_menu', 'my_sales', 43200)</h3>
								</div>
								<div class="c-my-sales__actions">
								<div class="c-my-sales__filter">
									<div class="c-my-sales__filter-title">
										<h3>@lang(session("langId"), 'sales', 'filter', 43200)</h3>
									</div>
                    <form class="js-form_check">
                        <div class="row">
                            <div class="col-lg-24 col-xs-24">
                                <div class="row">
                                    <div class="col-sm-8 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">@lang(session("langId"), 'sales', 'number', 43200)</div>
                                            <div class="input-wrap">
                                                <input id="lot-number" type="number" name="my_sales_number" value=""
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-24 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">@lang(session("langId"), 'sales', 'customer', 43200)</div>
                                            <div class="input-wrap">
                                                <input id="buyer_name" type="text" name="my_sales_buyer" value=""
                                                       class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-24 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">@lang(session("langId"), 'sales', 'game', 43200)</div>
                                            <div class="select-wrap">
                                                <select id="game" title="@lang(session('langId'), 'sales', 'choose', 43200)" name="my_sales_game"
                                                        class="selectpicker">
                                                    <option value="">@lang(session("langId"), 'sales', 'choose', 43200)</option>
                                                    @foreach($games as $game)
                                                        <option value="{{$game['game']['id']}}">{{$game['game']['name']}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-24 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">@lang(session("langId"), 'sales', 'status', 43200)</div>
                                            <div class="select-wrap">
                                                <select id="active" title="@lang(session('langId'), 'sales', 'choose', 43200)" name="my_sales_status"
                                                        class="selectpicker">
                                                    <option value="">@lang(session("langId"), 'sales', 'choose', 43200)</option>
                                                    <option value="0">@lang(session("langId"), 'sales', 'closed', 43200)</option>
                                                    <option value="1">@lang(session("langId"), 'sales', 'opened', 43200)</option>
                                                    <option value="3">@lang(session("langId"), 'sales', 'return', 43200)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-24 col-xs-12 col-xx-24">
                                        <div class="form-group">
                                            <div class="form-group__ttl">@lang(session("langId"), 'sales', 'status', 43200)</div>
                                            <div class="select-wrap">
                                                <select id="active" title="@lang(session('langId'), 'sales', 'choose', 43200)" name="my_sales_status"
                                                        class="selectpicker">
                                                    <option value="">@lang(session("langId"), 'sales', 'choose', 43200)</option>
                                                    <option value="0">@lang(session("langId"), 'sales', 'closed', 43200)</option>
                                                    <option value="1">@lang(session("langId"), 'sales', 'opened', 43200)</option>
                                                    <option value="3">@lang(session("langId"), 'sales', 'return', 43200)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-24 col-xs-12 col-xx-24">
                                        <button type="button"
                                                class="c-my-sales__filter-submit btn btn_blue btn_block btn_upper text-center"
                                                id="sales-btn">
                                            @lang(session("langId"), 'sales', 'show', 43200)
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
                            <th>@lang(session("langId"), 'sales', 'order', 43200)</th>
                            <th>@lang(session("langId"), 'sales', 'description', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'sales', 'customer', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'sales', 'status', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'sales', 'summ', 43200)</th>
                        </tr>
                        </thead>
                        <tbody id="lots-block">
                        @include('trade.parts.sales-list', ['sales' => $sales->where('status','1') ])
                        @include('trade.parts.sales-list', ['sales' => $sales->where('status','!=','1') ])
                        </tbody>
                    </table>
                </div>
								</div>
                
            </div>
        </div>
    </main>
    <div class="modal fade" tabindex="-1" id="update_modal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content text-center">
                <div class="modal-header">
                    <span>@lang(session("langId"), 'sales', 'back_money_to_saler', 43200)</span>
                    {{--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--}}
                    {{--aria-hidden="true">&times;</span></button>--}}
                    {{--<h4 class="modal-title"><i class="voyager-trash"></i> </h4>--}}
                </div>
                <div class="modal-body ">
                    <div class="form-group">
                        <form id="close_form" method="POST">
                            {{ csrf_field() }}
                            <button type="submit" class="btn btn_blue">@lang(session("langId"), 'purchases', 'yes', 43200)</button>
                        </form>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn_blue " data-dismiss="modal">@lang(session("langId"), 'purchases', 'no', 43200)</button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


    <div id="modal-info" tabindex="-1" role="dialog" class="modal-prices modal fade modal_centered">
        <div  class="modal-dialog modal-lg">
            <div class="modal-content">
            </div>
        </div>
    </div>

@endsection

@section('scripts')
    @parent
    <script src="{{ asset('js/search.js') }}"></script>
    <script>
        $(".status-btn").click(function (e) {
            var id = e.target.id;
            $("#close_form").attr("action", "/refuse-money-trade/" + id);
            $("#disable_trade_form").attr("action", "/refuse-money-trade/" + id);

        });

        $('.c-my-sales__item').on('click', function (e) {
            let $this = $(this),
                id = $(this).data('id'),
                $modal = $('#modal-info');
            if (!$(e.target).is('button') && !($(e.target).is('a') && !$(e.target).hasClass('show-info'))) {
                $modal.html();
                $.ajax({
                    type: "POST",
                    url: "{{route('trade.info')}}",
                    data: {
                        _token: "{{csrf_token()}}",
                        id: id
                    },
                    success: function (data) {
                        $modal.find('.modal-content').html(data);
                        $modal.modal('show');
                    },
                    error: function (result) {
                        alert('error');
                    }
                });
            }

        })

    </script>
@endsection