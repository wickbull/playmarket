<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
//        $this->call(VoyagerDatabaseSeeder::class);
//        $this->call(AdminFieldSeeder::class);
//
//        $this->call(UsersTableSeeder::class);
//
//        $this->call(GameServerSeeder::class);
//        $this->call(PaymentCurrencySeeder::class);
//        $this->call(VoyagerCustomSeeder::class);
//        $this->call(ChatSettingSeeder::class);

        $this->call(BackupSeeder::class);


//        $this->call(SiteWalletSeeder::class);





    }
}


/*
 * Seed all data for test
 */

class AdminFieldSeeder extends Seeder
{
    public function run()
    {
        Eloquent::unguard();
        $path = 'database/seeds/sql/bigdrop(dima).sql';
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        DB::unprepared(file_get_contents($path));
        $this->command->info('Default table seeded');
        DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }
}

class BackupSeeder extends Seeder
{
    public function run()
    {
        Eloquent::unguard();
        $path = 'database/seeds/sql/playzoProd.25.07.sql';
        DB::statement('SET FOREIGN_KEY_CHECKS=0');
        DB::unprepared(file_get_contents($path));
        $this->command->info('Default table seeded');
        DB::statement('SET FOREIGN_KEY_CHECKS=1');

        \App\Models\AdminPassword::create([
            'password' => bcrypt('4322')
        ]);
    }
}

class GameServerSeeder extends Seeder
{
    public function run()
    {
        Eloquent::unguard();
        \App\Models\Server::create([
            'name' => 'Line Age 1',
            'side' => 'Horde',
            'game_id' => '1'
        ]);
        \App\Models\Server::create([
            'name' => 'Line Age 2',
            'side' => 'Alliance',
            'game_id' => '1'
        ]);
        \App\Models\Server::create([
            'name' => 'Line Age 3',
            'game_id' => '1'
        ]);
        \App\Models\Server::create([
            'name' => 'Dota Steam',
            'game_id' => '2'
        ]);
        \App\Models\Server::create([
            'name' => 'Fifa server 1',
            'game_id' => '3'
        ]);
        \App\Models\Server::create([
            'name' => 'Fifa server 2',
            'game_id' => '3'
        ]);
        \App\Models\Server::create([
            'name' => 'Fifa server 3',
            'game_id' => '3'
        ]);

        \App\Models\Server::create([
            'name' => 'TESO server 1',
            'game_id' => '4'
        ]);

        \App\Models\Server::create([
            'name' => 'TESO server 2',
            'game_id' => '4'
        ]);

        \App\Models\Server::create([
            'name' => 'TESO server 3',
            'side' => 'Alliance',
            'game_id' => '4'
        ]);

        \App\Models\Server::create([
            'name' => 'TESO server 4',
            'side' => 'Alliance',
            'game_id' => '4'
        ]);

        \App\Models\Server::create([
            'name' => 'TESO server 5',
            'game_id' => '4'
        ]);

        \App\Models\Server::create([
            'name' => 'TESO server 6',
            'game_id' => '4'
        ]);

        \App\Models\Server::create([
            'name' => 'Aion server 1',
            'game_id' => '5'
        ]);
        \App\Models\Server::create([
            'name' => 'Aion server 2',
            'game_id' => '5'
        ]);
        \App\Models\Server::create([
            'name' => 'Aion server 3',
            'game_id' => '5'
        ]);

        \App\Models\Server::create([
            'name' => 'ArcheAge server 1',
            'game_id' => '9'
        ]);
        \App\Models\Server::create([
            'name' => 'ArcheAge server 2',
            'game_id' => '9'
        ]);

        \App\Models\Server::create([
            'name' => '	Black Desert server 1',
            'game_id' => '10'
        ]);

        \App\Models\Server::create([
            'name' => 'Hearthstone server 1',
            'game_id' => '11'
        ]);
        \App\Models\Server::create([
            'name' => 'Hearthstone server 2',
            'game_id' => '11'
        ]);
        \App\Models\Server::create([
            'name' => 'Hearthstone server 3',
            'game_id' => '11'
        ]);

        \App\Models\Server::create([
            'name' => 'GTA 5 server 1',
            'game_id' => '12'
        ]);
        \App\Models\Server::create([
            'name' => 'GTA 5 server 2',
            'game_id' => '12'
        ]);

        \App\Models\Server::create([
            'name' => 'Lineage 2 Classic server 1',
            'game_id' => '13'
        ]);
        \App\Models\Server::create([
            'name' => 'Lineage 2 Classic server 2',
            'game_id' => '13'
        ]);
        \App\Models\Server::create([
            'name' => 'Lineage 2 Classic server 3',
            'game_id' => '13'
        ]);
        \App\Models\Server::create([
            'name' => 'Lineage 2 Classic server 4',
            'game_id' => '13'
        ]);
        \App\Models\Server::create([
            'name' => 'Lineage 2 Classic server 5',
            'game_id' => '13'
        ]);
        \App\Models\Server::create([
            'name' => 'Lineage 2 Classic server 6',
            'game_id' => '13'
        ]);
    }
}


class UsersTableSeeder extends Seeder
{
    public function run()
    {
        \App\User::create([
            'name' => 'Bigdrop',
            'email' => 'bigdrop@gmail.com',
            'password' => bcrypt('111111'),
            'confirmed' => '1',
            'create_lot' => '1',
            'buy_lot' => '1',
            'get_money' => '1',
            'confirmed_rules' => '1',
            'role_id' => '1'
        ]);


        \App\User::create([
            'name' => 'Андрей',
            'email' => 'pilkoandriy94@gmail.com',
            'password' => bcrypt('111111'),
            'confirmed' => '1',
            'create_lot' => '1',
            'buy_lot' => '1',
            'get_money' => '1',
            'confirmed_rules' => '1',
            'role_id' => '1'
        ]);

        \App\User::create([
            'name' => 'Редиска',
            'email' => '123123@gmail.com',
            'password' => bcrypt('123123'),
            'confirmed' => '1',
            'create_lot' => '1',
            'buy_lot' => '1',
            'get_money' => '1',
            'confirmed_rules' => '1',
            'role_id' => '1'
        ]);


    }
}


class PaymentCurrencySeeder extends Seeder
{
    public function run()
    {
        \App\Models\PriceCommission::create([
            'title' => 'Внутренный баланс',
            'keyword' => 'balance',
            'site' => '1',
            'payment' => '1',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '100',
            'symbol' => '₽',
            'priority' => 1
        ]);


        \App\Models\PriceCommission::create([
            'title' => 'Банковская карта',
            'keyword' => 'card',
            'site' => '2',
            'payment' => '2',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '100',
            'symbol' => '₽',
            'output_commission' => '5',
            'can_withdrawal' => '1'
        ]);

        \App\Models\PriceCommission::create([
            'title' => 'Яндекс.Деньги',
            'keyword' => 'yandex_money',
            'site' => '2',
            'payment' => '2',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '100',
            'symbol' => '₽',
            'output_commission' => 5,
            'can_withdrawal' => '1'


        ]);

        \App\Models\PriceCommission::create([
            'title' => 'Qiwi',
            'keyword' => 'qiwi',
            'site' => '2',
            'payment' => '2',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '100',
            'symbol' => '₽',
            'output_commission' => 5,
            'can_withdrawal' => '1'

        ]);

        \App\Models\PriceCommission::create([
            'title' => 'МТС, Билайн, Мегафон',
            'keyword' => 'phone_operator',
            'site' => '2',
            'payment' => '2',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '100',
            'symbol' => '₽',

        ]);

        \App\Models\PriceCommission::create([
            'title' => 'WebMoney WMR',
            'keyword' => 'wmr',
            'site' => '2',
            'payment' => '2',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '100',
            'symbol' => 'WMR',
            'output_commission' => 1,
            'can_withdrawal' => '1'
        ]);


        \App\Models\PriceCommission::create([
            'title' => 'WebMoney WMZ',
            'keyword' => 'wmz',
            'site' => '2',
            'payment' => '2',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '1.68080',
            'symbol' => 'WMZ',
            'output_commission' => 1,

        ]);

        \App\Models\PriceCommission::create([
            'title' => 'WebMoney WMU',
            'keyword' => 'wmu',
            'site' => '2',
            'payment' => '2',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '46.5113',
            'symbol' => 'WMU',
            'output_commission' => 1,

        ]);

        \App\Models\PriceCommission::create([
            'title' => 'WebMoney WME',
            'keyword' => 'wme',
            'site' => '2',
            'payment' => '2',
            'withdrawal' => '2',
            'other' => '1',
            'is_active' => '1',
            'coefficient' => '1.4117',
            'symbol' => 'WME',
            'output_commission' => 2,
        ]);
    }
}


class VoyagerCustomSeeder extends Seeder
{
    public function run()
    {
        $menuItem = \TCG\Voyager\Models\MenuItem::firstOrNew([
            'menu_id' => '1',
            'title' => 'Комиссия',
            'url' => route('commission', [], false),
        ]);
        if (!$menuItem->exists) {
            $menuItem->fill([
                'target' => '_self',
                'icon_class' => 'voyager-dollar',
                'color' => '#000000',
                'parent_id' => 15,
                'order' => 17,
            ])->save();
        }


        $menuItem = \TCG\Voyager\Models\MenuItem::firstOrNew([
            'menu_id' => '1',
            'title' => 'Чаты',
            'url' => null,
        ]);
        if (!$menuItem->exists) {
            $menuItem->fill([
                'target' => '_self',
                'icon_class' => 'voyager-chat',
                'color' => '#000000',
                'order' => 5,
            ])->save();
        }

        $menuItem = \TCG\Voyager\Models\MenuItem::firstOrNew([
            'menu_id' => '1',
            'title' => 'Настройки чата',
            'url' => route('chat-setting', [], false),
        ]);
        if (!$menuItem->exists) {
            $menuItem->fill([
                'target' => '_self',
                'icon_class' => 'voyager-params',
                'color' => '#000000',
                'parent_id' => 31,
                'order' => 6,
            ])->save();
        }

        $menuItem = \TCG\Voyager\Models\MenuItem::firstOrNew([
            'menu_id' => '1',
            'title' => 'Все чаты',
            'url' => route('all-chat', [], false),
        ]);
        if (!$menuItem->exists) {
            $menuItem->fill([
                'target' => '_self',
                'icon_class' => 'voyager-megaphone',
                'color' => '#000000',
                'parent_id' => 31,
                'order' => 7,
            ])->save();
        }

        $menuItem = \TCG\Voyager\Models\MenuItem::firstOrNew([
            'menu_id' => '1',
            'title' => 'Сделки',
            'url' => null,
        ]);
        if (!$menuItem->exists) {
            $menuItem->fill([
                'target' => '_self',
                'icon_class' => 'voyager-dollar',
                'color' => '#000000',
                'order' => 5,
            ])->save();
        }


        $menuItem = \TCG\Voyager\Models\MenuItem::firstOrNew([
            'menu_id' => '1',
            'title' => 'Все сделки',
            'url' => route('all-trade', [], false),
        ]);
        if (!$menuItem->exists) {
            $menuItem->fill([
                'target' => '_self',
                'icon_class' => 'voyager-megaphone',
                'color' => '#000000',
                'parent_id' => 31,
                'order' => 7,
            ])->save();
        }





//        $menuItem = \TCG\Voyager\Models\MenuItem::firstOrNew([
//            'menu_id' => '1',
//            'title' => 'Стороны',
//            'url' => route('side', [], false),
//        ]);
//        if (!$menuItem->exists) {
//            $menuItem->fill([
//                'target' => '_self',
//                'icon_class' => 'voyager-sitemap',
//                'color' => '#000000',
//                'parent_id' => 15,
//                'order' => 2,
//            ])->save();
//        }
    }
}


class ChatSettingSeeder extends Seeder
{
    public function run()
    {

        \App\Models\ChatSetting::create([
            'title' => 'Сообщений в день для пользователя (Все чаты)',
            'keyword' => 'msg_per_day',
            'is_active' => '1',
            'value' => '10',
        ]);
    }
}

class SiteWalletSeeder extends Seeder
{
    public function run()
    {

        \App\Models\SiteWallet::create([
            'title' => 'Webmoney',
            'keyword' => 'wmr',
            'is_active' => '1',
            'wallet_key' => 'R374706482696',
            'api_key' => '236312820801',
            'secret_key' => '5555',
            'merchant_id' => '6',

        ]);

        \App\Models\SiteWallet::create([
            'title' => 'Unitpay',
            'keyword' => 'unitpay',
            'is_active' => '1',
            'api_key' => '119561-a829f',
            'secret_key' => 'f8610e01bb885020c6eb8867bc39bab1',
        ]);
    }
}

