<?php

namespace App\Console\Commands;

use App\Models\Domain;
use Illuminate\Console\Command;

use Iodev\Whois\Factory;

class WhoisCrawler extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'whois:crawler';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Сбор whois информации';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $this->info($this->description);

        $domains = Domain::orderBy('id', 'asc')->get();

        $date_fields = [
            'created',
            'expired',
            'updated',
        ];

        $whois_fields = [
            'created'      => 'creationDate',
            'expired'      => 'expirationDate',
            'updated'      => 'updatedDate',
            'whois_server' => 'whoisServer',
        ];

        if ($domains->isNotEmpty()) {

            $bar = $this->output->createProgressBar($domains->count());
            $bar->start();

            $cnt_success = 0;
            foreach ($domains as $domain) {
                $whois_info = [
                    'whois_date' => date('Y-m-d H:i:s'),
                ];

                $whois_load = null;
                try {
                    $whois_load = Factory::get()->createWhois()->loadDomainInfo($domain->domain);
                } catch (\Throwable $e) {
                    \Log::channel('command_whois_crawler')->info('whois catch:');
                    \Log::channel('command_whois_crawler')->info($e->getMessage());
                    $this->info($e->getMessage());
                }

                if ($whois_load) {
                    foreach ($whois_fields as $whois_key => $whois_field) {
                        if ($whois_load->$whois_field) {
                            $whois_info[$whois_key] = $whois_load->$whois_field;
                            if (in_array($whois_key, $date_fields)) {
                                $whois_info[$whois_key] = date('Y-m-d', $whois_info[$whois_key]);
                            }
                        }
                    }
                    $cnt_success++;
                }

                $update = [
                    'whois' => json_encode($whois_info, JSON_UNESCAPED_UNICODE),
                ];

                if (isset($whois_info['expired'])) {
                    $update['expired'] = $whois_info['expired'];
                }

                $domain->update($update);

                $bar->advance();
            }

            $bar->finish();
            $this->info('Наполнено: ' . $cnt_success . ' из ' . $domains->count());
        }

        $this->info("\n");

        return Command::SUCCESS;
    }
}
