<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LotSubTags extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lot_sub_tags', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('lot_id')->unsigned();
            $table->integer('sub_tag_id')->unsigned();
            $table->integer('sub_tag_value_id')->unsigned()->nullable();;
            $table->string('other_value')->nullable();
            $table->timestamps();

            $table->foreign('lot_id')
                ->references('id')
                ->on('lots')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('sub_tag_id')
                ->references('id')
                ->on('sub_tags')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('sub_tag_value_id')
                ->references('id')
                ->on('sub_tag_metadatas')
                ->onDelete('cascade')
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
        Schema::table('lot_sub_tags', function (Blueprint $table) {
            $table->dropForeign('lot_sub_tags_lot_id_foreign');
            $table->dropForeign('lot_sub_tags_sub_tag_id_foreign');
            $table->dropForeign('lot_sub_tags_sub_tag_value_id_foreign');

        });
        Schema::dropIfExists('lot_sub_tags');
    }
}
