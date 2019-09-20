(function () {
    if (!Modernizr.touchevents) {
        $(".js-custom-scroll").perfectScrollbar({
            // wheelPropagation: true,
            suppressScrollX: true
        });
    };
})();