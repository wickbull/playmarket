<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DialogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dialog_messages', function (Blueprint $table) {
            $table->increments('id');
            $table->text('text');
            $table->integer('seen')->nullable();
            $table->integer('sender_id')->unsigned()->nullable();
            $table->integer('dialog_id')->unsigned();
            $table->integer('lot_id')->unsigned()->nullable();

            $table->timestamps();
            $table->softDeletes();

            $table->foreign('sender_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreign('dialog_id')
                ->references('id')
                ->on('dialogs')
                ->onUpdate('cascade')
                ->onDelete('cascade');
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
        Schema::table('dialog_messages', function (Blueprint $table) {
            $table->dropForeign('dialog_messages_sender_id_foreign');
            $table->dropForeign('dialog_messages_dialog_id_foreign');
            $table->dropForeign('dialog_messages_lot_id_foreign');

        });
        Schema::dropIfExists('dialog_messages');
    }
}
