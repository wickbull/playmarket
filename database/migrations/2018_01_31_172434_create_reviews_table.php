<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReviewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reviews', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trade_id')->unsigned()->nullable();
            $table->integer('user_id')->unsigned()->nullable();
            $table->integer('seller_id')->unsigned();
            $table->boolean('mark')->nullable();
            $table->text('text')->nullable();
            $table->timestamps();


            $table->foreign('trade_id')
                ->references('id')
                ->on('trades')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->foreign('seller_id')
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
        Schema::table('reviews', function (Blueprint $table) {
            $table->dropForeign('reviews_trade_id_foreign');
            $table->dropForeign('reviews_seller_id_foreign');
            $table->dropForeign('reviews_user_id_foreign');
        });
        Schema::dropIfExists('reviews');
    }
}
