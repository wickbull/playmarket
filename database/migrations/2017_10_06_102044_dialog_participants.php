<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DialogParticipants extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dialog_participants', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->unsigned()->nullable();
            $table->integer('dialog_id')->unsigned();
            $table->dateTime('last_read')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onUpdate('set null')
                ->onDelete('set null');
            $table->foreign('dialog_id')
                ->references('id')
                ->on('dialogs')
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
        Schema::table('dialog_participants', function (Blueprint $table) {
            $table->dropForeign('dialog_participants_user_id_foreign');
            $table->dropForeign('dialog_participants_dialog_id_foreign');

        });
        Schema::dropIfExists('dialog_participants');
    }
}
