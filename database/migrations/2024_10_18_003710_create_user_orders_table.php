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
        Schema::create('user_orders', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('user_id');
            $table->string('first_name');
            $table->string('last_name');
            $table->string('mobile_no');
            $table->string('floor_unit_no');
            $table->string('island');
            $table->string('regions');
            $table->string('province');
            $table->string('municipality');
            $table->string('barangay');
            $table->string('order_image');
            $table->string('order_label');
            $table->integer('order_price');
            $table->integer('order_total');
            $table->integer('order_quantity');
            $table->enum('status', ['cancelled','pending','out-of-delivery','received','completed']);
            $table->string('date_order');
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_orders');
    }
};
