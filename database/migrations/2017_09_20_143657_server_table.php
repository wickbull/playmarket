<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ServerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('servers', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('side')->nullable();
            $table->integer('game_id')->unsigned();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('game_id')
                ->references('id')
                ->on('games')
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
        Schema::table('servers', function (Blueprint $table) {
            $table->dropForeign('servers_game_id_foreign');
        });
        Schema::dropIfExists('servers');
    }
}
