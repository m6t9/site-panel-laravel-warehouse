<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // Сбор информации о трафике, индексе и ИКС Яндекса
        $schedule->command('accounts_data:get')->dailyAt('04:00')->withoutOverlapping(30);

        // Сбор whois информации
        $schedule->command('whois:crawler')->dailyAt('05:00')->withoutOverlapping(30);

        // Наполнение истории
        $schedule->command('make:history')->dailyAt('05:50')->withoutOverlapping(30);

        // Удаление мусора
        $schedule->command('cleaner')->dailyAt('06:00')->withoutOverlapping(30);

    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
