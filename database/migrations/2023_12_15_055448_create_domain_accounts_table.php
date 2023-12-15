<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('domain_accounts', function (Blueprint $table) {
            $table->id();

            $table->foreignId('domain_id')->nullable()->references('id')->on('domains')->onDelete('cascade');
            $table->foreignId('account_id')->nullable()->references('id')->on('accounts')->onDelete('cascade');
            $table->Integer('order')->nullable()->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('domain_accounts');
    }
};
