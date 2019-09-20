<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class SubTagSubTagMetadataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sub_tag_sub_tag_metadata', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('sub_tag_id');
            $table->integer('sub_tag_metadata_id');;
            $table->timestamps();
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
        Schema::dropIfExists('sub_tag_sub_tag_metadata');
    }
}
