<?php

return array(

    /*
    |--------------------------------------------------------------------------
    | oAuth Config
    |--------------------------------------------------------------------------
    */

    /**
     * Storage
     */
    'storage' => '\\OAuth\\Common\\Storage\\Session',

    /**
     * Consumers
     */
    'consumers' => [

        /**
         * Vkontakte
         */
        'Vkontakte' => [
            'client_id'     => '6379999',
            'client_secret' => 'VMgvxM1RUnuSaLCbUyES',
            'scope' => []
        ],
    ]

);