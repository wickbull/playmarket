if($('.collapse').length > 0){
    initCollapse();

}


function initCollapse() {
    // require(['bs_transition', 'bs_collapse'], function () {
    $('body').on('click', '.panel-heading a', function (event) {
        var th = $(this);
        var all = th.closest('.panel-group').find('.collapse');
        var current = th.closest('.panel').find('.collapse');
        all.not(current).collapse('hide').prev('.panel-heading').children('a').addClass('collapsed');
        current.collapse('toggle').prev('.panel-heading').children('a').toggleClass('collapsed');
        event.preventDefault();
    });
    $body.on('resize_xx resize_xs resize_sm_once', function (e) {
        $('body').find('.collapse-group .collapse').collapse('hide').removeClass('in').prev('.panel-heading').children('a').addClass('collapsed');
    });
    $body.on('resize_md_once resize_ml_once resize_lg_once', function (e) {
        $('body').find('.collapse-group .collapse.opened_default').collapse('show').addClass('in').prev('.panel-heading').children('a').removeClass('collapsed');
    });
    window.cust.resizer();
    // });
}