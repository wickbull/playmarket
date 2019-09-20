<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

class AddFieldsToUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function ($table) {
            $table->ipAddress('ip')->nullable();
            $table->string('phone')->nullable();
            $table->string('rating')->default(0);
            $table->double('balance', 10, 3)->default(0)->nullable();
            $table->string('status')->nullable();
            $table->boolean('confirmed')->default(0);
            $table->boolean('confirmed_rules')->default(0);
            $table->string('confirmation_code')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function ($table) {
            $table->dropColumn('ip');
            $table->dropColumn('phone');
            $table->dropColumn('rating');
            $table->dropColumn('balance');
            $table->dropColumn('status');
            $table->dropColumn('confirmed');
            $table->dropColumn('confirmation_code');
            $table->dropColumn('confirmed_rules');

        });
    }
}
