(function () {
    var $body = $('body');

    function collapse_it(th) {
        var all = th.closest('.collapse-group').find('.collapse');
        var current = th.closest('.panel').find('.collapse');
        all.not(current).collapse('hide').prev('.panel-heading').children('a').addClass('collapsed');
        current.collapse('toggle').prev('.panel-heading').children('a').toggleClass('collapsed');
        event.preventDefault();
    }

    $body.on('click', '.panel-heading > a', function (event) {
        collapse_it($(this));
    });
    $body.on('click', '.panel-heading', function (event) {
        if ($(event.target).closest('a, button').length == 0) {
            collapse_it($(this));
        };
    });

    $body.on('shown.bs.collapse', '.collapse', function () {
        var th_panel = $(this).closest('.panel');
        if (breakPoint == 'xx' || breakPoint == 'xs') {
            $('body,html').animate({scrollTop: th_panel.offset().top - 5 - $('.c-header').height()}, 500, 'swing');
        } else {
            $('body,html').animate({scrollTop: th_panel.offset().top - 5}, 500, 'swing');
        };
    });
})();