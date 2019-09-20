<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->increments('id');
            $table->string('invoice_id');
            $table->double('price', 20, 3);
            $table->integer('currency_id')->unsigned()->nullable();
            $table->integer('trade_id')->unsigned()->nullable();
            $table->integer('user_id')->unsigned()->nullable();
            $table->tinyInteger('status')->default('0');
            $table->text('payment_detail')->nullable();
            $table->string('type', '3')->default('in');
            $table->string('payout_purse')->nullable();
            $table->dateTime('payment_date')->nullable();
            $table->string('payment_type')->nullable();
            $table->timestamps();


            $table->foreign('currency_id')
                ->references('id')
                ->on('price_commissions')
                ->onUpdate('cascade')
                ->onDelete('set null');

            $table->foreign('trade_id')
                ->references('id')
                ->on('trades')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('invoices', function (Blueprint $table) {
            $table->dropForeign('invoices_currency_id_foreign');
            $table->dropForeign('invoices_trade_id_foreign');
            $table->dropForeign('invoices_user_id_foreign');
        });
        Schema::dropIfExists('invoices');
    }
}
