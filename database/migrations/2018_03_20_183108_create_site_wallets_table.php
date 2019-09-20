<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSiteWalletsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('site_wallets', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title');
            $table->string('keyword');
            $table->string('wallet_key')->nullable();
            $table->text('secret_key')->nullable();
            $table->text('secret_password')->nullable();
            $table->text('additional_field')->nullable();
            $table->string('api_key')->nullable();
            $table->boolean('is_active')->default('0');
            $table->integer('merchant_id')->nullable()->unsigned();
            $table->text('additional_field2')->nullable();

            $table->timestamps();

            $table->foreign('merchant_id')
                ->references('id')
                ->on('price_commissions')
                ->onUpdate('cascade')
                ->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('site_wallets', function (Blueprint $table) {
            $table->dropForeign('site_wallets_merchant_id_foreign');
        });
        Schema::dropIfExists('site_wallets');
    }
}
