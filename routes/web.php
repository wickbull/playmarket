<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

default_lang();

Route::post('/lang', 'LangController@index');

Route::post('/render/captcha', 'Auth\RegisterController@renderCaptcha')->name('captcha.render');
Route::post('/check/captcha', 'Auth\RegisterController@checkCaptcha')->name('captcha.check');


/*
 * Payment
 */

Route::get('/yandex/payment/success', 'PaymentController@paymentYandexComplete')->name('yandex-success');
Route::match(['get', 'post'], '/yandex/payment/confirmation', 'PaymentController@yandexConfirmation')->name('yandex-confirmation');

Route::get('/yandex/oauth', 'PaymentController@yandexOauth')->name('yandex-oauth');

Route::post('/webmoney/payment/success', 'PaymentController@paymentWebmoneyComplete')->name('webmoney-success');
Route::post('/webmoney/payment/confirmation', 'PaymentController@paymentWebmoneyComplete')->name('webmoney-confirmation');
//Route::post('/webmoney/payment/fail', 'PaymentController@webmoneyFail')->name('webmoney-fail');

Route::get('/qiwi/payment/success', 'PaymentController@paymentWebmoneyComplete')->name('qiwi-success');
Route::match(['get', 'post'], '/qiwi/payment/confirmation', 'PaymentController@qiwiConfirmation')->name('qiwi-confirmation');

//Route::get('/qiwi/payment/fail', 'PaymentController@wqiwiFail')->name('qiwi-fail');

//Route::get('/unitpay/payment/success', 'PaymentController@searchOrderFilter');
//Route::get('/unitpay/payment/result', 'PaymentController@payOrderFromGate');
//Route::get('/unitpay/payment/fail/{transactionId}', 'PaymentController@fail');

Route::get('/free-kassa/payment/success', 'PaymentController@paymentFreekassaConfirmation');
Route::get('/free-kassa/payment/confirmation', 'PaymentController@paymentFreekassaConfirmation');
Route::get('/free-kassa/payment/fail', 'PaymentController@paymentFreekassaFail');

Route::get('/payment/fail', 'PaymentController@paymentFail')->name('payment-fail');


/*
 * Confirmation route
 */
Route::get('/register/verify/{confirmationCode}', 'User\UserController@confirm')->name('confirm_token');

/*
 * Auth route
 */
Auth::routes();
/*
* Social auth
*/
Route::get('auth/{provider}', 'Auth\AuthController@redirectToProvider');
Route::get('auth/{provider}/callback', 'Auth\AuthController@handleProviderCallback');

/*
 * Upload status
 */
Route::get('/update/online-status', 'User\ProfileController@updateStatus')->name('update-online-status')->middleware('auth');


Route::group(['middleware' => ['ipcheck', 'throttle:60,1']], function () {


    Route::get('/', 'HomeController@index')->name('home');

    Route::get('/page/{slug}', 'Page\PageController@index');

    /*
     * Profile
     */

    Route::get('/user-profile/{id}', 'User\ProfileController@view')->name('user-profile');

    Route::post('/user-profile/{id}/review', 'User\ProfileController@getUserReview')->name('user-profile-review')->where('id', '[0-9]+');

    /*
     * Socialite routes
     */


    Route::post('/get/user/feedback', 'User\ProfileController@getFeedback')->name('get_feedback');


    Route::group(['middleware' => 'auth'], function () {
        /*
           * Profile routes
           */

        Route::get('/profile', 'User\ProfileController@index')->name('my-profile');
        Route::post('/profile/{id}', 'User\ProfileController@update')->name('update-profile');

        Route::post('/profile/wallet/save', 'User\ProfileController@wallet')->name('my-wallet-save');
        Route::get('/profile/get/balance', 'User\PurchaseController@getUserBalance')->name('get.auth.balance');


        Route::get('/profile/get/wallet', 'User\ProfileController@getUserWallet')->name('get.profile.wallet');

        /*
         * Payment get Money
         */

        Route::post('/user/withdraw', 'User\PayoutController@store')->name('user_withdraw');
        Route::delete('/user/withdraw/{invoice}', 'User\PayoutController@destroy')->name('user_withdraw.delete');


//    Route::get('/profile/{id}', 'User\ProfileController@view')->name('view-profile');

        Route::post('/change-phone', 'User\ProfileController@updatePhone')->name('change-phone');
        Route::post('/change-email', 'User\ProfileController@updateEmail')->name('change-email');
        Route::post('/confirm-email', 'User\ProfileController@confirmEmail')->name('confirm-email');
        Route::post('/change-password', 'User\ProfileController@updatePassword')->name('change-password');

        Route::get('/edit-sell-proposition/{id}', 'Page\GamePageController@editSellProposition')->name('edit-currency-sell-proposition');
        Route::get('/edit-currency-sell-proposition/{id}', 'Page\GamePageController@editCurrencySellProposition')->name('edit-sell-proposition');
        Route::post('/edit-sell-proposition/{id}', 'Page\GamePageController@saveEditSellProposition')->name('update-sell-proposition');
        Route::post('/edit-currency-sell-proposition/{id}', 'Page\GamePageController@editCurrencySellCurrency')->name('update-currency-sell-proposition');


        Route::get('/confirm-rules', 'User\ProfileController@confirmRules')->name('get-code');


        Route::get('/get-code', 'User\ProfileController@smsCode')->name('get-code');

        Route::get('/reset-pass', 'User\ProfileController@resetPass')->name('reset-pass');


        /*
         * Global refactor chat
         */


        Route::get('/chat', 'ChatController@getGlobalThread')->name('chat');

        /*
         * Lot chat
         */
        Route::post('/send_lot_message', 'ChatController@sendMessage')->name('send-lot-message');
        Route::get('/get_lot_thread', 'ChatController@getLotThread')->name('get-lot-thread');
        Route::post('/get_lot_message', 'ChatController@getThreadMessage')->name('get-lot-message');

        /*
         * Get user Feedback
         */


        /*
         * Global chat
         */
        Route::post('/send_global_message', 'ChatController@sendMessage')->name('send-global-message');
//        Route::get('/test', 'ChatController@getGlobalThread')->name('get-global-thread');
        Route::post('/get_global_message', 'ChatController@getThreadMessage')->name('get-global-message');
        //New User get for Chat
        Route::post('/get_new_chat_user', 'ChatController@getNewUserToThread')->name('new_chat_user');

        /*
         * Mark as read msg
         */

        Route::post('/mark_as_read', 'ChatController@markAsRead')->name('mark_as_read');


        /*
         * Feedback post
         */

        Route::post('/send_user_feedback/{id}', 'User\ProfileController@feedback')->name('send_user_feedback');

        /*
         * Shop auth
         */

//        Route::post('/refuse/lot/money', '');
        Route::get('/game/{id}/sell-service/{slug}-{currency_id}', 'Page\GamePageController@gameSellService')->name('game-sell-service');
        Route::post('/game/{id}/sell-service/{slug}-{currency_id}', 'Page\GamePageController@sellCurrency')->name('create-sell-currency');
        Route::post('/game/{gameId}/sell-proposition/{tagId}', 'Page\GamePageController@sellProposition')->name('create-sell-proposition');


        /*
         *
         */
        Route::get('/get-lot-form/{id}', 'Page\GamePageController@lotForm')->name('get-lot-form');
        Route::get('/get-lot-chat/{id}', 'Page\GamePageController@lotChat')->name('get-lot-chat');


        /*
         * user trades routes
         */

        Route::get('/sales/{id?}', 'User\SalesController@index')->name('sales');
        Route::post('/axios-refuse-money-trade', 'User\SalesController@refuseMoneyAxios')->name('sales-axios-refuse');
        Route::post('/refuse-money-trade/{id}', 'User\SalesController@refuseMoney')->name('sales-refuse');

        Route::post('/payment/qiwi/submit/{transactionId}', 'PaymentController@paymentQiwi')->name('payment-qiwi-submit');


        Route::get('/purchases/{id?}', 'User\PurchaseController@index')->name('purchases');
        Route::post('/create-trade/{id}', 'User\PurchaseController@buy')->name('create-trade');
        Route::post('/update-trade/{trade}', 'User\PurchaseController@updatePurchases')->name('update-trade');
        Route::post('/axios-update-trade', 'User\PurchaseController@updatePurchasesAxios')->name('axios-update-trade');



        Route::post('/get/trade/info','User\PurchaseController@getTradeInfo')->name('trade.info');
        Route::post('/get/invoice/info','User\PurchaseController@getPaymentInfo')->name('invoice.info');


    });

    /*
     * Chat routes
     */
//    Route::post('/messages', 'Page\ChatController@messages')->middleware('auth')->name('all-messages');
//    Route::post('/save-message', 'Page\ChatController@save_message')->middleware('auth')->name('save-messages');
//    Route::get('/updates-message', 'Page\ChatController@updates')->middleware('auth')->name('updates-messages');
////    Route::get('/ajax-messages/{id}', 'Page\ChatController@ajaxMessage')->middleware('auth')->name('ajax-all-messages');
////    Route::post('/messages', 'Page\ChatController@sendMessage')->middleware('auth')->name('send-messages');
//    Route::get('/count-msg', 'Page\ChatController@countMessage')->middleware('auth')->name('count-messages');


    /*
     * Game page route
     */
    Route::get('/game/{id}', 'Page\GamePageController@index')->name('game');


    /*
     * Trades lots
     */


    /*
     * Search
     */
    Route::post('/search', 'SearchController@search')->name('search');
    Route::post('/search-server', 'SearchController@searchServer')->name('search-server');
    Route::get('/search-game-lots', 'SearchController@gameTagsFilter')->name('search-server');

    Route::post('/item_filter/game={game_id}/tag={tag_id}', 'SearchController@itemFilter')->name('item-search');

    Route::get('/search-lot', 'SearchController@lotsFilter')->name('search-lots');
    Route::get('/search-sales', 'SearchController@salesFilter')->name('search-sales');
    Route::post('/search-profile-lot/{id}', 'SearchController@profileLotFilter')->name('search-profile-lots');


    /*
     * Admin routes
     */
    Route::group([
        'prefix' => 'admin',
        'middleware' => 'admin'
    ], function () {
        Voyager::routes();
        Route::post('/users/{id}/edit', 'Voyager\Controllers\VoyagerBreadController@edit')->name('user-admin-edit');
        /*
         * Game routes
         */
        Route::get('/games-list', 'Game\GameController@index');
        Route::get('/add-game', 'Game\GameController@storeView')->name('add-game');
        Route::post('/add-game', 'Game\GameController@store')->name('save-game');
        Route::get('/edit-game/{id}', 'Game\GameController@updateView')->name('edit-game');
        Route::post('/edit-game/{id}', 'Game\GameController@update')->name('update-game');

        Route::get('/delete-param/{id}', 'Game\GameController@deleteParam')->name('delete-param');
        Route::post('/edit-param', 'Game\GameController@editParam')->name('edit-param');

        Route::delete('/delete-game/{id}', 'Game\GameController@destroy')->name('delete-game');
        Route::delete('/delete-server/ajax/{id}', 'Game\GameController@destroyServer')->name('destroy-server-ajax');


        /*
         * Tag routes
         */
        Route::get('/tags', 'Game\TagController@index');
        Route::get('/add-tag', 'Game\TagController@storeView')->name('add-tag');
        Route::post('/add-tag', 'Game\TagController@store')->name('save-tag');
        Route::get('/edit-tag/{id}', 'Game\TagController@updateView')->name('edit-tag');
        Route::post('/edit-tag/{id}', 'Game\TagController@update')->name('update-tag');
        Route::delete('/delete-tag/{id}', 'Game\TagController@destroy')->name('delete-tag');

        /*
         * Sub Tag routes
         */
        Route::get('/sub-tags', 'Game\SubTagController@index')->name('subtag.index');
        Route::get('/add-sub-tag', 'Game\SubTagController@storeView')->name('add-sub-tag');
        Route::post('/add-sub-tag', 'Game\SubTagController@store')->name('save-sub-tag');
        Route::get('/edit-sub-tag/{id}', 'Game\SubTagController@updateView')->name('edit-sub-tag');
        Route::post('/edit-sub-tag/{id}', 'Game\SubTagController@update')->name('update-sub-tag');
        Route::delete('/delete-sub-tag/{id}', 'Game\SubTagController@destroy')->name('delete-sub-tag');

        Route::delete('/remove/subtag/metadata', 'Game\SubTagController@destroySubTagMetadata')->name('remove_subtag_metadata');

        /*
         * Server routes
         */
        Route::get('/servers', 'Game\ServerController@index');
        Route::get('/add-server', 'Game\ServerController@storeView')->name('add-server');
        Route::post('/add-server', 'Game\ServerController@store')->name('save-server');
        Route::get('/edit-server/{id}', 'Game\ServerController@updateView')->name('edit-server');
        Route::post('/edit-server/{id}', 'Game\ServerController@update')->name('update-server');
        Route::delete('/delete-server/{id}', 'Game\ServerController@destroy')->name('delete-server');


        /*
         * Game currency routes
         */
        Route::get('/currency', 'Game\CurrencyController@index');
        Route::get('/add-currency', 'Game\CurrencyController@storeView')->name('add-currency');
        Route::post('/add-currency', 'Game\CurrencyController@store')->name('save-currency');
        Route::get('/edit-currency/{id}', 'Game\CurrencyController@updateView')->name('edit-currency');
        Route::post('/edit-currency/{id}', 'Game\CurrencyController@update')->name('update-currency');
        Route::delete('/delete-currency/{id}', 'Game\CurrencyController@destroy')->name('delete-currency');


        /*
         * Game lots routes
         */
        Route::get('/lots', 'Game\LotController@index');
        Route::get('/edit-lot/{id}', 'Game\LotController@updateView')->name('edit-lot');
        Route::delete('/delete-lot/{id}', 'Game\LotController@destroy')->name('delete-lot');
        Route::post('/edit-lot/{id}', 'Game\LotController@update')->name('update-lot');

        /*
        * Commission routes
        */
        Route::get('/commission', 'Admin\CommissionController@index')->name('commission');
        Route::get('/commission/{id}', 'Admin\CommissionController@updateView')->name('edit-commission');
        Route::post('/commission/{id}', 'Admin\CommissionController@update')->name('update-commission');

        /*
         * Comments
         *
         */
        Route::get('/comments', 'Admin\CommentController@index')->name('comment.index');
        Route::get('/comments/{comment}', 'Admin\CommentController@show')->name('comment.show');
        Route::put('/comments/{comment}', 'Admin\CommentController@update')->name('comment.update');
        Route::delete('/comments/{comment?}', 'Admin\CommentController@destroy')->name('comment.destroy');

        /*
        * Wallets routes
        */
        Route::get('/site/wallet', 'Admin\SiteWalletController@index')->name('site-wallet');
        Route::get('/site/add-wallet', 'Admin\SiteWalletController@storeView')->name('add-site-wallet');
        Route::post('/site/add-wallet', 'Admin\SiteWalletController@store')->name('save-site-wallet');
        Route::get('/site/wallet/{id}', 'Admin\SiteWalletController@updateView')->name('edit-site-wallet');
        Route::post('/site/wallet/{id}', 'Admin\SiteWalletController@update')->name('update-site-wallet');
        Route::delete('/delete-site-wallet/{id}', 'Admin\SiteWalletController@destroy')->name('delete-site-wallet');


        /*
       * Payment setting routes
       */
        Route::get('/payment/setting', 'Admin\PaymentSettingController@index')->name('payment-setting');
        Route::get('/payment/setting/{id}', 'Admin\PaymentSettingController@show')->name('edit-payment-setting');
        Route::post('/payment/setting/{id}', 'Admin\PaymentSettingController@update')->name('update-payment-setting');


        /*
         * Invoice history
         */
        Route::get('/invoice', 'Admin\InvoiceController@index')->name('invoice.index');

        Route::get('/invoice/user/{user_id}', 'Admin\InvoiceController@show')->name('invoice.user.show');

        //Check qiwi
        Route::post('/payment/qiwi/check', 'PaymentController@checkQiwiPayment')->name('check.qiwi.payment');


        /*
      * Payout
      */
        Route::get('/payout', 'Admin\PayoutController@index')->name('payout.index');
        Route::get('/payout/frozen', 'Admin\PayoutController@frozen')->name('payout.frozen');

        Route::put('/payout/update/{payout}', 'Admin\PayoutController@update')->name('payout.update');
        Route::put('/payout/frozen/{payout}', 'Admin\PayoutController@updateFrozen')->name('payout.updateFrozen');


        Route::get('/payout/qiwi/history', 'Admin\PayoutController@qiwiHistory')->name('payout.qiwi.history');
        Route::get('/payout/yandex/history', 'Admin\PayoutController@yandexHistory')->name('payout.yandex.history');
        Route::get('/payout/freekassa/history', 'Admin\PayoutController@freekassaHistory')->name('payout.freekassa.history');
        Route::get('/payout/webmoney/history', 'Admin\PayoutController@webmoneyHistory')->name('payout.webmoney.history');

        Route::delete('/payout/delete/{payout}', 'Admin\PayoutController@destroy')->name('payout.destroy');


        /*
      * Commission routes
      */
        Route::get('/side', 'Game\SideController@index')->name('side');
        Route::get('/side/add', 'Game\SideController@create')->name('add-side');
        Route::get('/side/edit/{id}', 'Game\SideController@updateView')->name('edit-side');
        Route::post('/side/store', 'Game\SideController@store')->name('save-side');
        Route::post('/side/update/{id}', 'Game\SideController@update')->name('update-side');
        Route::delete('/delete-side/{id}', 'Game\SideController@destroy')->name('update-side');

        /*
         * Chats Admin routes
         */

        Route::get('/chat', 'Admin\ChatAdminController@index')->name('all-chat');


        Route::get('/chat-setting', 'Admin\ChatSettingController@index')->name('chat-setting');
        Route::get('/chat-setting/edit/{id}', 'Admin\ChatSettingController@show')->name('chat-setting-edit');
        Route::post('/chat-setting/update/{id}', 'Admin\ChatSettingController@update')->name('chat-setting-update');


        Route::get('/user/{id}/all-chat', 'Admin\ChatAdminController@userChat')->name('users-chat-admin');
        Route::get('/chat/{id}', 'Admin\ChatAdminController@show')->name('chat-by-id-admin');
        Route::get('/chat/{first}/{second}', 'Admin\ChatAdminController@showByUser')->name('chat-by-user-id-admin');

        Route::post('/chat/{id}/new', 'Admin\ChatAdminController@store')->name('chat-new-msg-admin');


        Route::get('/trade', 'Admin\TradeController@index')->name('all-trade');

        Route::get('/user/{id}/all-trade', 'Admin\TradeController@userTrade')->name('users-trade-admin');
        Route::get('/trade/{id}', 'Admin\TradeController@show')->name('trade-by-id-admin');
        Route::put('/trade/update/{id}', 'Admin\TradeController@update')->name('trade-update-by-id-admin');

        Route::post('/trade/{id}/close', 'Admin\TradeController@close')->name('trade-by-id-close-admin');
        Route::post('/trade/{id}/refuse', 'Admin\TradeController@refuse')->name('trade-by-id-refuse-admin');
        Route::post('/trade/{id}/refuse-payment', 'Admin\TradeController@refusePayment')->name('trade-by-id-refuse-payment-admin');


        Route::post('/set/yandexOauth/{id}','Admin\InvoiceController@yandexOauth')->name('yandex-set-oaut');


        /*
         * Languages routes
         */

     
        // Языки
        Route::prefix('lang')->group(function () {
            Route::get('/', 'Admin\LanguageController@lang');
            Route::get('add-lang', 'Admin\LanguageController@langAdd')->name('add-lang');
            Route::post('store-lang', 'Admin\LanguageController@langStore')->name('store-lang');
            
            Route::prefix('{index}')->group(function () {
                Route::get('edit-lang', 'Admin\LanguageController@langEdit');
                Route::post('submit-edit-lang', 'Admin\LanguageController@langSubmitEdit');
                Route::get('delete-lang', 'Admin\LanguageController@langDelete');
        // Языки


                // Индексации
                Route::prefix('index')->group(function () {
                    Route::get('/', 'Admin\LanguageController@index');
                    Route::post('add-index', 'Admin\LanguageController@indexAdd');
                    
                    Route::prefix('{structure}')->group(function () {
                        Route::get('edit-index', 'Admin\LanguageController@indexEdit');
                        Route::post('submit-edit-index', 'Admin\LanguageController@indexSubmitEdit');
                        Route::get('delete-index', 'Admin\LanguageController@indexDelete');
                // Индексации



                        // Структура
                        Route::prefix('structure')->group(function () {
                            Route::get('/', 'Admin\LanguageController@structure');
                            Route::post('add-structure', 'Admin\LanguageController@structureAdd');

                            Route::prefix('{translate}')->group(function () {
                                Route::get('edit-structure', 'Admin\LanguageController@structureEdit');
                                Route::post('submit-edit-structure', 'Admin\LanguageController@structureSubmitEdit');
                                Route::get('delete-structure', 'Admin\LanguageController@structureDelete');
                        // Структура

                                // Перевод
                                Route::prefix('/translate')->group(function () {

                                    Route::get('/', 'Admin\LanguageController@translate');
                                    Route::post('add-translate', 'Admin\LanguageController@translateAdd');
                                    // Перевод
                                });

                            });

                        });
                    });

                });
            });

        });


        // Route::prefix('lang')->group(function () {
        //     Route::get('/', 'Admin\LanguageController@index');
        //     Route::get('store', 'Admin\LanguageController@storeLang')->name('store');
            
        //     Route::prefix('{id}')->group(function () {

        //         Route::prefix('edit')->group(function () {
        //             Route::get('/', 'Admin\LanguageController@editLang');
        //             Route::post('add-index', 'Admin\LanguageController@addIndex')->name('add-index');

        //             Route::prefix('{index}')->group(function () {
        //                 Route::prefix('index')->group(function() {
                           
        //                     Route::get('edit', 'Admin\LanguageController@editStructure');
        //                     Route::get('delete', 'Admin\LanguageController@deleteStructure');
        //                     Route::post('add-structure', 'Admin\LanguageController@addStructure')->name('add-structure');

        //                     Route::prefix('{structure}')->group(function () {
        //                         Route::prefix('structure')->group(function (){
        //                             Route::get('edit', 'Admin\LanguageController@editTranslation');
        //                             Route::post('add-translate', 'Admin\LanguageController@addTranslation')->name('add-translate');
        //                         });
        //                     });
        //                 });
        //             });
        //         });

        //         Route::prefix('delete')->group(function () {
        //             Route::get('/', 'Admin\LanguageController@deleteLang');
        //         });
        //     });

        // });

        // Route::get('/lang', 'Admin\LanguageController@index');
        // Route::get('/lang/add-lang', 'Admin\LanguageController@addlang')->name('add-lang');
        // Route::post('/lang/store-lang', 'Admin\LanguageController@store')->name('store-lang');
        // Route::get('/lang/edit-lang/{id}', 'Admin\LanguageController@edit')->name('edit-lang');

        // Route::post('/lang/add-map-lang/{id}', 'Admin\LanguageController@addLangMap')->name('add-map-lang');
//        Route::post('/lang/add-game', 'Game\GameController@store')->name('save-game');
//        Route::get('/language', 'Admin\LanguageController@index');

    });

});







