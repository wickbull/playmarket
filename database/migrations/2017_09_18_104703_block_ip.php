<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class BlockIp extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('block_ips', function (Blueprint $table) {
            $table->increments('id');
            $table->ipAddress('ip')->nullable();
            $table->integer('user_id')->unsigned()->nullable();
            $table->dateTime('from');
            $table->dateTime('to');
            $table->timestamps();
            $table->softDeletes();

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
        Schema::table('block_ips', function (Blueprint $table) {
            $table->dropForeign('block_ips_user_id_foreign');
        });
        Schema::dropIfExists('block_ips');
    }
}
