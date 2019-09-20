<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('firstname')->nullable();
            $table->string('lastname')->nullable();
            $table->string('username')->nullable();
            $table->string('provider')->nullable();
            $table->string('provider_id')->nullable();
            $table->boolean('is_block')->nullable();
            $table->boolean('is_block_payment')->nullable();

            $table->tinyInteger('create_lot')->nullable();
            $table->tinyInteger('buy_lot')->nullable();
            $table->tinyInteger('get_money')->nullable();

            $table->tinyInteger('online')->nullable();

            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
