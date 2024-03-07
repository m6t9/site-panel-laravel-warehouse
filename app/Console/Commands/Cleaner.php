<?php

namespace App\Console\Commands;

use App\Classes\GoogleAnalytics;
use App\Classes\LiCounter;

use App\Classes\YandexWebmaster;
use App\Classes\YandexXml;
use App\Models\Domain;
use App\Models\History;
use AXP\YaMetrika\Client;
use AXP\YaMetrika\YaMetrika;
use DateTime;
use Illuminate\Console\Command;

class Cleaner extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cleaner';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Удаление мусора';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info($this->description);

        // Очистка истории
        History::where('date', '<', date('Y-m-d', strtotime('-365 days')))->delete();

        $this->info("\n");
        return Command::SUCCESS;
    }
}
