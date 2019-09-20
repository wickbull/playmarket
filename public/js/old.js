var bower_path = '../bower_components/';

requirejs.config({
    baseUrl: '/js',  // base path with all js
    paths: {
        // ALIAS TO PLUGINS
        domReady:                       'lib/domReady',

        // LIBS
        jquery:                         bower_path +'jquery/dist/jquery', // lib for js
        modernizr:                      'lib/modernizr-custom',
        html5shiv:                      'https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min',

        // PLUGINS
        scrollbar:                      bower_path + 'perfect-scrollbar/js/perfect-scrollbar.jquery.min',
        svg4everybody:                  bower_path + 'svg4everybody/dist/svg4everybody.min',  // load svg
        jquery_validate:                bower_path + 'jquery-validation/dist/jquery.validate',
        bs_tooltip:                     bower_path + 'bootstrap/js/tooltip',
        bs_tab:                         bower_path + 'bootstrap/js/tab',
        bs_transition:                  bower_path + 'bootstrap/js/transition',
        bs_dropdown:                    bower_path + 'bootstrap/js/dropdown',
        bs_collapse:                    bower_path + 'bootstrap/js/collapse',
        bs_select:                      bower_path + 'bootstrap-select/dist/js/bootstrap-select',
        bs_modal:                       'plugins/bs/modal', // fixed for multiple modal open, need modal fix

        // SEPARATE
        separate_global:                'separate/global', // detect width && height of window\

        // HELPERS
        resizer:                        'helpers/resizer',
        object_fit:                     'helpers/object-fit',
        bs_modal_fix:                   'helpers/bs_modal_fix',
        bs_modal_center:                'helpers/bsModalCenter',
        toggle_blocks:                  'helpers/toggle-blocks',
        valid:                          'helpers/valid',
        // detectmobilebrowser:            'lib/detectmobilebrowser',
        // update_columns:                 'helpers/update-columns',

        // COMPONENTS
        'js-header':                    'components/js-header',
        'js-games-list':                'components/js-games-list',
        'js-chat':                      'components/js-chat',
        'js-init-perfect-scroll':       'components/js-init-perfect-scroll',
        'js-init-bs-tooltip':           'components/js-init-bs-tooltip',
        'js-init-bs-tabs':              'components/js-init-bs-tabs',
        'js-init-bs-select':            'components/js-init-bs-select',
        'js-collapse':                  'components/js-collapse',
        'js-personal-data':             'components/js-personal-data',
    },
    shim: {
        'bs_modal': {
            deps: ['bs_modal_fix']
        },
        'object_fit': {
            deps: ['modernizr']
        },
        'js-init-bs-select': {
            deps: ['bs_select', "bs_dropdown"]
        }
    }
});
var main_js_components = [
    'html5shiv',
    'modernizr',
    'separate_global',
    'bs_transition',
    'bs_modal',
    'resizer',
    'bs_modal_fix',
    'bs_modal_center',
    'toggle_blocks',
    'svg4everybody',
    'object_fit',
];



requirejs(['domReady', 'jquery'], function(domReady, $){
    requirejs(main_js_components, function(objectfit) {
        svg4everybody();
        loadComponent({
            name: '.js-header',
            req: ['js-header']
        });
        loadComponent({
            name: '.js-games-list',
            req: ['js-games-list']
        });
        loadComponent({
            name: '.js-chat',
            req: ['js-chat']
        });
        loadComponent({
            name: '.js-personal-data',
            req: ['js-personal-data']
        });
        loadComponent({
            name: '.js-custom-scroll',
            req: ['js-init-perfect-scroll', 'scrollbar']
        });
        loadComponent({
            name: '.js-form_check',
            req: ['valid', 'jquery_validate']
        });
        loadComponent({
            name: '[data-toggle="tooltip"]',
            req: ['js-init-bs-tooltip', 'bs_tooltip']
        });
        loadComponent({
            name: '[data-toggle="tab"]',
            req: ['js-init-bs-tabs', 'bs_tab']
        });
        loadComponent({
            name: '.selectpicker',
            req: ['js-init-bs-select']
        });
        loadComponent({
            name: '.collapse',
            req: ['js-collapse', 'bs_collapse']
        });


    });
});