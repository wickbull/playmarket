<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class PaymentHistories extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payment_histories', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('money')->nullable();
            $table->integer('user_id')->nullable();
            $table->integer('amount')->nullable();
            $table->integer('price')->nullable();
            $table->integer('payment_system')->nullable();

            $table->text('description')->nullable();

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
        Schema::dropIfExists('payment_histories');
    }
}
