(function () {
    var $body = $('body');
    var $chat__conversations_trig = $('.c-chat__conversations-trig');
    var $chat__conversations_wrap = $('.c-chat__conversations-wrap');

    // $body.on('click', function (e) {
    //     if($(e.target).closest('.c-chat__conversations-trig, .c-chat__conversations-wrap').length === 0) {
    //         hideBlock($chat__conversations_trig, $chat__conversations_wrap);
    //     };
    // });
    // $body.on('click', '.c-chat__conversations-item', function (e) {
    //     if ($(e.target).closest('a').length === 0){
    //         hideBlock($chat__conversations_trig, $chat__conversations_wrap);
    //         console.log('click ".c-chat__conversations-item" !');
    //     };
    // });
    // $body.on('click', '.c-chat__dialog-item', function (e) {
    //     if ($(e.target).closest('a').length === 0){
    //         console.log('click ".c-chat__dialog-item" !');
    //     };
    // });
    $chat__conversations_wrap.on('hideBlock', function() {
        enable_scroll()
    });
    $chat__conversations_wrap.on('showBlock', function() {
        disable_scroll();
    });

})();