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

class MakeHystory extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:history';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Наполнение истории';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info($this->description);

        // Вчера
        $date = date('Y-m-d', strtotime('-1 day'));

        $domains = Domain::orderBy('id', 'asc')->get();

        if ($domains->isNotEmpty()) {

            $traffic_all = 0;

            foreach ($domains as $domain) {

                // traffic
                History::firstOrCreate([
                    'date' => $date,
                    'type' => 'traffic_domain_'.$domain->id,
                ], [
                    'value' => (int)$domain->traffic,
                ]);
                $traffic_all+= (int)$domain->traffic;

                // index_yandex
                History::firstOrCreate([
                    'date' => $date,
                    'type' => 'index_yandex_domain_'.$domain->id,
                ], [
                    'value' => (int)$domain->index_yandex,
                ]);

                // yandex_x
                History::firstOrCreate([
                    'date' => $date,
                    'type' => 'yandex_x_domain_'.$domain->id,
                ], [
                    'value' => (int)$domain->yandex_x,
                ]);

            }

            // traffic all
            History::firstOrCreate([
                'date' => $date,
                'type' => 'traffic_all',
            ], [
                'value' => $traffic_all,
            ]);

        }

        $this->info("\n");
        return Command::SUCCESS;
    }
}
