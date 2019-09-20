<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChatDisputsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chat_disputs', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('dialog_id')->unsigned()->nullable();
            $table->text('reason')->nullable();
            $table->integer('admin_id')->unsigned()->nullable();
            $table->boolean('status')->default('1');
            $table->dateTime('closed_at')->nullable();
            $table->timestamps();

            $table->foreign('admin_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade');

            $table->foreign('dialog_id')
                ->references('id')
                ->on('dialogs')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('chat_disputs', function (Blueprint $table) {
            $table->dropForeign('chat_disputs_dialog_id_foreign');
            $table->dropForeign('chat_disputs_admin_id_foreign');
        });
        Schema::dropIfExists('chat_disputs');
    }
}
