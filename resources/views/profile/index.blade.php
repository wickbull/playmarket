@extends('layouts.app')

@section('content')
    <main>
        <div class="c-cabinet">
            <div class="container">
                <div class="c-cabinet__header">
                    <div class="row">
                        <div class="col-lg-18 col-xs-24">
                            <div role="tablist" class="c-tab-nav xs-full">
                                <button type="button" class="c-tab-nav__trig visible-xs"><span>@lang(session("langId"), "profile", "profile", 43200)</span>
                                </button>
                                <ul class="c-tab-nav__drop h-list nav-user-item minimized">
                                    <li role="presentation"><a data-toggle="pill" role="tab" aria-controls="cabinet_lots" href="#cabinet_lots"><span>@lang(session("langId"), 'profile', 'my_lots', 43200)</span></a>
                                    </li>
                                    <li role="presentation"><a data-toggle="pill" role="tab"
                                                               aria-controls="cabinet_balance" href="#cabinet_balance"
                                        ><span>@lang(session("langId"), 'profile', 'balance', 43200)</span></a></li>
                                    <li role="presentation"><a data-toggle="pill" role="tab" aria-controls="cabinet_profile"  href="#cabinet_profile"
                                        ><span>@lang(session("langId"), 'profile', 'profile', 43200)</span></a>
                                    </li>
                                    <li role="presentation" class="active"><a  data-toggle="pill" role="tab"  aria-controls="cabinet_personal_data" href="#cabinet_personal_data"
                                        ><span>@lang(session("langId"), 'profile', 'personal_data', 43200)</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="c-cabinet__body">
                    <div class="tab-content">
                        <div id="cabinet_lots" role="tabpanel" class="tab-pane fade " tabindex="-1">
                            @include('profile.my-lots')
                        </div>
                        <div id="cabinet_balance" role="tabpanel" class="tab-pane fade " tabindex="-1">
                            @include('profile.parts.wallet', ['wallets' => $wallets])
                        </div>
                        <div id="cabinet_profile" role="tabpanel" class="tab-pane fade " tabindex="-1">
                            @include('profile.parts.cabinet-profile')
                        </div>
                        <div id="cabinet_personal_data" role="tabpanel" class="tab-pane fade active in" tabindex="-1">
                            @include('profile.parts.personal-data')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div id="modal-info" tabindex="-1" role="dialog" class="modal-prices modal fade modal_centered">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>
    @include('modals.modal-change-tel')
    @include('modals.modal-money')
    @include('modals.modal-prices')
    <div id="modal-change-email" tabindex="-1" role="dialog"
         class="modal-change modal-change-email modal fade modal_centered">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                    <h3 class="modal-title">@lang(session("langId"), 'modal', 'change_mail', 43200)</h3>
                </div>
                <div class="modal-body">
                    <form class="js-form_check" method="POST" action="{{ route('change-email') }}">
                        {{ csrf_field() }}
                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <div class="form-group__ttl">@lang(session("langId"), 'modal', 'password', 43200)</div>
                            <div class="input-wrap">
                                <input type="password" name="password" value="" required="required"
                                       class="form-control"/>
                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <div class="form-group__ttl">@lang(session("langId"), 'modal', 'mail', 43200)</div>
                            <div class="input-wrap">
                                <input type="email" name="email" value="" required="required" class="form-control"/>
                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-footer text-center">
                            <button type="submit" class="button btn btn_blue btn_upper">@lang(session("langId"), 'modal', 'save', 43200)</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="modal-confirm-email" tabindex="-1" role="dialog"
         class="modal-change modal-change-email modal fade modal_centered">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                    <h3 class="modal-title">@lang(session("langId"), 'modal', 'confirm_mail', 43200)</h3>
                </div>
                <div class="modal-body">
                    <form class="js-form_check" method="POST" action="{{ route('confirm-email') }}">
                        {{ csrf_field() }}
                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <div class="form-group__ttl">@lang(session("langId"), 'modal', 'password', 43200)</div>
                            <div class="input-wrap">
                                <input type="password" name="password" value="" required="required"
                                       class="form-control"/>
                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-footer text-center">
                            <button type="submit" class="btn btn_blue btn_upper">@lang(session("langId"), 'modal', 'save', 43200)</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="modal-change-pass" tabindex="-1" role="dialog"
         class="modal-change modal-change-pass modal fade modal_centered">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"></button>
                    <h3 class="modal-title">@lang(session("langId"), 'modal', 'change_password', 43200)</h3>
                </div>
                <div class="modal-body">
                    <form class="js-form_check" method="POST" action="{{ route('change-password') }}">
                        {{ csrf_field() }}
                        <div class="form-group">
                            <div class="form-group__ttl">@lang(session("langId"), 'modal', 'old_password', 43200)</div>
                            <div class="input-wrap">
                                <input type="password" name="password" value="" required="required"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('change-password') ? ' has-error' : '' }}">
                            <div class="form-group__ttl">@lang(session("langId"), 'modal', 'new_password', 43200)</div>
                            <div class="input-wrap">
                                <input type="password" name="change-password" value="" required="required"
                                       id="change-password" class="form-control"/>
                                @if ($errors->has('change-password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('change-password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group{{ $errors->has('confirmed') ? ' has-error' : '' }}">
                            <div class="form-group__ttl">@lang(session("langId"), 'modal', 'confirm_password', 43200)</div>
                            <div class="input-wrap">
                                <input type="password" name="confirmed" value="" required="required"
                                       class="form-control"/>
                                @if ($errors->has('confirmed'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('confirmed') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-footer text-center">
                            <button type="submit" class=" button btn btn_blue btn_upper">@lang(session("langId"), 'modal', 'save', 43200)</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


@endsection

@section('scripts')
    @parent
    <script src="{{ asset('js/search.js') }}"></script>
    <script>

        $(document).ready(function () {
            $("#sms-code").click(function (e) {
                e.preventDefault();
                let $button = $(this);
                let number = $("#phone").val();
                $.ajax({
                    type: "get",
                    url: "/get-code",
                    data: {
                        phone: number, // < note use of 'this' here
                    },
                    success: function (result) {
                        $("<br><span>@lang(session('langId'), 'form_message', 'sms_send_message', 43200)</span>").insertAfter($button);
                        $.ajax({
                            type: "get",
                            url: result,
                            dataType: 'JSONP',
                            async: false,
                            crossDomain: true,
                            success: function (result) {
//                                alert('success');
//                                console.log(result);
                            }
                        });
                    },
                    error: function (result) {
                        alert(JSON.parse(result.responseText).error)
                        // alert(result);
                    }
                });
            });
//            var id = $('#edit-proposition').val();
            $(document).on("click", "#edit-proposition", function (e) {
                e.preventDefault();
                var id = $(this).val();
                $.ajax({
                    type: "get",
                    url: "/edit-sell-proposition/" + id,
                    data: {},
                    success: function (data) {
                        $("#getCode").html(data);
                        $("#modal-form").attr("action", "/edit-sell-proposition/" + id);
                        $("#getCodeModal").modal('show');
                        initSubtag();
                        $('.selectpicker').selectpicker('refresh');
                    },
                    error: function (result) {
                        //                alert('error');
                    }
                });
            });

            function initSubtag() {
                $('.subtag-pick').on('change', function () {
                    let $this = $(this);

                    let values = $this.find('option').map(function () {
                        return parseInt($(this).val());
                    }).get();

                    $.each(values, function (key, value) {
                        if ($('.subtag-data[data-parent="' + value + '"]').length > 0)
                            $('.subtag-data[data-parent="' + value + '"]').find('option').each(function () {
                                if ($(this).val()) values.push(parseInt($(this).val()));
                            });
                    });

                    $('.js-form_check .subtag-data').each(function (index) {
                        if (values.includes($(this).data('parent'))) {
                            $(this).hide();
                            $(this).hide();

                            $(this).find($('.subtag-pick')).val(null).prop('disabled', true);
                        }
                        if ($(this).data('parent') == $this.val()) {
                            $(this).show();
                            $(this).find($('.subtag-pick')).prop('disabled', false);
                        }
                    });
                    $('.selectpicker').selectpicker('refresh');
                });
            }


            $(document).on("click", "#edit-currency-proposition", function (e) {
                e.preventDefault();
                var id = $(this).val();
                $.ajax({
                    type: "get",
                    url: "/edit-currency-sell-proposition/" + id,
                    data: {},
                    success: function (data) {
                        $("#getCode").html(data);
                        $("#modal-form").attr("action", "/edit-currency-sell-proposition/" + id);
                        $("#getCodeModal").modal('show');
                        initSubtag();
                        $('.selectpicker').selectpicker('refresh');
                    },
                    error: function (result) {
                        //                alert('error');
                    }
                });
            });
            $(document).on("click", "#resetPass", function (e) {
                e.preventDefault();
                $('#resetPass').attr("disabled", "disabled");
                $.ajax({
                    type: "get",
                    url: "/reset-pass",
                    data: {},
                    success: function (data) {
                        console.log(data)
                        if (data.error) {
                            $('#ressPassMsg').html('<div class="alert alert-danger col-sm-24 text-center" >' + data.message + '</div>');
                            // location.reload('/');
                        }
                        else {
                            $('#ressPassMsg').html('<div class="alert alert-success col-sm-24 text-center" >' + data.message + '</div>');

                        }

                    },
                    error: function (result) {
                        //                alert('error');
                    }
                });
            });

            function initAjax() {
                $('.button-remove').on('click', function (e) {
                    e.preventDefault();
                    $(this).closest('.c-balance__purses-item').remove();
                });

                $('.c-balance__operations-item').on('click', function (e) {
                    let $this = $(this),
                        id = $(this).data('id'),
                        $modal = $('#modal-info');
                    if(!$(e.target).is('button')){
                        $modal.html();
                        $.ajax({
                            type: "POST",
                            url: "{{route('invoice.info')}}",
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

            }

            initAjax();


            $('.button-add').on('click', function (e) {
                e.preventDefault();

                let $item = '<div class="c-balance__purses-item"> <div class="row"> <div class="col-sm-9 col-xs-9 col-xx-24"> <div class="form-group"> <div class="select-wrap"> <select title="Выбрать" name="currency_id[]" class="selectpicker" min="2" max="25">' +
                        @foreach($commissions->where('can_withdrawal','1') as $item)
                            '<option value="{{$item->id}}">{{$item->title}}</option>' +
                        @endforeach
                            '</select></div></div></div><div class="col-sm-11 col-xs-9 col-xx-24"><div class="form-group"><div class="input-wrap">' +
                    '<input type="text" name="wallet_id[]" value="" class="form-control"/></div></div></div><div class="col-sm-4 col-xs-6 col-xx-24"><div class="c-balance__purses-item-action"><button type="button" data-action-type="remove" class="purse-action-btn button-remove"> <span>удалить</span></button></div> </div> </div></div>'
                $('.current__wallet').append($item);
                $('.current__wallet').find('.selectpicker').selectpicker('refresh');
                initAjax();
            })

            let wallet = {!! json_encode($wallets->toArray()) !!};

            $(document).on('change', '#currency-select', function () {
                let val = $(this).val();
                let text = $(this).find(':selected').data('commission');
                $('.commission-value').text('Комиссия ' + text + '%');
                commisionCalculation();

                var $option = '';

                Object.keys(wallet).forEach(function (c) {
                    if ((wallet[c]['currency_id']) == val) {
                        $option += '<option value="' + wallet[c]['wallet_id'] + '">' + wallet[c]['wallet_id'] + '</option>'
                    }
                });
                let $user_wallet = $('select#wallet-choose');
                $user_wallet.empty();
                if ($option.length > 0) {
                    $user_wallet.append($option);
                } else {
                    $user_wallet.append('<option selected disabled value="">@lang(session("langId"), "modal", "choose_output_method", 43200)</option>');
                }
                $user_wallet.selectpicker('refresh');

            })

            // $(function () {
            //     $('.selectpicker#wallet-choose')
            //         .append(
            //             $('<option/>')
            //                 .addClass('divider')
            //                 .data('divider', true)
            //         ).append(
            //         $('<option/>')
            //             .addClass('additem')
            //             .data('content',
            //                 "<input class='form-control' type=text onKeyDown='event.stopPropagation();' onKeyPress='addSelectInpKeyPress(this,event)' onClick='event.stopPropagation()' placeholder='Add item'> <span class='glyphicon glyphicon-plus addnewicon' onClick='addSelectItem(this,event,1);'></span>"
            //             )
            //     ).selectpicker('refresh');
            // });


            function commisionCalculation() {
                let val = $('#payment_sum').val();
                let commission = parseFloat($('#currency-select').find(':selected').data('commission'));
                if (commission != undefined) {
                    let total = val * commission / 100;
                    $('#payment_sum_total').val(val - total);
                }
            }

            $(document).on('keyup', '#payment_sum', function () {
                commisionCalculation();
            })

            /*
                         * Calculate price with percent
                         */
            $(document).on('click', '.btn-info', function (e) {
                e.preventDefault();
                var id = $(this).attr('id');
                var price = $('#server-price-' + id).val();
                var arr = $('.price-calculate');
                arr.each(function (index, item) {
                    var content = $(this);
                    var value = (parseFloat(content.data('commission')) * price) + parseFloat(price * content.data('coefficient') / 100);
                    if (isNaN(value))
                        content.html('0 &#8381;');
                    else
                        content.find('.price-value').html(value.toFixed(2));
                });
                $('#getCodeModal').modal('hide');
                $('#modal-prices').modal('show');

            });

            $(document).on('click', '#modal-prices .close', function (e) {
                console.log('click');
                e.preventDefault();
                $('#modal-prices').modal('hide');
                $('#getCodeModal').modal('show');

            });

            $("#payout-money").on("click", function (e) {
                e.preventDefault();
                $.ajax({
                    type: "get",
                    url: "{{route('get.profile.wallet')}}",
                    data: {},
                    success: function (data) {
                        $("#modal-money .modal-body").html(data);
                        $("#modal-money").modal('show');
                        $('.selectpicker').selectpicker('refresh');
                    },
                    error: function (result) {
                        //                alert('error');
                    }
                });
            });

            @if(session()->has('phone_need'))
            $("#modal-change-tel").modal('show');
            @endif


            // $('.wallet-choose').on('change', function () {
            //     console.log($(this).val())
            // })
        });
    </script>
@endsection