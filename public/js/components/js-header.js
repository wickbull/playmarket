(function () {
    var $html = $('html');
    var $body = $('body');
    var $header__menu = $('.c-header__menu');

    // click outside the block
    $body.on('click', function (e) {
        if($(e.target).closest('.c-header__menu-trig, .c-header__menu, .modal').length === 0) {
            hideBlock($('.c-header__menu-trig'), $header__menu);
        };
        if($(e.target).closest('.c-header__help-trig, .c-header__help-drop').length === 0) {
            hideBlock($('.c-header__help-trig'), $('.c-header__help-drop'));
        };
        if($(e.target).closest('.c-header__user-trig, .c-header__user-drop').length === 0) {
            hideBlock($('.c-header__user-trig'), $('.c-header__user-drop'));
        };
    });

    $body.on('resize_xx_once resize_xs_once resize_sm_once resize_md_once resize_lg_once', function(){
        if ($body.hasClass('scroll_disabled')) {
            hideBlock($('.c-header__menu-trig'), $header__menu);
        };
    });
    $header__menu.on('hideBlock', function(e) {
        if ($(e.target).hasClass('c-header__menu')) {
            enable_scroll();
        };
    });
    $header__menu.on('showBlock', function(e) {
        if ($(e.target).hasClass('c-header__menu')) {
            disable_scroll();
        };
    });
})();