(function () {
    $('body')
        .on('click', 'a[data-toggle="tab"]', function (e) {
            let th = $(this);
            // th.tab('show');
            window.location.hash = encodeURI(th.attr('href'));
            // th.closest('.c-tab-nav').find('.c-tab-nav__trig span')[0].innerHTML = th.find('span')[0].innerHTML;
            // e.preventDefault();
        })
        .on('click', '.c-tab-nav__trig', function (e) {
            let th = $(this);
            let th_drop = th.closest('.c-tab-nav').find('.c-tab-nav__drop');
            $('.c-tab-nav__drop').not(th_drop).addClass('minimized');
            $('.c-tab-nav__trig').not(th).removeClass('active');
            th_drop.toggleClass('minimized');
            if (th_drop.hasClass('minimized')) th.removeClass('active');
            else th.addClass('active');
            e.preventDefault();
        })
        .on('click', function (e) {
    });

    let url = decodeURI(window.location.hash).replace('tab-', '');

    if ($(url).length) {
        $('a[href="' + url + '"]')
            .tab('show')
            .closest('ul')
            .siblings('.c-tab-nav__trig')[0].innerHTML = $('a[href="' + url + '"]')[0].innerHTML;
    }

})();