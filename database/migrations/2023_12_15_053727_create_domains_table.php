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
        Schema::create('domains', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->string('domain')->index();
            $table->date('expired')->nullable()->index();
            $table->date('domain_created')->nullable()->index();
            $table->text('whois')->nullable();

            $table->bigInteger('registrar_id')->nullable()->unsigned()->index();
            $table->bigInteger('hosting_id')->nullable()->unsigned()->index();

            $table->bigInteger('traffic')->default(0);
            $table->text('traffic_info')->nullable();

            $table->bigInteger('index_yandex')->default(0);
            $table->text('index_yandex_info')->nullable();

            $table->bigInteger('yandex_x')->default(0);
            $table->text('yandex_x_info')->nullable();

            $table->text('accounts_data')->nullable();
            $table->text('info')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('domains');
    }
};
