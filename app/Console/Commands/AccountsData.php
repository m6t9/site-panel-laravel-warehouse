<?php

namespace App\Console\Commands;

use App\Classes\GoogleAnalytics;
use App\Classes\LiCounter;

use App\Classes\YandexWebmaster;
use App\Classes\YandexXml;
use App\Models\Domain;
use AXP\YaMetrika\Client;
use AXP\YaMetrika\YaMetrika;
use DateTime;
use Illuminate\Console\Command;

class AccountsData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'accounts_data:get';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Сбор информации о трафике, индексе и ИКС Яндекса';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info($this->description);

        $domains = Domain::orderBy('id', 'asc')->get();

        if ($domains->isNotEmpty()) {
            $bar = $this->output->createProgressBar($domains->count());
            $bar->start();

            $YandexWebmaster = new YandexWebmaster();

            $cnt_traffic_success = 0;
            $cnt_index_yandex_success = 0;
            $cnt_x_yandex_success = 0;

            foreach ($domains as $domain) {
                $accounts = $domain->accounts;
                $domain_accounts_data = $domain->accounts_data_array();

                $update = [];

                if (!empty($accounts)) {
                    foreach ($accounts as $account) {

                        $account_data = $account->account_data_array();

                        switch ($account['type']) {
                            case 'li':
                                if (!isset($update['traffic'])) {
                                    $SeoLiCnt = new LiCounter();
                                    $metric = $SeoLiCnt->get_count_open($domain->domain);
                                    $update['traffic'] = (int)$metric;
                                    $update['traffic_info'] = json_encode([
                                        'date'   => date('Y-m-d H:i:s'),
                                        'source' => 'Liveinternet',
                                    ]);
                                    $cnt_traffic_success++;
                                }
                                break;
                            case 'yandex_metrika':
                                // https://github.com/axp-dev/ya-metrika
                                if (!isset($update['traffic'])) {
                                    if (!empty($domain_accounts_data['yandex_metrika_counter_id'])) {

                                        try {
                                            $client = new Client($account_data['token'],
                                                $domain_accounts_data['yandex_metrika_counter_id']);
                                            $ya_metrika = new YaMetrika($client);

                                            $visitors = $ya_metrika->getVisitorsForPeriod(new DateTime('-1day'),
                                                new DateTime('-1day'));
                                        } catch (\Throwable $e) {
                                            \Log::channel('command_accounts_data')->info('ya_metrika catch:');
                                            \Log::channel('command_accounts_data')->info($e->getMessage());
                                            $this->info($e->getMessage());
                                        }

                                        $visitors_format = $visitors->formatData();
                                        if (!empty($visitors_format['totals']) and isset($visitors_format['totals']['users'])) {
                                            $update['traffic'] = (int)$visitors_format['totals']['users'];
                                            $update['traffic_info'] = json_encode([
                                                'date'   => date('Y-m-d H:i:s'),
                                                'source' => 'Yandex',
                                            ]);
                                            $cnt_traffic_success++;
                                        }
                                    }
                                }
                                break;
                            case 'yandex_webmaster':
                                // https://yandex.ru/dev/webmaster/
                                if (!isset($update['index_yandex'])) {

                                    try {
                                        if ($YandexWebmaster->set_token($account_data['token'])){

                                            $summary = $YandexWebmaster->get_summary($domain->domain);

                                            if (!is_null($summary)){

                                                if (isset($summary['searchable_pages_count'])) {
                                                    $in_index = (int)$summary['searchable_pages_count'];
                                                    $update['index_yandex'] = $in_index;
                                                    $update['index_yandex_info'] = json_encode([
                                                        'date'    => date('Y-m-d H:i:s'),
                                                    ]);

                                                    $cnt_index_yandex_success++;
                                                }

                                                if (isset($summary['sqi'])) {
                                                    $yandex_x = (int)$summary['sqi'];
                                                    $update['yandex_x'] = $yandex_x;
                                                    $update['yandex_x_info'] = json_encode([
                                                        'date'    => date('Y-m-d H:i:s'),
                                                    ]);

                                                    $cnt_x_yandex_success++;
                                                }

                                            } else {
                                                \Log::channel('command_accounts_data')->info('yandex_webmaster in_index is_null: '.$domain->domain);
                                                \Log::channel('command_accounts_data')->info('error: '.$YandexWebmaster->last_error);
                                            }

                                        } else {
                                            \Log::channel('command_accounts_data')->info('yandex_webmaster set_token error: '.$YandexWebmaster->last_error);
                                        }

                                    } catch (\Throwable $e) {
                                        \Log::channel('command_accounts_data')->info('yandex_webmaster catch:');
                                        \Log::channel('command_accounts_data')->info($e->getMessage());
                                        $this->info($e->getMessage());
                                    }

                                }
                                break;
                        }
                    }
                }

                if (!empty($update)) {
                    $domain->update($update);
                }

                sleep(1);
            }
            $bar->finish();
            $this->info('');
            $this->info('Доменов: ' . $domains->count());
            $this->info('Наполнено traffic: ' . $cnt_traffic_success);
            $this->info('Наполнено index yandex: ' . $cnt_index_yandex_success);
            $this->info('Наполнено yandex X: ' . $cnt_x_yandex_success);
        }

        $this->info("\n");

        return Command::SUCCESS;
    }
}
