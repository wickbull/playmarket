<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class TradeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trades', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('owner_id')->unsigned()->nullable();
            $table->integer('buyer_id')->unsigned()->nullable();
            $table->integer('send_id')->unsigned()->nullable();
            $table->integer('lot_id')->unsigned()->nullable();
            $table->integer('payment_id');
            $table->string('character_name');
            $table->float('amount_clear', 20, 3)->nullable();
            $table->float('price', 20, 3);
            $table->float('get_availability', 20, 3);
            $table->integer('status')->default(1);
            $table->integer('refuse_moderator_id')->nullable()->unsigned();
            $table->dateTimeTz('refuse_date')->nullable();
            $table->integer('is_payed')->default(0);
            $table->dateTime('closed_at')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('refuse_moderator_id')->references('id')->on('users');
            $table->foreign('owner_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('buyer_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('lot_id')
                ->references('id')
                ->on('lots')
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
        Schema::table('trades', function (Blueprint $table) {
            $table->dropForeign('trades_refuse_moderator_id_foreign');
            $table->dropForeign('trades_owner_id_foreign');
            $table->dropForeign('trades_buyer_id_foreign');
            $table->dropForeign('trades_lot_id_foreign');

        });
        Schema::dropIfExists('trades');
    }
}
