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
        Schema::create('content_management', function (Blueprint $table) {
            $table->id();
            $table->text('caption');
            $table->text('details');
            $table->enum('status', ['published', 'unpublished']);
            $table->enum('type', ['title_tag','hero','about_us','service', 'contacts' ]);
            $table->string('image')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('content_management');
    }
};
