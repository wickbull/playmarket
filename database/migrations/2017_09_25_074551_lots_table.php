<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class LotsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lots', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('currency_id')->unsigned()->nullable();
            $table->integer('game_id')->unsigned()->nullable();
            $table->integer('owner_id')->unsigned()->nullable();
            $table->integer('server_id')->unsigned()->nullable();
            $table->integer('tag_id')->unsigned()->nullable();
            $table->float('price', 20, 3);
            $table->text('description')->nullable();
            $table->float('availability', 20, 3);
            $table->float('min_order', 10, 2)->default('0.00');
            $table->integer('status')->default(1);
            $table->integer('active');
            $table->boolean('top')->nullable();
            $table->timestamp('top_at')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('currency_id')
                ->references('id')
                ->on('currencies')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('game_id')
                ->references('id')
                ->on('games')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('owner_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('server_id')
                ->references('id')
                ->on('servers')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('tag_id')
                ->references('id')
                ->on('tags')
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
        Schema::table('lots', function (Blueprint $table) {
            $table->dropForeign('lots_currency_id_foreign');
            $table->dropForeign('lots_game_id_foreign');
            $table->dropForeign('lots_owner_id_foreign');
            $table->dropForeign('lots_server_id_foreign');
            $table->dropForeign('lots_tag_id_foreign');
        });
        Schema::dropIfExists('lots');
    }
}
