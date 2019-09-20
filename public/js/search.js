$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

$('#search').on('keyup', function () {
    let value = $(this).val();
    let all_game = $('#all-game');
    let search = $('#search-game');

    if (value.length > 0) {
        all_game.find('.row').removeClass('row').addClass('row-temp').hide();
        search.show();
        $.ajax({
            type: 'POST',
            url: '/search',
            data: {
                'search': value,
            },
            success: function (data) {
                $('#search-game').html(data);
                initGameList();
            }
        });

    } else {
        search.empty().hide();
        all_game.find('.row-temp').removeClass('row-temp').addClass('row').show();
        // initGameList();
    }
});
//search for game tags


$('form.filter .selectpicker').change(function (e) {
    var value = $(e.target).val();

    var arr = value.split('-');
    var server = $('#server-' + arr[0] + ' option:selected').val();

    var tag_id = arr[0];
    // var subtag_id = 0;
    // var meta_id = 0;

    var serverArr = server.split('-');
    var server_id = serverArr[1];

    $.ajaxSetup({
        header: $('meta[name="_token"]').attr('content')
    });
    if (arr.length == 3) {
        tag_id = arr[0];
        var subtag_id = arr[1];
        var meta_id = arr[2];
    }
    $('.items-list-' + tag_id + '').html('');
    $.ajax({
        type: 'GET',
        url: '/search-game-lots',
        data: {
            'tag_id': tag_id,
            'server_id': server_id,
            'subtag_id': subtag_id,
            'meta_id': meta_id
        },
        success: function (data) {
            $('.items-list-' + tag_id + '').html(data.html);
            // console.log(data.html);
            // $(".collapse").collapse();
            // loadComponent({
            //     name: '.collapse',
            //     req: ['js-collapse', 'bs_collapse']
            // });

            var $body = $('body');

            function collapse_it(th) {
                var all = th.closest('.collapse-group').find('.collapse');
                var current = th.closest('.panel').find('.collapse');
                all.not(current).collapse('hide').prev('.panel-heading').children('a').addClass('collapsed');
                current.collapse('toggle').prev('.panel-heading').children('a').toggleClass('collapsed');
                event.preventDefault();
            }

            $('.panel-heading > a').on('click', function (event) {
                collapse_it($(this));
            });
            $('.panel-heading').on('click', function (event) {
                if ($(event.target).closest('a, button').length == 0) {
                    collapse_it($(this));
                }
                ;
            });

            $('.collapse').on('shown.bs.collapse', function () {
                var th_panel = $(this).closest('.panel');
                if (breakPoint == 'xx' || breakPoint == 'xs') {
                    $body.animate({scrollTop: th_panel.offset().top - 5 - $('.c-header').height()}, 500, 'swing');
                } else {
                    $body.animate({scrollTop: th_panel.offset().top - 5}, 500, 'swing');
                }
                ;
            });
        }
    });

    // console.log(tag_id, subtag_id, meta_id);
});


$('#sales-btn').click(function () {
    console.log('sales-btn');
    var arr = {};
    $('#lots-block').html('');
    var lotNumber = document.getElementById('lot-number').value;
    if (lotNumber != '') {
        arr['id'] = lotNumber;
    }
    var buyerName = document.getElementById('buyer_name').value;
    if (buyerName != '') {
        arr['buyer_name'] = buyerName;
    }

    var game = document.getElementById('game').value;
    if (game != '') {
        arr['game_id'] = game;
    }
    var active = $('#active option:selected').val();
    if (active != '') {
        arr['status'] = active;
    }
    $.ajax({
        type: "get",
        url: "/search-sales",
        data: arr,
        success: function (data) {
            $('#lots-block').html(data.html);
        },
        error: function (result) {
            //                alert('error');
        }
    });
});

/* Override by AP */

//Search in user profile
$('.profile-lot-filter-form select').on('change', function () {
    let data = $(this).closest('form').serialize();
    console.log(data);
    $.ajax({
        type: "get",
        url: "/search-lot",
        data: data,
        success: function (data) {
            $('#lots-block').html(data);
        },
        error: function (result) {
            console.log(result);
        }
    });
});

console.log('search');


