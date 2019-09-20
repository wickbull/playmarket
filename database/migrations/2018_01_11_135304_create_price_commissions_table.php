<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePriceCommissionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('price_commissions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title');
            $table->string('keyword');
            $table->string('operation_result')->nullable();
            $table->string('symbol')->nullable();
            $table->double('coefficient', 10, 6)->nullable();
            $table->double('site', 5, 2)->nullable();
            $table->double('payment', 5, 2)->nullable();
            $table->double('withdrawal', 5, 2)->nullable();
            $table->double('other', 5, 2)->nullable();
            $table->double('output_commission', 5, 2)->default(0);
            $table->smallInteger('priority')->unsigned()->nullable();
            $table->boolean('is_active')->nullable();
            $table->boolean('can_withdrawal')->nullable()->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('price_commissions');
    }
}
