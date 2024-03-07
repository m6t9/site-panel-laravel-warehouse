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

class MakeTestData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:test_data';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Наполнение тестовыми данными';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info($this->description);

        $History = new History;
        $History->delete();

        $domains = Domain::orderBy('id', 'asc')->get();

        if ($domains->isNotEmpty()) {

            for ($i = 6 * 30; $i >= 0; $i--) {
                $date = date('Y-m-d', strtotime('-' . $i . ' days'));

                $traffic_all = 0;
                foreach ($domains as $domain) {
                    $update = [];

                    // Трафик по доменам
                    $update['traffic'] = $domain->id * 10 + rand(0, 50);

                    $update['traffic_info'] = json_encode([
                        'date'   => $date.' 00:00:00',
                        'source' => 'Yandex',
                    ]);

                    History::Create([
                        'date' => $date,
                        'type' => 'traffic_domain_'.$domain->id,
                        'value' => $update['traffic'],
                    ]);
                    $traffic_all+= $update['traffic'];

                    // index_yandex_domain
                    $update['index_yandex'] = $domain->id * 10 + rand(100, 200);
                    $update['index_yandex_info'] = json_encode([
                        'date'   => $date.' 00:00:00',
                    ]);

                    History::Create([
                        'date' => $date,
                        'type' => 'index_yandex_domain_'.$domain->id,
                        'value' => $update['index_yandex'],
                    ]);

                    // yandex_x_domain
                    $update['yandex_x'] = $domain->id * 10 + rand(0, 10);
                    $update['yandex_x_info'] = json_encode([
                        'date'   => $date.' 00:00:00',
                    ]);

                    History::Create([
                        'date' => $date,
                        'type' => 'yandex_x_domain_'.$domain->id,
                        'value' => $update['yandex_x'],
                    ]);

                    //


                    $domain->update($update);
                }

                // Трафик общий
                History::Create([
                    'date'  => $date,
                    'type'  => 'traffic_all',
                    'value' => $traffic_all,
                ]);

            }
        }

        $this->info("\n");

        return Command::SUCCESS;
    }
}
