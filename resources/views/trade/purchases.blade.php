@extends('layouts.app')

@section('content')

    <main>
        <div class="c-my-purchases">
            <div class="container">
                <div class="c-my-sales__ttl">
                    <h3 class="h3">@lang(session("langId"), 'head_menu', 'my_purchases', 43200)</h3>
                </div>
                <div class="c-my-sales__body">
                    <table class="c-my-sales__table">
                        <thead>
                        <tr>
                            <th>@lang(session("langId"), 'sales', 'order', 43200)</th>
                            <th>@lang(session("langId"), 'sales', 'description', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'sales', 'seller', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'sales', 'summ', 43200)</th>
                            <th class="text-center">@lang(session("langId"), 'sales', 'status', 43200)</th>
                        </tr>
                        </thead>
                        <tbody>
                        @each('trade.parts.purchases-item',$purchases->where('status','1'),'purchase')
                        @each('trade.parts.purchases-item',$purchases->where('status','!=','1'),'purchase')
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

@endsection

<div class="modal fade" tabindex="-1" id="update_modal" role="dialog">
    <div class="modal-dialog modal-sm">
        <div class="modal-content text-center">
            <div class="modal-header">
                <span>@lang(session("langId"), 'purchases', 'close_order', 43200)</span>
                {{--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--}}
                {{--aria-hidden="true">&times;</span></button>--}}
                {{--<h4 class="modal-title"><i class="voyager-trash"></i> </h4>--}}
            </div>
            <div class="modal-body ">
                <form id="close_form" method="POST">
                    {{ csrf_field() }}
                    <button type="submit" class="btn btn_blue button">@lang(session("langId"), 'purchases', 'yes', 43200)</button>
                </form>
                <button type="button" class="btn btn_blue button" data-dismiss="modal">@lang(session("langId"), 'purchases', 'no', 43200)</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div id="modal-info" tabindex="-1" role="dialog" class="modal-prices modal fade modal_centered">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        </div>
    </div>
</div>

@section('scripts')
    @parent
    <script>
        $(".status-btn").click(function (e) {
            var id = e.target.id;
            $("#close_form").attr("action", "/update-trade/" + id);
            $("#disable_trade_form").attr("action", "/update-trade/" + id);

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

