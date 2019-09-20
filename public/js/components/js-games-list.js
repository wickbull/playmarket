if ($('.js-games-list').length > 0) {
    initGameList();

}

function initGameList() {
    var $body = $('body'),
        row = $('.js-games-list').find('.row').first(),
        update_cols_data = {
            'lg': 4,
            'md': 3,
            'sm': 3,
            'xs': 2,
            'xx': 1
        };

    function add_empty_col(){
        var empty_col = document.createElement('div');
        empty_col.className = "col-lg-8 col-sm-12 col-xs-12 col-xx-24 c-games-list__col";
        row[0].appendChild(empty_col);
    }

    function update_cols_calc(col_count){
        var col_height = 0,
            total_height = 0,
            diff = 0,
            groups = $('.js-games-list').find('.row').first().find('.c-games-list__group'),
            cols = $('.js-games-list').find('.row').first().find('.c-games-list__col');

        cols.each(function(){
            total_height += $(this).height();
        });
        col_height = total_height / col_count - diff;

        groups.unwrap()
        row.find('.c-games-list__col').remove();
        add_empty_col();
        groups.each(function(){
            var group = $(this),
                last_col = row.find('.c-games-list__col').last();

            last_col.append(group);
            if (last_col.height() > col_height && col_count > row.find('.c-games-list__col').length) {
                add_empty_col();
            }
        });
        $('.js-games-list').removeClass('is-hidden');
    }

    function update_cols_now (col_count) {
        if (breakPoint == 'lg') {
            update_cols_calc(col_count.lg);
        }
        if (breakPoint == 'md') {
            update_cols_calc(col_count.md);
        }
        if (breakPoint == 'sm') {
            update_cols_calc(col_count.sm);
        }
        if (breakPoint == 'xs') {
            update_cols_calc(col_count.xs);
        }
        if (breakPoint == 'xx') {
            update_cols_calc(col_count.xx);
        }
    }
    body.on('resize_lg_once resize_md_once resize_sm_once resize_xs_once resize_xx_once', function(){
        update_cols_now(update_cols_data);
    });
    update_cols_now(update_cols_data);
}