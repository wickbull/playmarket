<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePayoutsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payouts', function (Blueprint $table) {
            $table->increments('id');
            $table->string('wallet');
            $table->float('amount', 10, 2)->nullable();
            $table->integer('user_id')->unsigned()->nullable();
            $table->integer('currency_id')->unsigned()->nullable();
            $table->integer('admin_id')->unsigned()->nullable();
            $table->text('payment_info')->nullable();
            $table->boolean('status')->default(0);
            $table->boolean('frozen')->default(0);
            $table->dateTimeTz('confirm_date')->nullable();
            $table->timestamps();

            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('admin_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('currency_id')
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
        Schema::table('payouts', function (Blueprint $table) {
            $table->dropForeign('payouts_user_id_foreign');
            $table->dropForeign('payouts_admin_id_foreign');
            $table->dropForeign('payouts_currency_id_foreign');
        });
        Schema::dropIfExists('payouts');
    }
}
