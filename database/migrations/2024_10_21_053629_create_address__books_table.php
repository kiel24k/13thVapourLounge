<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('address__books', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id');
            $table->string('first_name');
            $table->string('last_name');
            $table->integer('mobile_number');
            $table->string('floor_unit_no');
            $table->string('province');
            $table->string('District');
            $table->string('Ward');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('address__books');
    }
};
